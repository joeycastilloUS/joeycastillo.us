# metal — bootstrap script
# Paste this into an elevated PowerShell on a fresh Windows 11 machine.
# Idempotent — safe to run again if interrupted. Skips completed steps.

$ErrorActionPreference = "Stop"

try {
    Write-Host ""
    Write-Host "  metal — Our Lady of the Miraculous Metal" -ForegroundColor Cyan
    Write-Host "  Bootstrap starting..." -ForegroundColor Cyan
    Write-Host ""

    # Step 1: Install GitHub CLI (skip if already installed)
    $ghPath = Get-Command gh -ErrorAction SilentlyContinue
    if ($ghPath) {
        Write-Host "[1/4] GitHub CLI already installed. Skipping." -ForegroundColor Green
    } else {
        Write-Host "[1/4] Installing GitHub CLI..." -ForegroundColor Yellow
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

    # Step 2: Authenticate (skip if already logged in)
    $authStatus = gh auth status 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "[2/4] Already authenticated with GitHub. Skipping." -ForegroundColor Green
    } else {
        Write-Host "[2/4] Authenticate with GitHub..." -ForegroundColor Yellow
        Write-Host "  Opening GitHub login in your browser..." -ForegroundColor Gray
        gh auth login --hostname github.com --git-protocol https --web
        if ($LASTEXITCODE -ne 0) { throw "gh auth failed" }
    }

    # Step 3: Clone metal repo (skip if already cloned)
    if (Test-Path "C:\metal\go.bat") {
        Write-Host "[3/4] metal repo already cloned. Pulling latest..." -ForegroundColor Green
        Set-Location C:\metal
        git pull
    } else {
        Write-Host "[3/4] Cloning metal repo..." -ForegroundColor Yellow
        gh repo clone joeycastilloUS/metal C:\metal
        if ($LASTEXITCODE -ne 0) { throw "clone failed" }
    }

    # Step 4: Launch
    Write-Host ""
    Write-Host "[4/4] Launching metal..." -ForegroundColor Yellow
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
