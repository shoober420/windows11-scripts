rem # NoConnectedUser

rem # !!! WARNING !!!

REM # USING 3 BLOCKS MICROSOFT ACCOUNT LOGIN

rem # !!! WARNING !!!

PAUSE



echo off



echo.
echo NoConnectedUser
echo.
echo 1. Allow login and account creation (0: Default)
echo 2. Allow Microsoft login and block account creation (1)
echo 3. Block Microsoft login and block account creation (3)
echo 4. SKIP
echo C. Cancel
echo.
choice /c 1234C /m "Choose an option :"

if 5 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 4 EQU %ERRORLEVEL% (
   call :zcip
) else if 3 EQU %ERRORLEVEL% (
   call :ncu3
) else if 2 EQU %ERRORLEVEL% (
   call :ncu1
) else if 1 EQU %ERRORLEVEL% (
   call :ncu0
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:ncu0
echo User chose Allow login and account creation (0: Default)

rem # 0 = Allow users to add accounts / 1 = Blocks users from adding accounts / 3 = Blocks users from adding accounts and signing into accounts
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "NoConnectedUser" /t REG_DWORD /d "0" /f

goto :end

:ncu1
echo User chose Allow Microsoft login and block account creation (1)

rem # 0 = Allow users to add accounts / 1 = Blocks users from adding accounts / 3 = Blocks users from adding accounts and signing into accounts
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "NoConnectedUser" /t REG_DWORD /d "1" /f

goto :end

:ncu3
echo User chose Block Microsoft login and block account creation (3)

rem # 0 = Allow users to add accounts / 1 = Blocks users from adding accounts / 3 = Blocks users from adding accounts and signing into accounts
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "NoConnectedUser" /t REG_DWORD /d "3" /f

goto :end

:zcip
echo User chose SKIP

goto :end

:end

PAUSE
