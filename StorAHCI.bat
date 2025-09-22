rem # StorAHCI Service

rem # !!! WARNING !!!

rem # REQUIRED FOR SSD AND SPINNY DRIVES

rem # !!! WARNING !!!

PAUSE

@echo off



echo.
echo StorAHCI Service
echo SSD and Spinny Drives
echo.
echo 1. StorAHCI ON
echo 2. StorAHCI OFF
echo 3. SKIP
echo C. Cancel
echo.
choice /c 123C /m "Choose an option :"

if 4 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 3 EQU %ERRORLEVEL% (
   call :sscciippp
) else if 2 EQU %ERRORLEVEL% (
   call :ahcioff
) else if 1 EQU %ERRORLEVEL% (
   call :ahcion
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:ahcion
echo User chose StorAHCI ON

rem # SATA Driver / AHCI Driver
rem # Used for SSD and spinny drives


goto :end

:ahcioff
echo User chose StorAHCI OFF

rem # SATA Driver / AHCI Driver
rem # Used for SSD and spinny drives


goto :end

:sscciippp
echo User chose SKIP

goto :end

:end