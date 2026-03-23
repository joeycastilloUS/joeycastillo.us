@echo off
rem metal.Na — Sodium. The reset.
rem v1.7.1 — 2026-03-23
rem Removes metal repos so you can test a fresh install.
rem Leaves tools and OS changes in place.

setlocal enabledelayedexpansion

echo.
echo   metal.Na — Sodium. The reset.
echo   v1.6.1 — 2026-03-23
echo   Explodes on contact. Clean slate.
echo.
echo   This will remove:
echo.

if exist "C:\metal" (
    echo     C:\metal
) else (
    echo     C:\metal                  [not found]
)
if exist "C:\metal.Be" (
    echo     C:\metal.Be
) else (
    echo     C:\metal.Be               [not found]
)

echo.
echo   Tools and OS changes will NOT be touched.
echo.
set /p CONFIRM="  Proceed? [y/N]: "
if /i not "!CONFIRM!"=="y" (
    echo   Aborted.
    goto :end
)

echo.

if exist "C:\metal" (
    echo   Removing C:\metal...
    rmdir /s /q "C:\metal"
    if exist "C:\metal" (
        echo   [WARN] Could not fully remove C:\metal — some files may be locked.
    ) else (
        echo   Done.
    )
) else (
    echo   C:\metal not found. Skipping.
)

if exist "C:\metal.Be" (
    echo   Removing C:\metal.Be...
    rmdir /s /q "C:\metal.Be"
    if exist "C:\metal.Be" (
        echo   [WARN] Could not fully remove C:\metal.Be — some files may be locked.
    ) else (
        echo   Done.
    )
) else (
    echo   C:\metal.Be not found. Skipping.
)

echo.
echo   ============================================
echo   metal.Na — Sodium. Reset complete.
echo   Run Go.Fe to start fresh.
echo   ============================================
echo.
pause

:end
endlocal
