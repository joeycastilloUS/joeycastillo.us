@echo off
REM metal -- Iron (standalone). Dev tools + identity + auth on a bare box.
REM   curl -fsSL https://joeycastillo.us/metal/iron.bat -o %TEMP%\iron.bat && %TEMP%\iron.bat
REM
REM Reuses the full installer's bootstrap (git/gh/auth/clone/self-heal) but stops
REM after Iron -- no Be launch. One source of truth: install.bat, mode=iron.
curl -fsSL https://joeycastillo.us/metal/install.bat -o "%TEMP%\metal-install.bat"
call "%TEMP%\metal-install.bat" iron
