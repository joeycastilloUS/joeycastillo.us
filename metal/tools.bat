@echo off
REM metal -- Tools only (standalone). Dev toolchain on a bare box, no identity/auth.
REM   curl -fsSL https://joeycastillo.us/metal/tools.bat -o %TEMP%\tools.bat && %TEMP%\tools.bat
REM
REM Reuses the full installer's bootstrap (git/gh/clone/self-heal) but runs only
REM the dev-tools step. One source of truth: install.bat, mode=tools.
curl -fsSL https://joeycastillo.us/metal/install.bat -o "%TEMP%\metal-install.bat"
call "%TEMP%\metal-install.bat" tools
