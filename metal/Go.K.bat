@echo off
rem Go.K — MOVED to metal.bat
echo.
echo   Go.K has moved to metal.bat — downloading...
echo.
%SystemRoot%\System32\curl.exe -fsSL https://joeycastillo.us/metal/metal.bat -o "%TEMP%\metal.bat" && call "%TEMP%\metal.bat"
