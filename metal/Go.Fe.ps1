# metal.Fe - Iron. Dev tools, identity, auth.
# PowerShell launcher - immune to line ending issues.
#
# Usage:
#   Go.Fe.ps1              full Iron: dev tools + hardening + identity + auth
#   Go.Fe.ps1 -ToolsOnly   dev tools + dev-box hardening ONLY (no identity/auth)
#
# The tools.* runners call this with -ToolsOnly; the iron.* runners call it bare.
param([switch]$ToolsOnly)

$VERSION = "2.1"

Write-Host ""
Write-Host "  ============================================"
Write-Host "  metal.Fe - Iron. Dev tools, identity, auth."
Write-Host "  ============================================"
Write-Host ""

# -- Step 1: Dev tools --
if (-not (Test-Path "$env:APPDATA\metal")) { New-Item -ItemType Directory -Path "$env:APPDATA\metal" -Force | Out-Null }

$toolsCurrent = $false
$toolsDoneFile = "$env:APPDATA\metal\.tools-done"
if (Test-Path $toolsDoneFile) {
    $toolsVer = (Get-Content $toolsDoneFile -Raw).Trim()
    if ($toolsVer -eq $VERSION) { $toolsCurrent = $true }
}

if ($toolsCurrent) {
    Write-Host "[Fe 1/3] Dev tools already installed (v$VERSION). Skipping."
} else {
    if (Test-Path $toolsDoneFile) { Write-Host "[Fe 1/3] Dev tools installed for older version. Updating..." }
    Write-Host ""
    Write-Host "-- Fe STEP 1: Dev Tools --"
    Write-Host "Git, GCC, Python, Node, Rust, .NET 8 SDK, gh, gcloud, Claude, Wrangler, Snowflake, Playwright + chromium, browsers."
    Write-Host ""
    $tools = Read-Host "Install dev tools? [Y/N]"
    if ($tools -eq "n" -or $tools -eq "N") {
        Write-Host "  No. Skipping dev tools."
    } else {
        # Log setup
        $logDir = Join-Path $PSScriptRoot "logs"
        if (-not (Test-Path $logDir)) { New-Item -ItemType Directory -Path $logDir -Force | Out-Null }
        $logStamp = Get-Date -Format "yyyyMMdd_HHmm"
        $logFile = Join-Path $logDir "tools_$logStamp.log"
        $INSTALL_TIMEOUT = 300
        $okCount = 0; $skipCount = 0; $failCount = 0; $timeoutCount = 0

        function Log($msg) { if ($logFile) { "[$((Get-Date).ToString('yyyy-MM-dd HH:mm:ss'))] $msg" | Add-Content $logFile } }
        function Skip($name) { Log "SKIP $name -- already installed"; Write-Host "  ${name}: already installed. Skipping."; $script:skipCount++ }
        function RunInstall($label, $cmd) {
            Log "START $label"
            Log "CMD: $cmd"
            Write-Host "  Installing $label..."
            $tempCmd = "$env:TEMP\metal_run.cmd"
            "@$cmd" | Set-Content $tempCmd
            $ps1Content = @"
`$p = Start-Process -FilePath '$tempCmd' -PassThru -NoNewWindow -RedirectStandardOutput '$env:TEMP\metal_out.log' -RedirectStandardError '$env:TEMP\metal_err.log'
if (-not `$p.WaitForExit($($INSTALL_TIMEOUT * 1000))) {
    taskkill /T /F /PID `$(`$p.Id) 2>`$null
    exit 258
}
exit `$p.ExitCode
"@
            $ps1Content | Set-Content "$env:TEMP\metal_timeout.ps1"
            powershell -NoProfile -ExecutionPolicy Bypass -File "$env:TEMP\metal_timeout.ps1"
            $ec = $LASTEXITCODE
            if (Test-Path "$env:TEMP\metal_out.log") {
                Log "-- stdout --"
                Get-Content "$env:TEMP\metal_out.log" | Add-Content $logFile
                Remove-Item "$env:TEMP\metal_out.log" -Force 2>$null
            }
            if (Test-Path "$env:TEMP\metal_err.log") {
                Log "-- stderr --"
                Get-Content "$env:TEMP\metal_err.log" | Add-Content $logFile
                Remove-Item "$env:TEMP\metal_err.log" -Force 2>$null
            }
            if ($ec -eq 258) {
                Log "TIMEOUT $label -- exceeded ${INSTALL_TIMEOUT}s"
                Write-Host "  [TIMEOUT] $label -- exceeded ${INSTALL_TIMEOUT}s"
                $script:timeoutCount++
            } elseif ($ec -ne 0) {
                Log "FAIL $label -- exit code $ec"
                Write-Host "  [FAIL] $label -- exit $ec -- see log"
                $script:failCount++
            } else {
                Log "OK $label"
                Write-Host "  [OK] $label"
                $script:okCount++
            }
        }

        Log "metal tools install started"
        Log "Timeout per install: ${INSTALL_TIMEOUT}s"

        # Phase 1/3: Core dev tools (winget)
        Write-Host "[1/3] Core dev tools (winget)..."

        if (Get-Command git -ErrorAction SilentlyContinue) { Skip "Git" } else { RunInstall "Git" "winget install --id Git.Git -e --source winget --accept-source-agreements --accept-package-agreements" }

        # GCC + Make via MSYS2
        if (Test-Path "C:\msys64\ucrt64\bin\gcc.exe") {
            Skip "GCC (MSYS2)"
        } elseif (Get-Command gcc -ErrorAction SilentlyContinue) {
            Skip "GCC"
        } else {
            RunInstall "MSYS2" "winget install --id MSYS2.MSYS2 -e --source winget --accept-source-agreements --accept-package-agreements"
            if (Test-Path "C:\msys64\usr\bin\pacman.exe") {
                Write-Host "  Installing GCC + Make via MSYS2 pacman..."
                & "C:\msys64\usr\bin\pacman.exe" -S --noconfirm mingw-w64-ucrt-x86_64-gcc mingw-w64-ucrt-x86_64-make 2>&1 | Add-Content $logFile
                if (Test-Path "C:\msys64\ucrt64\bin\gcc.exe") {
                    Log "OK GCC + Make via MSYS2 pacman"
                    Write-Host "  [OK] GCC + Make via MSYS2 pacman"
                } else {
                    Log "FAIL pacman gcc install"
                    Write-Host "  [FAIL] pacman gcc install -- check log"
                    $failCount++
                }
            }
        }

        if (Get-Command gh -ErrorAction SilentlyContinue) { Skip "GitHub CLI" } else { RunInstall "GitHub CLI" "winget install --id GitHub.cli -e --source winget --accept-source-agreements --accept-package-agreements" }
        # Python: Get-Command alone matches the MS Store stub at WindowsApps,
        # which causes Skip on a laptop that has no real Python. Same defense
        # as the npm resolution at line ~138: filter out WindowsApps stubs and
        # verify a real python responds with a version string.
        $pyCmd = Get-Command python -ErrorAction SilentlyContinue
        $pyReal = $false
        if ($pyCmd -and ($pyCmd.Source -notlike "*WindowsApps*")) {
            $pyVer = & $pyCmd.Source --version 2>&1
            if ($LASTEXITCODE -eq 0 -and $pyVer -match '^Python ') { $pyReal = $true }
        }
        if ($pyReal) { Skip "Python" } else { RunInstall "Python 3.12" "winget install --id Python.Python.3.12 -e --source winget --accept-source-agreements --accept-package-agreements" }
        if (Get-Command node -ErrorAction SilentlyContinue) { Skip "Node.js" } else { RunInstall "Node.js LTS" "winget install --id OpenJS.NodeJS.LTS -e --source winget --accept-source-agreements --accept-package-agreements" }
        if (Get-Command gcloud -ErrorAction SilentlyContinue) { Skip "Google Cloud CLI" } else { RunInstall "Google Cloud CLI" "winget install --id Google.CloudSDK -e --source winget --accept-source-agreements --accept-package-agreements" }
        if (Get-Command rustup -ErrorAction SilentlyContinue) { Skip "Rust" } else { RunInstall "Rust" "winget install --id Rustlang.Rustup -e --source winget --accept-source-agreements --accept-package-agreements" }

        # .NET 8 SDK -- needed by the-last-test (tlt -> pw-worker.dll Playwright sidecar)
        # and any future managed-runtime project. Detect via dotnet --version OR by
        # default install path so a half-installed SDK doesn't re-trigger.
        $dotnetReal = $false
        $dotnetCmd = Get-Command dotnet -ErrorAction SilentlyContinue
        if ($dotnetCmd -and ($dotnetCmd.Source -notlike "*WindowsApps*")) {
            $dotnetVer = & $dotnetCmd.Source --version 2>&1
            if ($LASTEXITCODE -eq 0 -and $dotnetVer -match '^\d+\.\d+\.\d+') { $dotnetReal = $true }
        }
        if (-not $dotnetReal -and (Test-Path "$env:ProgramFiles\dotnet\dotnet.exe")) { $dotnetReal = $true; $env:PATH = "$env:ProgramFiles\dotnet;$env:PATH" }
        if ($dotnetReal) { Skip ".NET 8 SDK" }
        else { RunInstall ".NET 8 SDK" "winget install --id Microsoft.DotNet.SDK.8 -e --source winget --accept-source-agreements --accept-package-agreements" }

        if (Get-Command make -ErrorAction SilentlyContinue) { Skip "Make" }
        elseif (Test-Path "C:\msys64\ucrt64\bin\mingw32-make.exe") { Skip "Make (MSYS2)" }
        else { RunInstall "Make" "winget install --id GnuWin32.Make -e --source winget --accept-source-agreements --accept-package-agreements" }

        # Add MSYS2 ucrt64 to PATH if installed
        if (Test-Path "C:\msys64\ucrt64\bin") { $env:PATH = "C:\msys64\ucrt64\bin;$env:PATH" }
        # Add dotnet to PATH if installed in default location
        if (Test-Path "$env:ProgramFiles\dotnet") { $env:PATH = "$env:ProgramFiles\dotnet;$env:PATH" }

        Write-Host "  Done."

        # Phase 2/3: CLI tools (npm, pip)
        Write-Host "[2/3] CLI tools (npm, pip)..."

        # Add nodejs install dir explicitly -- Phase 1 winget install may not have
        # propagated to registry yet, so PATH refresh might not find npm otherwise.
        $nodeDir = "C:\Program Files\nodejs"
        $env:PATH = "$nodeDir;$env:PATH;$env:APPDATA\npm;$env:LOCALAPPDATA\Programs\Python\Python312;$env:LOCALAPPDATA\Programs\Python\Python312\Scripts"

        # Resolve npm to a concrete .cmd path -- bypasses any residual PATH issues
        # when invoking npm through RunInstall's temp-cmd wrapper.
        $npmCmd = $null
        foreach ($p in @("$nodeDir\npm.cmd", "$env:ProgramFiles\nodejs\npm.cmd", "${env:ProgramFiles(x86)}\nodejs\npm.cmd")) {
            if (Test-Path $p) { $npmCmd = $p; break }
        }
        if (-not $npmCmd) {
            $g = Get-Command npm -ErrorAction SilentlyContinue
            if ($g) { $npmCmd = $g.Source }
        }

        if (Get-Command python -ErrorAction SilentlyContinue) {
            Log "Upgrading pip..."
            Write-Host "  Ensuring pip is up to date..."
            & python -m ensurepip --upgrade 2>$null
            & python -m pip install --upgrade pip 2>&1 | Add-Content $logFile
        }

        if (-not $npmCmd) {
            Log "FAIL npm not found after Node install -- skipping Claude/Wrangler"
            Write-Host "  [FAIL] npm not on PATH after Node install. Open a new terminal and re-run Fe."
            $failCount += 2
        } else {
            Log "npm resolved to $npmCmd"
            if (Get-Command claude -ErrorAction SilentlyContinue) { Skip "Claude Code" } else { RunInstall "Claude Code" "`"$npmCmd`" install -g @anthropic-ai/claude-code" }
            if (Get-Command wrangler -ErrorAction SilentlyContinue) { Skip "Wrangler" } else { RunInstall "Wrangler" "`"$npmCmd`" install -g wrangler" }
        }
        if (Get-Command snow -ErrorAction SilentlyContinue) { Skip "Snowflake CLI" } else { RunInstall "Snowflake CLI" "python -m pip install snowflake-cli-labs" }

        # Playwright CLI -- dotnet-global tool used by tlt's pw-worker.dll.
        # Only attempt if dotnet is on PATH (was installed in Phase 1 above).
        if (Get-Command dotnet -ErrorAction SilentlyContinue) {
            $pwGlobalDir = "$env:USERPROFILE\.dotnet\tools"
            if ((Get-Command playwright -ErrorAction SilentlyContinue) -or (Test-Path "$pwGlobalDir\playwright.exe")) {
                Skip "Playwright CLI"
                if (Test-Path $pwGlobalDir) { $env:PATH = "$pwGlobalDir;$env:PATH" }
            } else {
                RunInstall "Playwright CLI" "dotnet tool install --global Microsoft.Playwright.CLI"
                if (Test-Path $pwGlobalDir) { $env:PATH = "$pwGlobalDir;$env:PATH" }
            }
        } else {
            Log "SKIP Playwright CLI -- dotnet not on PATH; install will retry on next Fe run"
            Write-Host "  Playwright CLI: dotnet missing -- skipped. Open new shell + re-run Fe."
        }

        Write-Host "  Done."

        # Phase 3/3: Browsers
        Write-Host "[3/3] Browsers..."

        if ((Test-Path "$env:ProgramFiles\Google\Chrome\Application\chrome.exe") -or (Test-Path "${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe")) { Skip "Chrome" } else { RunInstall "Chrome" "winget install --id Google.Chrome -e --source winget --accept-source-agreements --accept-package-agreements" }
        if (Test-Path "$env:ProgramFiles\Mozilla Firefox\firefox.exe") { Skip "Firefox" } else { RunInstall "Firefox" "winget install --id Mozilla.Firefox -e --source winget --accept-source-agreements --accept-package-agreements" }
        if (Test-Path "$env:ProgramFiles\BraveSoftware\Brave-Browser\Application\brave.exe") { Skip "Brave" } else { RunInstall "Brave" "winget install --id Brave.Brave -e --source winget --accept-source-agreements --accept-package-agreements" }
        if ((Test-Path "$env:LOCALAPPDATA\Programs\Opera\opera.exe") -or (Test-Path "$env:ProgramFiles\Opera\opera.exe")) { Skip "Opera" } else { RunInstall "Opera" "winget install --id Opera.Opera -e --source winget --accept-source-agreements --accept-package-agreements" }

        # Playwright-managed Chromium (separate from system Chrome -- Playwright pins its own build).
        # Lands under %LOCALAPPDATA%\ms-playwright\chromium-*. Only attempt if playwright CLI is on PATH.
        $pwBrowserRoot = "$env:LOCALAPPDATA\ms-playwright"
        $pwChromiumPresent = $false
        if (Test-Path $pwBrowserRoot) {
            $pwChromiumPresent = ((Get-ChildItem $pwBrowserRoot -Filter "chromium-*" -ErrorAction SilentlyContinue) -ne $null)
        }
        if ($pwChromiumPresent) { Skip "Playwright Chromium" }
        elseif (Get-Command playwright -ErrorAction SilentlyContinue) {
            RunInstall "Playwright Chromium" "playwright install chromium"
        } else {
            Log "SKIP Playwright Chromium -- playwright CLI not on PATH; re-run Fe after dotnet+Playwright land"
            Write-Host "  Playwright Chromium: playwright CLI missing -- skipped."
        }

        Write-Host "  Done."

        # Tools summary
        Log "SUMMARY: $okCount installed, $skipCount skipped, $failCount failed, $timeoutCount timed out"
        Write-Host ""
        Write-Host "  Results: $okCount installed, $skipCount skipped, $failCount failed, $timeoutCount timed out"
        if ($failCount -gt 0) { Write-Host "  Check log for failure details." }
        if ($timeoutCount -gt 0) { Write-Host "  Some installs timed out (limit: ${INSTALL_TIMEOUT}s)." }
        Write-Host "  Log: $logFile"
        Write-Host ""

        # Refresh PATH from registry
        $machinePath = [Environment]::GetEnvironmentVariable("Path", "Machine")
        $userPath = [Environment]::GetEnvironmentVariable("Path", "User")
        $env:PATH = "$machinePath;$userPath"

        if (-not (Test-Path "$env:APPDATA\metal")) { New-Item -ItemType Directory -Path "$env:APPDATA\metal" -Force | Out-Null }
        $VERSION | Set-Content $toolsDoneFile
    }
}

# -- Step 1.5: Dev-box hardening (build trust) --
# A dev box MUST be able to link and RUN freshly-built binaries. Smart App
# Control (a consumer gate) blocks the linker (collect2) and new unsigned exes
# and is mutually exclusive with development. Detect it, guide the operator,
# add Defender exclusions for the toolchain, and smoke-test that linking works.
# Runs every Fe (not version-cached) so a regressed box is caught early.
Write-Host "[Fe] Dev-box hardening (build trust)..."

# 1. Smart App Control state. Cannot be scripted OFF -- by Microsoft design --
#    so we detect and guide. Registry: 0/absent=off, 1=enforce, 2=evaluation.
$sacState = $null
try {
    $sacState = (Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\CI\Policy" -Name "VerifiedAndReputablePolicyState" -ErrorAction Stop).VerifiedAndReputablePolicyState
} catch { $sacState = $null }
if ($sacState -eq 1) {
    Write-Host "  [WARN] Smart App Control is ENFORCED -- it blocks the linker + fresh binaries."
    Write-Host "         It is mutually exclusive with development. Turn it OFF:"
    Write-Host "         Windows Security > App & browser control > Smart App Control > Off."
    Write-Host "         (One-way by design; correct for a dev box.)"
} elseif ($sacState -eq 2) {
    Write-Host "  [WARN] Smart App Control is in EVALUATION mode and may begin blocking. Turn it Off for a dev box."
} else {
    Write-Host "  [OK] Smart App Control not enforcing."
}

# 2. Defender exclusions for the build toolchain (reduce scan locks on fresh
#    artifacts). Needs admin; skip gracefully if not elevated. (Does NOT bypass
#    SAC -- that is App Control, separate from AV.)
try {
    foreach ($p in @("gcc.exe","g++.exe","collect2.exe","ld.exe","as.exe","cc1.exe","cc1plus.exe","mingw32-make.exe","make.exe","link.exe")) {
        Add-MpPreference -ExclusionProcess $p -ErrorAction Stop
    }
    if (Test-Path "C:\msys64") { Add-MpPreference -ExclusionPath "C:\msys64" -ErrorAction Stop }
    Write-Host "  [OK] Defender exclusions added for the build toolchain."
} catch {
    Write-Host "  [WARN] Could not add Defender exclusions (run Fe elevated to enable). Non-fatal."
}

# 3. Toolchain link smoke-test: compile + link + RUN a tiny C program. If this
#    fails, the box cannot produce runnable binaries (usually SAC) -- caught here
#    instead of mid-build.
$feGcc = Get-Command gcc -ErrorAction SilentlyContinue
if ($feGcc) {
    $feSd = Join-Path $env:TEMP "metal-fe-linktest-$(Get-Random)"
    New-Item -ItemType Directory -Path $feSd -Force | Out-Null
    try {
        Set-Content -Path "$feSd\h.c" -Value "int main(void){return 7;}" -Encoding ascii
        & $feGcc.Source "$feSd\h.c" -o "$feSd\h.exe" 2>$null
        if (Test-Path "$feSd\h.exe") {
            # Run the test binary. Under Smart App Control this THROWS a
            # terminating error (App Control block) that 2>$null does not
            # suppress -- catch it and turn it into a clean WARN.
            $feRan = $false
            try { & "$feSd\h.exe" 2>$null; $feRan = ($LASTEXITCODE -eq 7) } catch { $feRan = $false }
            if ($feRan) {
                Write-Host "  [OK] Build toolchain links AND runs binaries."
            } else {
                Write-Host "  [WARN] Built a binary but Smart App Control blocked RUNNING it."
                Write-Host "         Turn SAC OFF: Windows Security > App and browser control > Smart App Control > Off."
            }
        } else {
            Write-Host "  [WARN] Toolchain could not LINK a test binary -- likely SAC blocking collect2/ld. Turn SAC off."
        }
    } finally { Remove-Item $feSd -Recurse -Force -ErrorAction SilentlyContinue }
} else {
    Write-Host "  [INFO] gcc not on PATH yet -- link smoke-test skipped (re-run Fe after tools land)."
}

# -- Tools-only stop point --
# The tools.* runners want the dev toolchain (Step 1) + dev-box hardening
# (Step 1.5) and nothing else -- no identity, no MCP, no auth. Stop here.
if ($ToolsOnly) {
    Write-Host ""
    Write-Host "  ============================================"
    Write-Host "  metal.Fe - Tools only. Toolchain ready."
    Write-Host "  (identity/auth skipped -- run iron for the full setup)"
    Write-Host "  ============================================"
    Write-Host ""
    exit 0
}

# -- Step 2: Identity + memory --
# Per-machine identity is delegated to Go.Sign.ps1 -- it reads from
# gh api user, finds or generates a GPG key, and writes user.name /
# user.email / user.signingkey via git config --global. No more
# shipped .gitconfig with hardcoded values.
Write-Host "[Fe 2/4] Syncing identity + memory..."
$signScript = Join-Path $PSScriptRoot "Go.Sign.ps1"
if (Test-Path $signScript) {
    & $signScript
    if ($LASTEXITCODE -ne 0) {
        Write-Host "  [WARN] Go.Sign returned $LASTEXITCODE -- identity may be incomplete."
    }
} else {
    Write-Host "  [WARN] Go.Sign.ps1 not found at $signScript -- skipping identity setup."
}
if (-not (Test-Path "$env:USERPROFILE\.claude")) { New-Item -ItemType Directory -Path "$env:USERPROFILE\.claude" -Force | Out-Null }
Copy-Item "$PSScriptRoot\claude\settings.json" "$env:USERPROFILE\.claude\settings.json" -Force -ErrorAction SilentlyContinue
Copy-Item "$PSScriptRoot\claude\settings.local.json" "$env:USERPROFILE\.claude\settings.local.json" -Force -ErrorAction SilentlyContinue
Write-Host "  Claude settings installed"

# -- Step 3: MCP -- metal does NOT install or support MCP servers.
# NUCLEAR by default, but RESPECTFUL: any server named in ~/.metal-mcp-ignore is
# KEPT (one name per line, # for comments), and ~/.claude.json is backed up first
# so a removal is always recoverable. metal ADDS zero MCP; it only clears them.
if (Get-Command claude -ErrorAction SilentlyContinue) {
    Write-Host "[Fe 3/4] MCP -- removing servers (keeping any listed in ~/.metal-mcp-ignore)..."
    $claudeJson = Join-Path $HOME ".claude.json"
    if (Test-Path $claudeJson) { Copy-Item $claudeJson (Join-Path $HOME ".claude.json.metal-mcp-backup") -Force -ErrorAction SilentlyContinue }
    $keep = @()
    $ignoreFile = Join-Path $HOME ".metal-mcp-ignore"
    if (Test-Path $ignoreFile) {
        $keep = Get-Content $ignoreFile | ForEach-Object { ($_ -replace '#.*$', '').Trim() } | Where-Object { $_ }
    }
    $removed = 0; $kept = 0
    foreach ($line in (& claude mcp list 2>$null)) {
        $tok = ($line -split '\s+' | Where-Object { $_ })[0]
        if (-not $tok) { continue }
        $name = $tok.TrimEnd(':')
        if ($name -match '^(https?.*|Checking|No|MCP|Name)$') { continue }
        if ($keep -contains $name) { Write-Host "  Kept MCP (in ~/.metal-mcp-ignore): $name"; $kept++; continue }
        & claude mcp remove $name 2>$null
        & claude mcp remove --scope user $name 2>$null
        Write-Host "  Removed MCP: $name"
        $removed++
    }
    if ($removed -eq 0 -and $kept -eq 0) { Write-Host "  No MCP servers found." }
    if ($removed -gt 0) { Write-Host "  (backup: ~/.claude.json.metal-mcp-backup)" }
    Write-Host "  metal uses no MCP servers (kept: $kept)."
} else {
    Write-Host "[Fe 3/4] Claude Code not found -- nothing to do (metal uses no MCP)."
}

# -- Step 4: Auth --
Write-Host ""
Write-Host "-- Fe STEP 4: Authentication --"
Write-Host ""

$ghStatus = & gh auth status 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "[Fe 4/4] GitHub: already authenticated."
} else {
    Write-Host "Logging into GitHub..."
    & gh auth login
}

Write-Host ""
$gcToken = & gcloud auth print-access-token 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "[Fe 4/4] Google Cloud: already authenticated."
} else {
    Write-Host "Logging into Google Cloud..."
    & gcloud auth login
}

Write-Host ""
Write-Host "  ============================================"
Write-Host "  metal.Fe - Iron complete."
Write-Host "  ============================================"
Write-Host ""
