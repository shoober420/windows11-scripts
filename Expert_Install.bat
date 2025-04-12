rem # Expert Installation script
rem # Launches scripts to disable Windows Defender and other security features
rem # Launch in SAFE MODE

cd "%~dp0"

< NUL call DisableWindowsDefender.bat
< NUL call DisableWindowsFirewall.bat
< NUL call DisableWindowsSecurityCenter.bat
< NUL call DisableEventTraceSessions.bat
< NUL call DisableSAM.bat
< NUL call DisableLanmanServer.bat
< NUL call DisableStartMenu.bat
< NUL call DisableComponents.bat
< NUL call DisableWindowsSearch.bat
< NUL call DeleteFonts.bat

PAUSE