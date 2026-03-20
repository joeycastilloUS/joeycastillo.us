# metal — bootstrap script
# Paste this into an elevated PowerShell on a fresh Windows 11 machine.
# Idempotent — safe to run again if interrupted. Skips completed steps.

$ErrorActionPreference = "Stop"

try {
    Write-Host ""
    Write-Host "  metal — Our Lady of the Miraculous Metal" -ForegroundColor Cyan
    Write-Host "  v11 — 2026-03-20" -ForegroundColor DarkGray
    Write-Host "  Bootstrap starting..." -ForegroundColor Cyan
    Write-Host ""

    # Step 1: Install Git (skip if already installed)
    $gitPath = Get-Command git -ErrorAction SilentlyContinue
    if ($gitPath) {
        Write-Host "[1/5] Git already installed. Skipping." -ForegroundColor Green
    } else {
        Write-Host "[1/5] Installing Git..." -ForegroundColor Yellow
        winget install --id Git.Git -e --source winget --accept-source-agreements --accept-package-agreements

        # Reload PATH from registry
        $machinePath = [Environment]::GetEnvironmentVariable("Path", "Machine")
        $userPath = [Environment]::GetEnvironmentVariable("Path", "User")
        $env:PATH = "$machinePath;$userPath"

        # Fallback locations
        if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
            $env:PATH += ";C:\Program Files\Git\cmd"
        }

        $gitPath = Get-Command git -ErrorAction SilentlyContinue
        if (-not $gitPath) {
            throw "git not found after install. Close this window, open a NEW PowerShell as Admin, and try again."
        }
        Write-Host "  git found at $($gitPath.Source)" -ForegroundColor Green
    }

    # Step 2: Install GitHub CLI (skip if already installed)
    $ghPath = Get-Command gh -ErrorAction SilentlyContinue
    if ($ghPath) {
        Write-Host "[2/5] GitHub CLI already installed. Skipping." -ForegroundColor Green
    } else {
        Write-Host "[2/5] Installing GitHub CLI..." -ForegroundColor Yellow
        winget install --id GitHub.cli -e --source winget --accept-source-agreements --accept-package-agreements

        # Reload PATH from registry
        $machinePath = [Environment]::GetEnvironmentVariable("Path", "Machine")
        $userPath = [Environment]::GetEnvironmentVariable("Path", "User")
        $env:PATH = "$machinePath;$userPath"

        # Fallback locations
        if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
            $env:PATH += ";C:\Program Files\GitHub CLI"
        }
        if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
            $env:PATH += ";${env:LOCALAPPDATA}\Programs\GitHub CLI"
        }

        $ghPath = Get-Command gh -ErrorAction SilentlyContinue
        if (-not $ghPath) {
            throw "gh not found after install. Close this window, open a NEW PowerShell as Admin, and try again."
        }
        Write-Host "  gh found at $($ghPath.Source)" -ForegroundColor Green
    }

    # Step 3: Authenticate (skip if already logged in)
    # Temporarily allow non-terminating errors — gh auth status writes to stderr when not logged in,
    # and $ErrorActionPreference = "Stop" would throw before we get to the login step.
    $prevEAP = $ErrorActionPreference
    $ErrorActionPreference = "Continue"
    $null = gh auth status 2>&1
    $authOk = ($LASTEXITCODE -eq 0)
    $ErrorActionPreference = $prevEAP

    if ($authOk) {
        Write-Host "[3/5] Already authenticated with GitHub. Skipping." -ForegroundColor Green
    } else {
        Write-Host ""
        Write-Host "  ================================================" -ForegroundColor Cyan
        Write-Host "  GitHub will show a code below. It's also copied" -ForegroundColor Cyan
        Write-Host "  to your clipboard. Paste it in the browser when" -ForegroundColor Cyan
        Write-Host "  asked to authorize the app." -ForegroundColor Cyan
        Write-Host "  ================================================" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "[3/5] Opening browser for GitHub login..." -ForegroundColor Yellow
        $prevEAP2 = $ErrorActionPreference
        $ErrorActionPreference = "Continue"
        gh auth login --hostname github.com --git-protocol https --web --clipboard 2>&1
        $ErrorActionPreference = $prevEAP2

        # Verify auth actually worked (don't trust exit code — gh writes to stderr on success too)
        $ErrorActionPreference = "Continue"
        $null = gh auth status 2>&1
        $loginOk = ($LASTEXITCODE -eq 0)
        $ErrorActionPreference = $prevEAP2

        if (-not $loginOk) { throw "gh auth failed — run this script again to retry" }
        Write-Host "  Authenticated successfully." -ForegroundColor Green
    }

    # Step 4: Clone or update metal repo (always pulls latest)
    if (Test-Path "C:\metal\.git") {
        Write-Host "[4/5] Pulling latest metal..." -ForegroundColor Yellow
        Set-Location C:\metal
        git pull --ff-only
    } else {
        Write-Host "[4/5] Cloning metal repo..." -ForegroundColor Yellow
        gh repo clone joeycastilloUS/metal C:\metal
        if ($LASTEXITCODE -ne 0) { throw "clone failed" }
    }

    # Step 5: Launch (always runs latest go.bat)
    Write-Host ""
    Write-Host "[5/5] Launching metal..." -ForegroundColor Yellow
    Set-Location C:\metal
    & .\go.bat

} catch {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Red
    Write-Host "  ERROR: $_" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "Fix the issue and run again — it picks up where it left off." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Press any key to exit..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}
