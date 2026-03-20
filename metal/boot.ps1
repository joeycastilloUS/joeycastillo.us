# metal — bootstrap script
# Paste this into an elevated PowerShell on a fresh Windows 11 machine.
# It installs gh, authenticates, clones your private metal repo, and runs setup.

Write-Host ""
Write-Host "  metal — Our Lady of the Miraculous Metal" -ForegroundColor Cyan
Write-Host "  Bootstrap starting..." -ForegroundColor Cyan
Write-Host ""

# Step 1: Install GitHub CLI (includes git)
Write-Host "[1/4] Installing GitHub CLI..." -ForegroundColor Yellow
winget install --id GitHub.cli -e --accept-source-agreements --accept-package-agreements | Out-Null
$env:PATH += ";C:\Program Files\GitHub CLI"

# Step 2: Authenticate with GitHub
Write-Host "[2/4] Authenticate with GitHub..." -ForegroundColor Yellow
gh auth login

# Step 3: Clone metal repo
Write-Host "[3/4] Cloning metal repo..." -ForegroundColor Yellow
gh repo clone joeycastilloUS/metal C:\metal

# Step 4: Launch
Write-Host "[4/4] Launching metal..." -ForegroundColor Yellow
Set-Location C:\metal
& .\go.bat
