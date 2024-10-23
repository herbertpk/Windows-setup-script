@echo off

:: Set the folder to save the downloaded wallpaper
set "imageUrl=https://i.redd.it/rzxjvaufvf9a1.jpg"
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

:: Hide Widgets Button
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d 0 /f

:: Hide Task View Button
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d 0 /f

:: Hide Search Box
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f

:: Change the theme to dark or light mode (0 for Light mode, 1 for Dark mode)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d 0 /f


::change the pin icons
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "Favorites" /t REG_BINARY /d 00A40100003A001F80C827341F105C1042AA032EE45287D668260001002600EFBE120000008491E6777725DB01F9947E857725DB01511E88857725DB01140056003100000000005759EB9111005461736B42617200400009000400EFBE5759EB915759EB912E000000E4C20B0000000B000000000000000000000000000000AFFAA4005400610073006B00420061007200000016001201320097010000A754662A200046494C4545587E312E4C4E4B00007C0009000400EFBE5759EB915759EB912E000000E5C20B00000006000000000000000000520000000000A413A200460069006C00650020004500780070006C006F007200650072002E006C006E006B00000040007300680065006C006C00330032002E0064006C006C002C002D003200320030003600370000001C00120000002B00EFBE19E38C857725DB011C00420000001D00EFBE02004D006900630072006F0073006F00660074002E00570069006E0064006F00770073002E004500780070006C006F0072006500720000001C00260000001E00EFBE0200530079007300740065006D00500069006E006E006500640000001C00000000CA0100003A001F80C827341F105C1042AA032EE45287D668260001002600EFBE120000008491E6777725DB01F9947E857725DB01E477CE437925DB01140056003100000000005759799311005461736B42617200400009000400EFBE5759EB91575979932E000000E4C20B0000000B000000000000000000000000000000BEFC33005400610073006B00420061007200000016003801320076040000A7546C2A2000434F4D4D414E7E312E4C4E4B00007E0009000400EFBE57597993575979932E000000364B120000000700000000000000000054000000000088424E0043006F006D006D0061006E0064002000500072006F006D00700074002E006C006E006B00000040007300680065006C006C00330032002E0064006C006C002C002D003200320030003200320000001C00120000002B00EFBE963CD3437925DB011C006A0000001D00EFBE02007B00310041004300310034004500370037002D0030003200450037002D0034004500350044002D0042003700340034002D003200450042003100410045003500310039003800420037007D005C0063006D0064002E0065007800650000001C00220000001E00EFBE02005500730065007200500069006E006E006500640000001C000000FF /f



:: Refresh Explorer to apply changes
taskkill /f /im explorer.exe
start explorer.exe


:: Set the downloaded image as wallpaper
reg add "HKCU\Control Panel\Desktop" /v "Wallpaper" /t REG_SZ /d "%imageFile%" /f

:: Update the wallpaper immediately
RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters ,1 ,True

echo Changes applied successfully!
pause