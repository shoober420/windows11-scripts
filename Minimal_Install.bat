rem # Minimal Installation script

rem # Credits:

rem # https://www.elevenforum.com/members/garlin.5387
rem # https://www.elevenforum.com/members/csmc.38355
rem # jdallmann
rem # Kizzimo
rem # foss-lover34
rem # https://github.com/AlchemyTweaks
rem # https://github.com/TairikuOokami
rem # https://github.com/ionuttbara
rem # https://github.com/Hyyote
rem # https://github.com/MoriEdan
rem # https://github.com/NicholasBly
rem # https://github.com/rahilpathan
rem # https://github.com/ChrisTitusTech
rem # https://github.com/raspi
rem # https://github.com/simeononsecurity
rem # https://sites.google.com/site/tweakradje/windows/windows-tweaking
rem # https://admx.help
rem # https://github.com/ancel1x/Ancels-Performance-Batch
rem # https://github.com/Batlez/Batlez-Tweaks
rem # https://sites.google.com/view/melodystweaks/basictweaks
rem # https://github.com/sherifmagdy32/gaming_os_tweaker
rem # https://github.com/HakanFly/Windows-Tweaks

cd "%~dp0"

< NUL call EnablePowershell.bat
< NUL call VCRedist.bat
< NUL call InternetSettings
< NUL call DisablePerProcessSystemDPI.bat
< NUL call MouseAccelFix.bat
< NUL call NICProperties.bat
< NUL call PowerPlanUltra.bat
< NUL call DisableFullscreenOptimizations.bat
< NUL call ThreadQuantum.bat
< NUL call RemoveRemoteDesktopConnection.bat
< NUL call MTU.bat
< NUL call NetworkTweaks.bat

ECHO R | powershell.exe ./DisableNetBIOS.ps1
ECHO R | powershell.exe ./DNS.ps1

PAUSE