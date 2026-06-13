@echo off
REM Go.Hg -- Mercury: cross-machine telemetry sync for metal.
REM Pulls every unit's prompt-trail + compute-cost logs and pushes this one's.
REM The metal-raw origin is archived (read-only); Mercury uses the live shared hub
REM acmedevUS/metal-telemetry as the writable "third place". Per-host folders = no conflicts.
setlocal
set "REPO=https://github.com/acmedevUS/metal-telemetry.git"
set "DIR=%USERPROFILE%\metal-telemetry"
if not exist "%DIR%\.git" git clone "%REPO%" "%DIR%"
powershell -ExecutionPolicy Bypass -File "%DIR%\sync.ps1"
endlocal
