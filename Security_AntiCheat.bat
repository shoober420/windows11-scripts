rem # Enable Security options for AntiCheats

rem # CS2 / FACEIT (VAC IS OK)
rem # VALORANT / VANGUARD

rem # https://www.elevenforum.com/members/csmc.38355/

for %%a in (valorant valorant-win64-shipping vgtray vgc faceit faceitclient faceitservice) do (
powershell -NoP -C "Set-ProcessMitigation -Name %%a.exe -Enable CFG"
powershell -NoP -C "Set-ProcessMitigation -Name %%a.exe -Enable SEHOP"
powershell -NoP -C "Set-ProcessMitigation -Name %%a.exe -Enable DEP"
powershell -NoP -C "Set-ProcessMitigation -Name %%a.exe -Enable EmulateAtlThunks"
)
bcdedit /set nx OptIn
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /f
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverrideMask /f
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v EnableCfg /f
REG DELETE "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\kernel" /v DisableExceptionChainValidation /f
REG DELETE "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\kernel" /v KernelSEHOPEnabled /f
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v MitigationOptions /f
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v MitigationAuditOptions /f
REG DELETE "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager" /v ProtectionMode /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v MoveImages /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v NoDataExecutionPrevention /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v DisableHHDEP /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /v DEPOff /t REG_DWORD /d 0 /f

PAUSE