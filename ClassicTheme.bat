rem # Classic Theme (Resources folder)


echo.
echo Classic Theme (Resources folder)
echo.
echo 1. Enable Classic Theme
echo 2. Disable Classic Theme
echo 3. SKIP
echo C. Cancel
echo.
choice /c 123C /m "Choose an option :"

if 4 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 3 EQU %ERRORLEVEL% (
   call :zkeppp
) else if 2 EQU %ERRORLEVEL% (
   call :classof
) else if 1 EQU %ERRORLEVEL% (
   call :classon
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:classon
echo User chose Enable Classic Theme

rem # Disable Resources
rem # Enable Classic Theme
takeown /s %computername% /u %username% /f "C:\Windows\Resources"
icacls "C:\Windows\Resources" /grant:r %username%:F
rem del "C:\Windows\Resources" /s /f /q
ren "C:\Windows\Resources" "Resourcesbak"

goto :end

:classoff
echo User chose Disable Classic Theme

rem # Enable Resources
rem # Disable Classic Theme
takeown /s %computername% /u %username% /f "C:\Windows\Resources"
icacls "C:\Windows\Resources" /grant:r %username%:F
rem del "C:\Windows\Resources" /s /f /q
ren "C:\Windows\Resourcesbak" "Resources"

goto :end

:zkeppp
echo User chose SKIP

goto :end

:end

PAUSE