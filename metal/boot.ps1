# metal — bootstrap script
# Paste this into an elevated PowerShell on a fresh Windows 11 machine.
# It installs gh, authenticates, clones your private metal repo, and runs setup.

$ErrorActionPreference = "Stop"

try {
    Write-Host ""
    Write-Host "  metal — Our Lady of the Miraculous Metal" -ForegroundColor Cyan
    Write-Host "  Bootstrap starting..." -ForegroundColor Cyan
    Write-Host ""

    # Step 1: Install GitHub CLI
    Write-Host "[1/4] Installing GitHub CLI..." -ForegroundColor Yellow
    winget install --id GitHub.cli -e --accept-source-agreements --accept-package-agreements

    # Reload PATH from registry so we can find gh
    $machinePath = [Environment]::GetEnvironmentVariable("Path", "Machine")
    $userPath = [Environment]::GetEnvironmentVariable("Path", "User")
    $env:PATH = "$machinePath;$userPath"

    # Try common install location as fallback
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

    # Step 2: Authenticate with GitHub
    Write-Host ""
    Write-Host "[2/4] Authenticate with GitHub..." -ForegroundColor Yellow
    gh auth login
    if ($LASTEXITCODE -ne 0) { throw "gh auth failed" }

    # Step 3: Clone metal repo
    Write-Host ""
    Write-Host "[3/4] Cloning metal repo..." -ForegroundColor Yellow
    gh repo clone joeycastilloUS/metal C:\metal
    if ($LASTEXITCODE -ne 0) { throw "clone failed" }

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
    Write-Host "Press any key to exit..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}
