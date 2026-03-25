@echo off
rem metal.Fe — MOVED to Go.K.bat
rem This file exists for backward compatibility.
echo.
echo   metal.Fe has moved to metal.K — downloading Go.K.bat...
echo.
%SystemRoot%\System32\curl.exe -fsSL https://joeycastillo.us/metal/Go.K.bat -o "%TEMP%\Go.K.bat" && call "%TEMP%\Go.K.bat"
