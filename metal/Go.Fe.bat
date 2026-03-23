@echo off
rem metal.Fe — Iron. The foundation.
rem v1.8 — 2026-03-23
rem curl -fsSL https://joeycastillo.us/metal/Go.Fe.bat -o %TEMP%\Go.Fe.bat && %TEMP%\Go.Fe.bat
rem Installs git, gh, clones metal, runs full toolchain + identity + auth.
rem Idempotent — safe to run again.

setlocal enabledelayedexpansion

echo.
echo   metal.Fe — Iron. The foundation.
echo   v1.8 — 2026-03-23
echo   Full dev toolchain. One command.
echo.

echo   This will:
echo.
echo     1. Install Git (via winget)
echo     2. Install GitHub CLI (via winget)
echo     3. Authenticate with GitHub (gh auth login)
echo     4. Clone or update the metal repo to C:\metal
echo     5. Launch full toolchain (Fe → Li → Be)
echo.

set /p "CHOICE=  Install all? [A] all / [S] skip: "
if /i "!CHOICE!"=="S" (
    echo.
    echo   Skipped.
    goto :end
)

rem === Step 1: Install Git ===
where git >nul 2>&1
if !errorlevel! equ 0 (
    echo [1/5] Git already installed. Skipping.
) else (
    echo [1/5] Installing Git...
    winget install --id Git.Git -e --source winget --accept-source-agreements --accept-package-agreements
    rem winget returns non-zero if already installed — not a real error
    call :refresh_path
    where git >nul 2>&1
    if !errorlevel! neq 0 set "PATH=!PATH!;C:\Program Files\Git\cmd"
    where git >nul 2>&1
    if !errorlevel! neq 0 (
        echo ERROR: git not found after install. Open a NEW Admin Command Prompt and try again.
        goto :error
    )
    echo   git ready.
)

rem === Step 2: Install GitHub CLI ===
where gh >nul 2>&1
if !errorlevel! equ 0 (
    echo [2/5] GitHub CLI already installed. Skipping.
) else (
    echo [2/5] Installing GitHub CLI...
    winget install --id GitHub.cli -e --source winget --accept-source-agreements --accept-package-agreements
    rem winget returns non-zero if already installed — not a real error
    call :refresh_path
    where gh >nul 2>&1
    if !errorlevel! neq 0 set "PATH=!PATH!;C:\Program Files\GitHub CLI"
    where gh >nul 2>&1
    if !errorlevel! neq 0 set "PATH=!PATH!;%LOCALAPPDATA%\Programs\GitHub CLI"
    where gh >nul 2>&1
    if !errorlevel! neq 0 (
        echo ERROR: gh not found after install. Open a NEW Admin Command Prompt and try again.
        goto :error
    )
    echo   gh ready.
)

rem === Step 3: Authenticate ===
gh auth status >nul 2>&1
if !errorlevel! equ 0 (
    echo [3/5] Already authenticated. Skipping.
) else (
    echo.
    echo   GitHub will show a code. Paste it in the browser.
    echo.
    echo [3/5] Opening browser for GitHub login...
    gh auth login --hostname github.com --git-protocol https --web --clipboard
    gh auth status >nul 2>&1
    if !errorlevel! neq 0 (
        echo ERROR: auth failed. Run again to retry.
        goto :error
    )
    echo   Authenticated.
)

rem === Step 4: Clone or update metal ===
if exist "C:\metal\.git" (
    echo [4/5] Pulling latest metal...
    pushd C:\metal
    git pull --ff-only
    popd
) else (
    echo [4/5] Cloning metal...
    gh repo clone joeycastilloUS/metal C:\metal
)
if not exist "C:\metal\Go.Fe.2.bat" (
    echo.
    echo   ERROR: metal repo not found at C:\metal
    echo   Clone may have failed. Try manually:
    echo     gh repo clone joeycastilloUS/metal C:\metal
    goto :error
)

rem === Step 5: Run full toolchain ===
echo.
echo [5/5] Launching metal.Fe...
call "C:\metal\Go.Fe.2.bat"

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
