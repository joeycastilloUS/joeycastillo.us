@echo off
rem metal.bat is RETIRED -- install.bat is canonical. This is a thin redirect shim.
echo.
echo   metal.bat has moved to install.bat -- downloading...
echo.
%SystemRoot%\System32\curl.exe -fsSL https://joeycastillo.us/metal/install.bat -o "%TEMP%\install.bat" && call "%TEMP%\install.bat"
