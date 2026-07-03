# Go.Sign - Signed-commit bootstrap.
# Idempotent. Run standalone or from Go.Fe Identity step.
#
# Algorithm:
#   1. Sanity check tools (git, gh, gpg).
#   2. Verify gh auth.
#   3. Read canonical identity from gh api user.
#   4. Find a usable local GPG key matching the identity:
#      a. If signingkey is set and key is in keyring, healthy -- exit.
#      b. If a local key matches the email, rewire signingkey to it.
#      c. Otherwise, generate fresh 4096-bit RSA key.
#   5. If we generated a new key (or the option flag is set), register
#      pubkey with GitHub via gh gpg-key add (requires write:gpg_key scope;
#      script triggers gh auth refresh once if missing).
#   6. Smoke test in a scratch repo: git commit --allow-empty must succeed.
#
# Prints [OK] / [FAIL] markers, nothing more.
# All ASCII. No emoji. No smart quotes. Project DoD P1.

$ErrorActionPreference = 'Continue'

function Say($msg)  { Write-Host "  $msg" }
function OK($msg)   { Write-Host "  [OK] $msg" }
function Fail($msg) { Write-Host "  [FAIL] $msg" -ForegroundColor Red; exit 1 }
function Warn($msg) { Write-Host "  [WARN] $msg" -ForegroundColor Yellow }

Write-Host ""
Write-Host "  ============================================"
Write-Host "  Go.Sign -- signed-commit bootstrap"
Write-Host "  ============================================"
Write-Host ""

# ---- Step 1: Sanity ----
# Add Git's bundled gpg to PATH if not already visible. Mirrors the npm
# resolution pattern in Go.Fe.ps1 -- explicit path probe for tools that
# aren't always on the session PATH.
$gpgKnownPath = "C:\Program Files\Git\usr\bin"
if ((Test-Path "$gpgKnownPath\gpg.exe") -and ($env:PATH -notlike "*$gpgKnownPath*")) {
    $env:PATH = "$env:PATH;$gpgKnownPath"
}
foreach ($tool in @('git', 'gh')) {
    if (-not (Get-Command $tool -ErrorAction SilentlyContinue)) {
        Fail "$tool not found on PATH. Run install.bat first."
    }
}
# gpg is OPTIONAL -- only the GPG signing path needs it. SSH signing (the
# default on this fleet) needs nothing but git + ssh-keygen. Don't Fail here.
$gpgPresent = [bool](Get-Command gpg -ErrorAction SilentlyContinue)
OK ("tools present (git, gh" + $(if ($gpgPresent) { ", gpg" } else { "" }) + ")")

# ---- Step 2: gh auth ----
$ghStatusOut = & gh auth status 2>&1
if ($LASTEXITCODE -ne 0) {
    Fail "gh not authenticated. Run: gh auth login"
}
OK "gh authenticated"

# ---- Step 2.5: SSH signing short-circuit ----
# If git is already configured for SSH commit signing, that is the whole job.
# An SSH signing key is NOT a GPG key -- it never appears in the GPG keyring,
# so the GPG path below would (wrongly) decide it is "missing" and try to mint
# a fresh 4096-bit GPG key. On a box with a wedged keyboxd that fails loudly on
# every launch. SSH signing needs no GPG at all -- verify and exit clean.
$signFormat = (& git config --global --get gpg.format)
if ($signFormat) { $signFormat = $signFormat.Trim() }
if ($signFormat -eq 'ssh') {
    $sshKey = (& git config --global --get user.signingkey)
    if ($sshKey) { $sshKey = $sshKey.Trim().Trim('"') }
    # signingkey may be a path to a .pub, a path to the private key, or a
    # literal "ssh-ed25519 AAAA..." string. Resolve to the public material.
    $keyFile = $null
    if ($sshKey -and (Test-Path $sshKey)) {
        $keyFile = $sshKey
    } elseif ($sshKey -and (Test-Path "$sshKey.pub")) {
        $keyFile = "$sshKey.pub"
    }
    if ($keyFile -or ($sshKey -like 'ssh-*')) {
        OK "signing format is ssh (no GPG needed)"
        if ($keyFile) { Say "signing key: $keyFile" } else { Say "signing key: inline ssh key" }
        if (-not (& git config --global --get commit.gpgsign)) {
            & git config --global commit.gpgsign true
            Say "enabled commit.gpgsign"
        }
        # Smoke test: a signed empty commit must verify locally.
        Say "smoke test (signed commit in scratch repo)..."
        $smokeDir = Join-Path $env:TEMP "metal-sign-smoke-$(Get-Random)"
        New-Item -ItemType Directory -Path $smokeDir | Out-Null
        Push-Location $smokeDir
        try {
            & git init -q
            $commitOut = & git commit --allow-empty -m "metal Go.Sign ssh smoke" 2>&1
            if ($LASTEXITCODE -ne 0) {
                $commitOut | Out-Host
                Fail "ssh-signed smoke commit failed -- check the key + ssh-keygen on PATH"
            }
            $sigOut = & git log --show-signature -1 2>&1
            if ($sigOut -match 'Good "git" signature' -or $sigOut -match 'Good signature') {
                OK "ssh-signed smoke commit verified locally"
            } else {
                Warn "commit signed but local verify needs allowed_signers (gpg.ssh.allowedSignersFile)"
            }
        } finally {
            Pop-Location
            Remove-Item $smokeDir -Recurse -Force -ErrorAction SilentlyContinue
        }
        # Register the SSH public key with GitHub as a SIGNING key. Without this
        # the commit verifies locally but shows "Unverified" on GitHub -- an SSH
        # signing key must be registered with type=signing (distinct from an auth
        # key). Non-fatal: warn + the exact manual command; never block the box.
        $pubForGh = $null
        $tmpPub = $null
        if ($keyFile -and ($keyFile -like '*.pub')) {
            $pubForGh = $keyFile
        } elseif ($keyFile -and (Test-Path "$keyFile.pub")) {
            $pubForGh = "$keyFile.pub"
        } elseif ($sshKey -like 'ssh-*') {
            $tmpPub = Join-Path $env:TEMP "metal-ssh-signing-$(Get-Random).pub"
            [System.IO.File]::WriteAllText($tmpPub, $sshKey, [System.Text.Encoding]::ASCII)
            $pubForGh = $tmpPub
        }
        if ($pubForGh -and (Test-Path $pubForGh)) {
            $pubBody = (Get-Content $pubForGh -Raw).Trim()
            $pubKeyToken = ($pubBody -split '\s+')[1]
            $hostName = $env:COMPUTERNAME
            $registered = $false
            $existing = & gh api user/ssh_signing_keys --jq '.[].key' 2>$null
            if (($LASTEXITCODE -eq 0) -and $existing -and $pubKeyToken) {
                foreach ($k in $existing) {
                    if ($k -match [regex]::Escape($pubKeyToken)) { $registered = $true }
                }
            }
            if ($registered) {
                OK "ssh signing key already registered with GitHub"
            } else {
                & gh ssh-key add --type signing $pubForGh --title "metal signing $hostName" 2>&1 | Out-Host
                if ($LASTEXITCODE -eq 0) {
                    OK "registered ssh signing key with GitHub (commits will show Verified)"
                } else {
                    Warn "could not register ssh signing key (gh scope admin:ssh_signing_key may be missing)."
                    Warn "When ready: gh ssh-key add --type signing `"$pubForGh`" --title `"metal signing $hostName`""
                }
            }
        } else {
            Warn "ssh signing key registered locally but no public key file found to register with GitHub -- commit may show Unverified."
        }
        if ($tmpPub) { Remove-Item $tmpPub -Force -ErrorAction SilentlyContinue }
        Write-Host ""
        Write-Host "  ============================================"
        Write-Host "  Go.Sign ready -- ssh signing"
        Write-Host "  ============================================"
        Write-Host ""
        exit 0
    } else {
        Warn "gpg.format is ssh but user.signingkey ($sshKey) not found -- falling through"
    }
}

# ---- Step 3: Identity from gh ----
# (GPG signing path -- only reached when gpg.format is not ssh.)
if (-not $gpgPresent) {
    Fail "gpg.format is not ssh and gpg is not installed. Either install gpg, or set ssh signing: git config --global gpg.format ssh"
}
$meJson = & gh api user
if ($LASTEXITCODE -ne 0) { Fail "gh api user failed (exit $LASTEXITCODE)" }
$me = $meJson | ConvertFrom-Json
$ghName  = $me.name
$ghLogin = $me.login
$ghId    = $me.id
$ghEmail = $me.email
if (-not $ghEmail) {
    # GitHub hides email by default, and user/emails needs the "user" OAuth
    # scope most gh tokens lack. Try it quietly -- a 404 here is expected
    # and non-fatal, not an error worth printing.
    $emailsJson = & gh api user/emails 2>$null
    if (($LASTEXITCODE -eq 0) -and $emailsJson) {
        $emails = $emailsJson | ConvertFrom-Json
        $primary = $emails | Where-Object { $_.primary -and $_.verified } | Select-Object -First 1
        if ($primary) { $ghEmail = $primary.email }
    }
}
if (-not $ghEmail) {
    # Final fallback: GitHub's noreply commit email. Built from login + id
    # (both already in gh api user, no extra scope), and push-accepted.
    if ($ghLogin -and $ghId) {
        $ghEmail = "$ghId+$ghLogin@users.noreply.github.com"
        OK "using GitHub noreply email $ghEmail"
    } else {
        Fail "could not resolve GitHub identity (login/id missing from gh api user)."
    }
}
if (-not $ghName)  { $ghName  = $ghLogin }
Say "identity: $ghName <$ghEmail> (gh login: $ghLogin)"

# ---- Step 4: Find or generate key ----
function Get-LocalKeyForEmail($email) {
    # Returns the long key ID (16 hex) of a secret key matching the email,
    # or $null if none found. Picks the most recent one.
    $colons = & gpg --list-secret-keys --keyid-format LONG --with-colons
    if (-not $colons) { return $null }
    $currentKey = $null
    $matchingKey = $null
    $matchingDate = 0
    foreach ($line in $colons) {
        if ($line -like 'sec:*') {
            $parts = $line -split ':'
            $currentKey = $parts[4]   # field 5 = long key ID
            $created = 0
            if ($parts.Count -gt 5) { [int]::TryParse($parts[5], [ref]$created) | Out-Null }
            $script:_pendingKey = $currentKey
            $script:_pendingDate = $created
        } elseif ($line -like 'uid:*' -and $script:_pendingKey) {
            if ($line -like "*<$email>*") {
                if ($script:_pendingDate -ge $matchingDate) {
                    $matchingKey = $script:_pendingKey
                    $matchingDate = $script:_pendingDate
                }
            }
        }
    }
    return $matchingKey
}

$currentSigningKey = & git config --global --get user.signingkey
if ($currentSigningKey) { $currentSigningKey = $currentSigningKey.Trim() }

$keyToUse = $null
$generatedNew = $false

# 4a. Is the current signingkey usable?
if ($currentSigningKey) {
    & gpg --list-secret-keys $currentSigningKey > $null 2>&1
    if ($LASTEXITCODE -eq 0) {
        $keyToUse = $currentSigningKey
        OK "current signingkey ($currentSigningKey) is present in keyring"
    } else {
        Warn "current signingkey ($currentSigningKey) is missing from keyring"
    }
}

# 4b. Look for any local key matching the GitHub email
if (-not $keyToUse) {
    $localKey = Get-LocalKeyForEmail $ghEmail
    if ($localKey) {
        $keyToUse = $localKey
        OK "found local key matching ${ghEmail}: $keyToUse"
    }
}

# 4c. Generate fresh
if (-not $keyToUse) {
    Say "no usable key found -- generating fresh 4096-bit RSA..."
    # Clear stale gpg-agent / keyboxd locks first. The "database_open waiting
    # for lock" + "SQL library used incorrectly" failure is a wedged keyboxd
    # holding the keybox; restarting the daemons releases it.
    & gpgconf --kill all 2>&1 | Out-Null
    $batch = @"
%no-protection
Key-Type: RSA
Key-Length: 4096
Subkey-Type: RSA
Subkey-Length: 4096
Name-Real: $ghName
Name-Email: $ghEmail
Expire-Date: 0
%commit
"@
    $batchFile = Join-Path $env:TEMP "metal-gpg-batch.txt"
    [System.IO.File]::WriteAllText($batchFile, $batch, [System.Text.Encoding]::ASCII)
    & gpg --batch --gen-key $batchFile 2>&1 | Out-Host
    $genExit = $LASTEXITCODE
    Remove-Item $batchFile -Force -ErrorAction SilentlyContinue
    if ($genExit -ne 0) { Fail "gpg key generation failed (exit $genExit)" }

    $keyToUse = Get-LocalKeyForEmail $ghEmail
    if (-not $keyToUse) { Fail "key generated but could not be located in keyring" }
    OK "generated new key: $keyToUse"
    $generatedNew = $true
}

# ---- Step 5: Wire git config ----
& git config --global user.signingkey $keyToUse
& git config --global user.name $ghName
& git config --global user.email $ghEmail
& git config --global commit.gpgsign true
$gpgPath = "C:/Program Files/Git/usr/bin/gpg.exe"
if (Test-Path $gpgPath) { & git config --global gpg.program $gpgPath }
OK "git config wired to $keyToUse"

# ---- Step 6: Optional GitHub registration (if we generated a new key) ----
if ($generatedNew) {
    # Need write:gpg_key scope. Refresh if missing.
    $hasScope = $ghStatusOut -match 'write:gpg_key'
    if (-not $hasScope) {
        Say "granting GPG-key scope to gh (browser will open)..."
        & gh auth refresh -h github.com -s write:gpg_key
        if ($LASTEXITCODE -ne 0) {
            Warn "gh auth refresh did not complete -- key NOT registered with GitHub."
            Warn "When ready: gh auth refresh -h github.com -s write:gpg_key"
            Warn "Then:       gpg --armor --export $keyToUse | gh gpg-key add -"
        } else {
            $hasScope = $true
        }
    }
    if ($hasScope) {
        $pubFile = Join-Path $env:TEMP "metal-gpg-pub-$keyToUse.asc"
        & gpg --armor --export $keyToUse | Set-Content -Path $pubFile -Encoding ascii
        & gh gpg-key add $pubFile 2>&1 | Out-Host
        $addExit = $LASTEXITCODE
        Remove-Item $pubFile -Force -ErrorAction SilentlyContinue
        if ($addExit -eq 0) {
            OK "registered $keyToUse with GitHub"
        } else {
            Warn "gh gpg-key add returned $addExit (key may already be registered)"
        }
    }
}

# ---- Step 7: Smoke test ----
Say "smoke test (commit in scratch repo)..."
$smokeDir = Join-Path $env:TEMP "metal-sign-smoke-$(Get-Random)"
New-Item -ItemType Directory -Path $smokeDir | Out-Null
Push-Location $smokeDir
try {
    & git init -q
    $commitOut = & git commit --allow-empty -m "metal Go.Sign smoke" 2>&1
    if ($LASTEXITCODE -ne 0) {
        $commitOut | Out-Host
        Fail "smoke commit failed -- signing still broken"
    }
    $sigOut = & git log --show-signature -1 2>&1
    $verified = $sigOut -match 'Good signature'
    if (-not $verified) {
        $sigOut | Out-Host
        Warn "commit succeeded but signature did not verify locally (may be missing trust DB import)"
    } else {
        OK "smoke commit signed and locally verified"
    }
} finally {
    Pop-Location
    Remove-Item $smokeDir -Recurse -Force -ErrorAction SilentlyContinue
}

# ---- Step 8: Operator code-signing (optional, non-fatal) ----
# Go.Sign bootstraps the operator's signing identity for COMMITS (above) AND
# BINARIES (here) -- same operator, one authority. The binary code-signing
# implementation lives in the Security by Pantheon product (security/signing/);
# metal only ORCHESTRATES it (kernel Rule 2). Idempotent: skips if the
# code-signing cert already exists; skips silently if the product tooling is not
# present on this box (commits stay signed regardless).
Write-Host ""
Say "code-signing (operator binaries)..."
$csTool = $null
$csCands = @(
    (Join-Path $PSScriptRoot "..\nous\security\signing\issue-codesign-cert.ps1"),
    "C:\nous\security\signing\issue-codesign-cert.ps1",
    "C:\kastil-systems\security\signing\issue-codesign-cert.ps1"
)
# Only add the KASTIL_SECURITY candidate when the env var is set -- Join-Path
# throws on an empty Path, which spewed an error on every box without it.
if ($env:KASTIL_SECURITY) { $csCands += (Join-Path $env:KASTIL_SECURITY "signing\issue-codesign-cert.ps1") }
foreach ($cand in $csCands) {
    if ($cand -and (Test-Path $cand)) { $csTool = (Resolve-Path $cand).Path; break }
}

if (-not $csTool) {
    Say "Security by Pantheon signing tooling not found on this box -- skipping (commits still signed)."
} else {
    $csCert = Get-ChildItem "Cert:\CurrentUser\My" -CodeSigningCert -ErrorAction SilentlyContinue |
        Where-Object { $_.Subject -like "*Kastil Systems Code Signing*" } | Select-Object -First 1
    if ($csCert) {
        OK "operator code-signing cert present ($($csCert.Thumbprint))"
    } else {
        Say "no operator code-signing cert yet. The product can mint one (ECDSA, under your authority)."
        $ans = Read-Host "  Set up operator code-signing now? [Y/N]"
        if ($ans -eq 'y' -or $ans -eq 'Y') {
            & $csTool
            if (-not $LASTEXITCODE) { OK "code-signing cert issued -- see output above" }
            else { Warn "code-signing setup returned $LASTEXITCODE (non-fatal)" }
        } else {
            Say "skipped. Run later: $csTool"
        }
    }
    Say "fleet WDAC allow-by-signer is a separate, audit-first step: security/signing/README.md"
}

Write-Host ""
Write-Host "  ============================================"
Write-Host "  Go.Sign ready -- $keyToUse"
Write-Host "  Try a real commit."
Write-Host "  ============================================"
Write-Host ""
