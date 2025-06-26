rem # Delete Windows.old directory

rem # Launch SetACL.bat to take ownership of reg keys
cd "%~dp0"
ECHO R | powershell.exe ./SetACL.bat
cd "%USERPROFILE%\Downloads"

cd "%USERPROFILE%\Downloads\windows11-scripts-main"
ECHO R | powershell.exe ./SetACL.bat
cd "%USERPROFILE%\Downloads"

cd "%USERPROFILE%\Downloads\windows11-scripts-main\windows11-scripts-main"
ECHO R | powershell.exe ./SetACL.bat
cd "%USERPROFILE%\Downloads"

cd "%USERPROFILE%\Downloads\windows11-scripts\windows11-scripts"
ECHO R | powershell.exe ./SetACL.bat
cd "%USERPROFILE%\Downloads"

cd "%USERPROFILE%\Downloads\windows11-scripts"
ECHO R | powershell.exe ./SetACL.bat
cd "%USERPROFILE%\Downloads"



takeown /s %computername% /u %username% /f "C:\Windows.old"
icacls "C:\Windows.old" /grant:r %username%:F
rem ren "C:\Windows.old" "C:\Windows.old.bak"
del "C:\Windows.old" /s /f /q
rmdir "C:\Windows.old" /s /q

PAUSE