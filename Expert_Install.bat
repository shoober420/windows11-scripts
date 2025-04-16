rem # Expert Installation script
rem # Launches scripts to disable Windows Defender and other security features
rem # Launch in SAFE MODE

cd "%~dp0"

call SetACL.bat
cd "%~dp0"

call DisableWindowsDefender.bat
cd "%~dp0"

call DisableWindowsFirewall.bat
cd "%~dp0"

call DisableWindowsSecurityCenter.bat
cd "%~dp0"

call DisableEventTraceSessions.bat
cd "%~dp0"

call DisableSAM.bat
cd "%~dp0"

call DisableLanmanServer.bat
cd "%~dp0"

call DisableStartMenu.bat
cd "%~dp0"

call DisableComponents.bat
cd "%~dp0"

call DisableWindowsSearch.bat
cd "%~dp0"

call DeleteFonts.bat
cd "%~dp0"

call DisableServicesIntel.bat
cd "%~dp0"

call DisableServicesAMD.bat
cd "%~dp0"

PAUSE