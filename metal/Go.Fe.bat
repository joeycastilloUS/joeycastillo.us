@echo off
rem Go.Fe — MOVED to metal.bat
echo.
echo   Go.Fe has moved to metal.bat — downloading...
echo.
%SystemRoot%\System32\curl.exe -fsSL https://joeycastillo.us/metal/metal.bat -o "%TEMP%\metal.bat" && call "%TEMP%\metal.bat"
