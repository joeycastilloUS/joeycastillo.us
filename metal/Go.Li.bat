@echo off
rem metal.Li — Lithium. OS diet.
rem v1.6.0 — 2026-03-23
rem curl -fsSL https://joeycastillo.us/metal/Go.Li.bat -o %TEMP%\Go.Li.bat && %TEMP%\Go.Li.bat
rem Zero dependencies. Just run as Administrator.
rem Strips bloatware, dark mode, privacy, power, taskbar, keyboard.
rem Idempotent — safe to run again.

setlocal enabledelayedexpansion

echo.
echo   metal.Li — Lithium. OS diet.
echo   v1.6.0 — 2026-03-23
echo   Strip the fat. Dark mode. Full power.
echo.

rem ── Check admin ──
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Run this as Administrator.
    echo Right-click Command Prompt ^> Run as administrator
    pause
    exit /b 1
)

rem ════════════════════════════════════════════════
echo [1/12] Removing bloatware...
rem ════════════════════════════════════════════════

powershell -NoProfile -Command "$ErrorActionPreference='SilentlyContinue'; $bloat = @('Microsoft.BingSearch','Microsoft.BingWeather','Microsoft.MicrosoftSolitaireCollection','Microsoft.MicrosoftOfficeHub','Microsoft.OutlookForWindows','Microsoft.GetHelp','Microsoft.WindowsFeedbackHub','Microsoft.YourPhone','Microsoft.ZuneMusic','Microsoft.WindowsCamera','Microsoft.WindowsAlarms','Microsoft.WindowsSoundRecorder','Microsoft.Windows.DevHome','MicrosoftCorporationII.QuickAssist','Microsoft.Windows.Photos','Microsoft.XboxGamingOverlay','Microsoft.XboxIdentityProvider','Microsoft.XboxSpeechToTextOverlay','Microsoft.XboxGameCallableUI','Microsoft.WidgetsPlatformRuntime','MicrosoftWindows.Client.WebExperience','Microsoft.Windows.Ai.Copilot.Provider','B9ECED6F.ASUSPCAssistant','B9ECED6F.Glidex','B9ECED6F.ScreenPadMaster','AD2F1837.HPPrinterControl','MicrosoftWindows.CrossDevice','Microsoft.Windows.ContentDeliveryManager','McAfee.ModernLifeSecurity','McAfee.WPS','McAfee.PersonalSecurity'); $total=$bloat.Count; $i=0; foreach($b in $bloat){ $i++; $pkg=Get-AppxPackage *$b*; if($pkg){ Write-Host '  Removing '$b'...' ; $pkg | Remove-AppxPackage }; }; Write-Host '  '$i' packages processed.'" 2>nul

echo   Done.

rem ════════════════════════════════════════════════
echo [2/12] Killing Cortana and Copilot...
rem ════════════════════════════════════════════════

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Copilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f >nul 2>&1
echo   Done.

rem ════════════════════════════════════════════════
echo [3/12] Configuring taskbar...
rem ════════════════════════════════════════════════

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAl" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarMn" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCopilotButton" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t REG_DWORD /d 1 /f >nul 2>&1
powershell -Command "$pins = (New-Object -ComObject Shell.Application).Namespace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items(); foreach ($pin in $pins) { $verbs = $pin.Verbs(); foreach ($verb in $verbs) { if ($verb.Name -match 'Unpin from taskbar|Von Taskleiste l') { $verb.DoIt() } } }" 2>nul
echo   Done.

rem ════════════════════════════════════════════════
echo [4/12] Dark mode everything...
rem ════════════════════════════════════════════════

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d 0 /f >nul 2>&1
echo   Done.

rem ════════════════════════════════════════════════
echo [5/12] File Explorer preferences...
rem ════════════════════════════════════════════════

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "UseCompactMode" /t REG_DWORD /d 1 /f >nul 2>&1
echo   Done.

rem ════════════════════════════════════════════════
echo [6/12] Power — full performance on AC...
rem ════════════════════════════════════════════════

powercfg /change standby-timeout-ac 0
powercfg /change standby-timeout-dc 15
powercfg /change monitor-timeout-ac 30
powercfg /change monitor-timeout-dc 5
powercfg /change hibernate-timeout-ac 0
powercfg /change hibernate-timeout-dc 0
powercfg /setacvalueindex SCHEME_BALANCED SUB_ENERGYSAVER ESBATTTHRESHOLD 0 >nul 2>&1
echo   Done.

rem ════════════════════════════════════════════════
echo [7/12] Privacy — scorched earth...
rem ════════════════════════════════════════════════

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d 0 /f >nul 2>&1
echo   Done.

rem ════════════════════════════════════════════════
echo [8/12] Notifications — only what matters...
rem ════════════════════════════════════════════════

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Suggested" /v "Enabled" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /v "ScoobeSystemSettingEnabled" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Microsoft.MicrosoftEdge.Stable_8wekyb3d8bbwe!App" /v "Enabled" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Microsoft.WindowsStore_8wekyb3d8bbwe!App" /v "Enabled" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe!App" /v "Enabled" /t REG_DWORD /d 0 /f >nul 2>&1
echo   Done.

rem ════════════════════════════════════════════════
echo [9/12] Keyboard — max repeat rate...
rem ════════════════════════════════════════════════

reg add "HKCU\Control Panel\Keyboard" /v "KeyboardSpeed" /t REG_SZ /d "31" /f >nul 2>&1
reg add "HKCU\Control Panel\Keyboard" /v "KeyboardDelay" /t REG_SZ /d "0" /f >nul 2>&1
echo   Done.

rem ════════════════════════════════════════════════
echo [10/12] Start menu — clean...
rem ════════════════════════════════════════════════

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_IrisRecommendations" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Start" /v "ShowRecentList" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Start" /v "ShowFrequentList" /t REG_DWORD /d 0 /f >nul 2>&1
powershell -Command "Stop-Process -Name StartMenuExperienceHost -Force -ErrorAction SilentlyContinue; Start-Sleep -Seconds 1; $p = \"$env:LOCALAPPDATA\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState\"; Remove-Item \"$p\start*.bin\" -Force -ErrorAction SilentlyContinue; Remove-Item \"$p\start2.bin.bak\" -Force -ErrorAction SilentlyContinue" 2>nul
echo   Done.

rem ════════════════════════════════════════════════
echo [11/12] Secondary clock — US West (Pacific)...
rem ════════════════════════════════════════════════

powershell -Command "Set-ItemProperty -Path 'HKCU:\Control Panel\TimeZoneInformation' -Name '1 Enable' -Value 1 -Type DWord; Set-ItemProperty -Path 'HKCU:\Control Panel\TimeZoneInformation' -Name '1 DisplayName' -Value 'US West' -Type String; Set-ItemProperty -Path 'HKCU:\Control Panel\TimeZoneInformation' -Name '1 TzRegKeyName' -Value 'Pacific Standard Time' -Type String" 2>nul
echo   Done.

rem ════════════════════════════════════════════════
echo [12/12] Disable OneDrive autostart...
rem ════════════════════════════════════════════════

reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "OneDrive" /f >nul 2>&1
echo   Done.

rem ── Restart Explorer ──
echo.
echo Restarting Explorer to apply changes...
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe

echo.
echo ============================================
echo   metal.Li — diet complete.
echo   Reboot recommended for all changes.
echo ============================================
echo.
pause

endlocal
