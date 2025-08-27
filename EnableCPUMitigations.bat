rem # CPU Mitigations

rem # https://mskb.pkisolutions.com/kb/4072698

rem # https://support.microsoft.com/en-us/topic/kb4073119-windows-client-guidance-for-it-pros-to-protect-against-silicon-based-microarchitectural-and-speculative-execution-side-channel-vulnerabilities-35820a8a-ae13-1299-88cc-357f104f5b11

rem # 0 (DEFAULT) = Enable CVE-2017-5715 (Spectre Variant 2) and CVE-2017-5754 (Meltdown) Mitigations

rem # 3 = Disable CVE-2017-5715 (Spectre Variant 2) and CVE-2017-5754 (Meltdown) Mitigations

rem # FULL MITIGATION PROTECTION / HYPER-THREADING ON: FeatureSettingsOverride DWORD 72

rem # FULL MITIGATION PROTECTION / HYPER-THREADING OFF: FeatureSettingsOverride DWORD 8264

rem # FeatureSettingsOverrideMask MUST BE 3 TO FORCE USER SETTINGS



@echo off



echo.
echo CPU Mitigation Options
echo.
echo 1. Enable CVE-2017-5715 (Spectre Variant 2) and CVE-2017-5754 (Meltdown) Mitigations / 0 (DEFAULT) (RECOMMENDED)
echo 2. Enable Full Mitigation Protection (Hyper-Threading ON) (NOT RECOMMENDED: BIG FPS DROP)
echo 3. Enable Full Mitigation Protection (Hyper-Threading OFF) (NOT RECOMMENDED: BIG FPS DROP)
echo 4. Disable CPU Mitigations (NOT RECOMMENDED: SECURITY RISK)
echo C. Cancel
echo.
choice /c 1234C /m "Choose an option :"

if 5 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 4 EQU %ERRORLEVEL% (
   call :cpud
) else if 3 EQU %ERRORLEVEL% (
   call :cpunoht
) else if 2 EQU %ERRORLEVEL% (
   call :cpuht
) else if 1 EQU %ERRORLEVEL% (
   call :cpu0
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:cpu0
echo User chose Enable CVE-2017-5715 (Spectre Variant 2) and CVE-2017-5754 (Meltdown) Mitigations / 0 (DEFAULT) (RECOMMENDED)

reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f
rem reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "0" /f

goto :end

:cpuht
echo User chose Enable Full Mitigation Protection (Hyper-Threading ON) (NOT RECOMMENDED: BIG FPS DROP)

reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "72" /f
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f
rem reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "0" /f

goto :end

:cpunoht
echo User chose Enable Full Mitigation Protection (Hyper-Threading OFF) (NOT RECOMMENDED: BIG FPS DROP)

reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "8264" /f
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f
rem reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "0" /f

goto :end

:cpud
echo User chose Disable CPU Mitigations (NOT RECOMMENDED: SECURITY RISK)

reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f
rem reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "0" /f

goto :end

:end

PAUSE