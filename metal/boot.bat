@echo off
rem metal — bootstrap script
rem Paste this into an elevated Command Prompt on a fresh Windows 11 machine.
rem Idempotent — safe to run again if interrupted. Skips completed steps.

setlocal enabledelayedexpansion

echo.
echo   metal — Our Lady of the Miraculous Metal
echo   v12 — 2026-03-20
echo   Bootstrap starting...
echo.

rem === Step 1: Install Git (skip if already installed) ===
where git >nul 2>&1
if !errorlevel! equ 0 (
    echo [1/5] Git already installed. Skipping.
) else (
    echo [1/5] Installing Git...
    winget install --id Git.Git -e --source winget --accept-source-agreements --accept-package-agreements
    if !errorlevel! neq 0 (
        echo ERROR: Git installation failed.
        goto :error
    )

    rem Reload PATH from registry
    call :refresh_path

    rem Fallback location
    where git >nul 2>&1
    if !errorlevel! neq 0 (
        set "PATH=!PATH!;C:\Program Files\Git\cmd"
    )

    where git >nul 2>&1
    if !errorlevel! neq 0 (
        echo ERROR: git not found after install. Close this window, open a NEW Command Prompt as Admin, and try again.
        goto :error
    )
    echo   git installed successfully.
)

rem === Step 2: Install GitHub CLI (skip if already installed) ===
where gh >nul 2>&1
if !errorlevel! equ 0 (
    echo [2/5] GitHub CLI already installed. Skipping.
) else (
    echo [2/5] Installing GitHub CLI...
    winget install --id GitHub.cli -e --source winget --accept-source-agreements --accept-package-agreements
    if !errorlevel! neq 0 (
        echo ERROR: GitHub CLI installation failed.
        goto :error
    )

    rem Reload PATH from registry
    call :refresh_path

    rem Fallback locations
    where gh >nul 2>&1
    if !errorlevel! neq 0 (
        set "PATH=!PATH!;C:\Program Files\GitHub CLI"
    )
    where gh >nul 2>&1
    if !errorlevel! neq 0 (
        set "PATH=!PATH!;%LOCALAPPDATA%\Programs\GitHub CLI"
    )

    where gh >nul 2>&1
    if !errorlevel! neq 0 (
        echo ERROR: gh not found after install. Close this window, open a NEW Command Prompt as Admin, and try again.
        goto :error
    )
    echo   gh installed successfully.
)

rem === Step 3: Authenticate (skip if already logged in) ===
gh auth status >nul 2>&1
if !errorlevel! equ 0 (
    echo [3/5] Already authenticated with GitHub. Skipping.
) else (
    echo.
    echo   ================================================
    echo   GitHub will show a code below. It's also copied
    echo   to your clipboard. Paste it in the browser when
    echo   asked to authorize the app.
    echo   ================================================
    echo.
    echo [3/5] Opening browser for GitHub login...
    gh auth login --hostname github.com --git-protocol https --web --clipboard

    rem Verify auth actually worked
    gh auth status >nul 2>&1
    if !errorlevel! neq 0 (
        echo ERROR: gh auth failed — run this script again to retry.
        goto :error
    )
    echo   Authenticated successfully.
)

rem === Step 4: Clone or update metal repo (always pulls latest) ===
if exist "C:\metal\.git" (
    echo [4/5] Pulling latest metal...
    pushd C:\metal
    git pull --ff-only
    popd
) else (
    echo [4/5] Cloning metal repo...
    gh repo clone joeycastilloUS/metal C:\metal
    if !errorlevel! neq 0 (
        echo ERROR: clone failed.
        goto :error
    )
)

rem === Step 5: Launch (always runs latest go-runtime.bat) ===
echo.
echo [5/5] Launching metal...
pushd C:\metal
call go-runtime.bat
popd

goto :end

rem ============================================================
rem  Subroutine: Refresh PATH from registry
rem ============================================================
:refresh_path
    rem Read Machine PATH from registry
    set "NEW_PATH="
    for /f "tokens=2,*" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path 2^>nul') do (
        set "NEW_PATH=%%B"
    )
    rem Read User PATH from registry
    set "USER_PATH="
    for /f "tokens=2,*" %%A in ('reg query "HKCU\Environment" /v Path 2^>nul') do (
        set "USER_PATH=%%B"
    )
    if defined USER_PATH (
        set "PATH=!NEW_PATH!;!USER_PATH!"
    ) else (
        set "PATH=!NEW_PATH!"
    )
    goto :eof

rem ============================================================
rem  Error handler
rem ============================================================
:error
    echo.
    echo ========================================
    echo   ERROR — see message above.
    echo ========================================
    echo.
    echo Fix the issue and run again — it picks up where it left off.
    echo.
    echo Press any key to exit...
    pause >nul

:end
    endlocal
