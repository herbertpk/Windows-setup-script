@echo off

:: Set the folder to save the downloaded wallpaper
set "imageUrl=https://i.pinimg.com/originals/85/ed/07/85ed0748e0f73a4de70e58be8f6dc330.jpg"
set "imageFolder=%USERPROFILE%\Pictures\Wallpapers"
set "imageFile=%imageFolder%\wallpaper.jpg"

:: Check if the folder exists, if not, create it
if not exist "%imageFolder%" (
    mkdir "%imageFolder%"
)

:: Download the wallpaper using PowerShell
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%imageUrl%', '%imageFile%')"

:: Disable Copilot button on taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCopilotButton" /t REG_DWORD /d 0 /f

:: Hide Desktop Icons
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideIcons" /t REG_DWORD /d 1 /f

:: Hide Task View Button
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d 0 /f

:: Hide Search Box
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f

:: Change the theme to dark or light mode (0 for Light mode, 1 for Dark mode)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d 0 /f

:: Set the downloaded image as wallpaper
reg add "HKCU\Control Panel\Desktop" /v "Wallpaper" /t REG_SZ /d "%imageFile%" /f

:: Update the wallpaper immediately
RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters ,1 ,True

:: Refresh Explorer to apply changes
taskkill /f /im explorer.exe
start explorer.exe

echo Changes applied successfully!
pause