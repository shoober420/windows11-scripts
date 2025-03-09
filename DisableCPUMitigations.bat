rem # Disable CPU Mitigations

rem # !!! WARNING !!!

rem # GAMING PCS ONLY
rem # DONT DO SENSITIVE TASKS LIKE BANKING

rem # !!! WARNING !!!

PAUSE

rem 0/3 - Enable / 3/3 - Disable mitigations for CVE-2017-5715 (Spectre Variant 2) and CVE-2017-5754 (Meltdown)
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f

PAUSE