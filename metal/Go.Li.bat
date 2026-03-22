@echo off
rem metal.Li — Lithium. OS diet.
rem curl -fsSL https://joeycastillo.us/metal/Go.Li.bat -o %TEMP%\Go.Li.bat && %TEMP%\Go.Li.bat
rem Strips bloatware, dark mode, privacy, power, taskbar. No dev tools.
rem Idempotent — safe to run again.

setlocal enabledelayedexpansion

echo.
echo   metal.Li — Lithium. OS diet.
echo   Strip the fat. Dark mode. Full power.
echo.

rem ── Check admin ──
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Run this as Administrator.
    echo Right-click Command Prompt ^> Run as administrator
    pause
    exit /b 1
)

rem === Step 1: Install Git ===
where git >nul 2>&1
if !errorlevel! equ 0 (
    echo [1/4] Git already installed. Skipping.
) else (
    echo [1/4] Installing Git...
    winget install --id Git.Git -e --source winget --accept-source-agreements --accept-package-agreements
    if !errorlevel! neq 0 (
        echo ERROR: Git installation failed.
        goto :error
    )
    call :refresh_path
    where git >nul 2>&1
    if !errorlevel! neq 0 set "PATH=!PATH!;C:\Program Files\Git\cmd"
    where git >nul 2>&1
    if !errorlevel! neq 0 (
        echo ERROR: git not found. Open a NEW Admin Command Prompt and try again.
        goto :error
    )
    echo   git installed.
)

rem === Step 2: Install GitHub CLI ===
where gh >nul 2>&1
if !errorlevel! equ 0 (
    echo [2/4] GitHub CLI already installed. Skipping.
) else (
    echo [2/4] Installing GitHub CLI...
    winget install --id GitHub.cli -e --source winget --accept-source-agreements --accept-package-agreements
    if !errorlevel! neq 0 (
        echo ERROR: GitHub CLI installation failed.
        goto :error
    )
    call :refresh_path
    where gh >nul 2>&1
    if !errorlevel! neq 0 set "PATH=!PATH!;C:\Program Files\GitHub CLI"
    where gh >nul 2>&1
    if !errorlevel! neq 0 set "PATH=!PATH!;%LOCALAPPDATA%\Programs\GitHub CLI"
    where gh >nul 2>&1
    if !errorlevel! neq 0 (
        echo ERROR: gh not found. Open a NEW Admin Command Prompt and try again.
        goto :error
    )
    echo   gh installed.
)

rem === Step 3: Clone or update metal ===
gh auth status >nul 2>&1
if !errorlevel! neq 0 (
    echo.
    echo   GitHub will show a code. Paste it in the browser.
    echo.
    gh auth login --hostname github.com --git-protocol https --web --clipboard
)

if exist "C:\metal\.git" (
    echo [3/4] Pulling latest metal...
    pushd C:\metal
    git pull --ff-only
    popd
) else (
    echo [3/4] Cloning metal...
    gh repo clone joeycastilloUS/metal C:\metal
    if !errorlevel! neq 0 (
        echo ERROR: clone failed.
        goto :error
    )
)

rem === Step 4: Run OS diet ===
echo.
echo [4/4] Running OS diet...
pushd C:\metal
call provision.bat
popd

echo.
echo   metal.Li — diet complete. Reboot recommended.

goto :end

:refresh_path
    set "NEW_PATH="
    for /f "tokens=2,*" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path 2^>nul') do set "NEW_PATH=%%B"
    set "USER_PATH="
    for /f "tokens=2,*" %%A in ('reg query "HKCU\Environment" /v Path 2^>nul') do set "USER_PATH=%%B"
    if defined USER_PATH (set "PATH=!NEW_PATH!;!USER_PATH!") else (set "PATH=!NEW_PATH!")
    goto :eof

:error
    echo.
    echo   ERROR — see above. Fix and run again.
    pause

:end
    endlocal
