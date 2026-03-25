@echo off
rem Go.K — MOVED to install.bat (v3)
echo.
echo   Go.K has moved to install.bat — downloading...
echo.
%SystemRoot%\System32\curl.exe -fsSL https://joeycastillo.us/metal/install.bat -o "%TEMP%\install.bat" && call "%TEMP%\install.bat"
