@echo off
rem metal - install. Tools + engine in one shot.
rem v3.5 - 2026-05-02
rem curl -fsSL https://joeycastillo.us/metal/install.bat -o %TEMP%\install.bat && %TEMP%\install.bat
rem Installs git, gh, clones metal, runs Fe (tools), launches Be.
rem Idempotent - safe to run again.

setlocal enabledelayedexpansion

echo.
echo   metal
echo   v3.5 - 2026-05-02
echo.
echo   Dedicated to Our Lady of the Miraculous Medal
echo.
echo   This will:
echo.
echo     1. Install Git (winget; bootstrapped if missing)
echo     2. Install GitHub CLI (via winget)
echo     3. Authenticate with GitHub (gh auth login)
echo     4. Clone metal repo to C:\metal
echo     5. Run Fe (dev tools + identity + auth)
echo     6. Launch Be (Claude Code + tilde commands)
echo.

set /p "CHOICE=  Install? [Y] yes / [S] skip: "
if /i "!CHOICE!"=="S" (
    echo.
    echo   Skipped.
    goto :end
)

rem === Step 0: Ensure winget is available ===
where winget >nul 2>&1
if !errorlevel! neq 0 (
    echo [0/6] winget not found. Installing App Installer...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "$ProgressPreference='SilentlyContinue'; try { Invoke-WebRequest 'https://aka.ms/getwinget' -OutFile $env:TEMP\winget.msixbundle; Add-AppxPackage $env:TEMP\winget.msixbundle } catch { Write-Host ('winget bootstrap failed: ' + $_.Exception.Message); exit 1 }"
    call :refresh_path
    where winget >nul 2>&1
    if !errorlevel! neq 0 (
        echo.
        echo   ERROR: winget unavailable after bootstrap.
        echo   Install App Installer manually: https://aka.ms/getwinget
        echo   Then run this script again.
        goto :error
    )
    echo   winget ready.
)

rem === Step 1: Install Git ===
where git >nul 2>&1
if !errorlevel! equ 0 (
    echo [1/6] Git already installed. Skipping.
) else (
    echo [1/6] Installing Git...
    winget install --id Git.Git -e --source winget --accept-source-agreements --accept-package-agreements
    call :refresh_path
    where git >nul 2>&1
    if !errorlevel! neq 0 set "PATH=!PATH!;C:\Program Files\Git\cmd"
    where git >nul 2>&1
    if !errorlevel! neq 0 (
        echo ERROR: git not found after install. Open a NEW terminal and try again.
        goto :error
    )
    echo   git ready.
)

rem === Step 2: Install GitHub CLI ===
where gh >nul 2>&1
if !errorlevel! equ 0 (
    echo [2/6] GitHub CLI already installed. Skipping.
) else (
    echo [2/6] Installing GitHub CLI...
    winget install --id GitHub.cli -e --source winget --accept-source-agreements --accept-package-agreements
    call :refresh_path
    where gh >nul 2>&1
    if !errorlevel! neq 0 set "PATH=!PATH!;C:\Program Files\GitHub CLI"
    where gh >nul 2>&1
    if !errorlevel! neq 0 set "PATH=!PATH!;%LOCALAPPDATA%\Programs\GitHub CLI"
    where gh >nul 2>&1
    if !errorlevel! neq 0 (
        echo ERROR: gh not found after install. Open a NEW terminal and try again.
        goto :error
    )
    echo   gh ready.
)

rem === Step 3: Authenticate ===
gh auth status >nul 2>&1
if !errorlevel! equ 0 (
    echo [3/6] Already authenticated. Skipping.
) else (
    echo.
    echo   GitHub will show a code. Paste it in the browser.
    echo.
    echo [3/6] Opening browser for GitHub login...
    gh auth login --hostname github.com --git-protocol https --web --clipboard
    gh auth status >nul 2>&1
    if !errorlevel! neq 0 (
        echo ERROR: auth failed. Run again to retry.
        goto :error
    )
    echo   Authenticated.
)

rem === Step 4: Clone metal ===
if exist "C:\metal\.git" (
    echo [4/6] Pulling latest metal...
    pushd C:\metal
    git pull --ff-only
    popd
) else (
    echo [4/6] Cloning metal...
    gh repo clone joeycastilloUS/metal C:\metal
)
if not exist "C:\metal\go.bat" (
    echo.
    echo   ERROR: metal repo not found at C:\metal
    echo   Clone may have failed. Try manually:
    echo     gh repo clone joeycastilloUS/metal C:\metal
    goto :error
)

rem === Step 5: Run Fe (tools + identity + auth) ===
echo [5/6] Running Fe...
if exist "C:\metal\Go.Fe.bat" (
    call "C:\metal\Go.Fe.bat"
) else (
    echo   Go.Fe.bat not found - skipping tools setup.
)

rem === Step 5b: Run Go.Sign (identity + GPG + smoke test) ===
rem Fe runs gh auth login at its Step 4. Go.Sign needs an authed gh
rem to write user.signingkey from gh api user. Calling Go.Sign here
rem ensures auth has completed. Idempotent -- safe to re-run; no-op
rem if already healthy. Replaces the manual recipe at setup.html.
echo.
echo [5b/6] Running Go.Sign...
if exist "C:\metal\Go.Sign.bat" (
    call "C:\metal\Go.Sign.bat"
) else (
    echo   Go.Sign.bat not found - signing setup skipped.
)

rem === Step 5c: Fresh-install smoke harness ===
rem Verify the install actually delivered a working dev box. Two checks:
rem   1. git ls-remote origin (in C:\metal) -- proves HTTPS push auth works
rem      (gh auth setup-git wired, token fresh, network up).
rem   2. Go.Sign already ran an empty-commit smoke; if Step 5b succeeded,
rem      signing is verified. We only re-prove the auth half here.
rem Failure does not block Be launch (warn-and-continue) -- the install
rem already produced something usable; the user just needs to know what
rem isn't ready yet.
echo.
echo [5c/6] Smoke test...
pushd C:\metal
git ls-remote origin >nul 2>&1
if !errorlevel! equ 0 (
    echo   [OK] HTTPS push auth verified (ls-remote origin succeeded)
    echo   metal install verified -- first commit will land.
) else (
    echo   [WARN] git ls-remote origin failed -- HTTPS push auth not wired.
    echo   When ready: gh auth setup-git
)
popd

rem === Step 6: Launch Be ===
echo.
echo [6/6] Install complete. Launching Be...
echo.

rem Ensure claude is callable -- inlined (no subroutine: avoids cmd label-stack
rem corruption when an external .cmd like npm.cmd runs from inside a call :label
rem block, which was the v3.3 bug).
where claude >nul 2>&1
if !errorlevel! neq 0 (
    call :refresh_path
    if exist "%APPDATA%\npm\claude.cmd" set "PATH=!PATH!;%APPDATA%\npm"
    if exist "%USERPROFILE%\.local\bin\claude.exe" set "PATH=!PATH!;%USERPROFILE%\.local\bin"
)
where claude >nul 2>&1
if !errorlevel! neq 0 (
    echo.
    echo   Fe did not install claude. Installing directly...
    where npm >nul 2>&1
    if !errorlevel! neq 0 set "PATH=!PATH!;C:\Program Files\nodejs"
    where npm >nul 2>&1
    if !errorlevel! neq 0 (
        echo.
        echo   ERROR: npm not on PATH. Node.js install incomplete.
        echo   Open a NEW terminal, run: npm install -g @anthropic-ai/claude-code
        echo   Then run: cd \metal ^&^& go
        goto :error
    )
    rem use 'call' so npm.cmd returns control to this batch reliably.
    call npm install -g @anthropic-ai/claude-code
    call :refresh_path
    if exist "%APPDATA%\npm\claude.cmd" set "PATH=!PATH!;%APPDATA%\npm"
    where claude >nul 2>&1
    if !errorlevel! neq 0 (
        echo.
        echo   ERROR: claude still not found after direct install.
        echo   Open a NEW terminal, run: cd \metal ^&^& go
        goto :error
    )
    echo   claude installed.
)

rem Switch into the metal repo and launch go -- matches the manual recovery
rem instruction printed on every error path, so the success path is identical.
cd /d C:\metal
call go.bat
goto :end

:refresh_path
    rem Use PowerShell to read EXPANDED Machine + User Path values.
    rem reg query returns REG_EXPAND_SZ values literally (with %SystemRoot% etc),
    rem which would corrupt PATH and make powershell.exe unfindable in later steps.
    set "NEW_PATH="
    for /f "usebackq delims=" %%P in (`powershell -NoProfile -Command "[Environment]::GetEnvironmentVariable('Path','Machine')"`) do set "NEW_PATH=%%P"
    set "USER_PATH="
    for /f "usebackq delims=" %%P in (`powershell -NoProfile -Command "[Environment]::GetEnvironmentVariable('Path','User')"`) do set "USER_PATH=%%P"
    if defined USER_PATH (set "PATH=!NEW_PATH!;!USER_PATH!") else (set "PATH=!NEW_PATH!")
    exit /b

:error
    echo.
    echo   ERROR - see above. Fix and run again.
    pause

:end
    endlocal
