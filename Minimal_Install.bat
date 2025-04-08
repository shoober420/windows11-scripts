rem # Minimal Installation script

cd "%~dp0"

./EnablePowershell.bat
./VCRedist.bat
./InternetSettings
./DisablePerProcessSystemDPI.bat
./MouseAccelFix.bat
./NICProperties.bat
./NetworkTweaks.bat
ECHO R | powershell.exe ./DisableNetBIOS.ps1
ECHO R | powershell.exe ./DNS.ps1
./PowerPlanUltra.bat
./DisableFullscreenOptimizations.bat
./ThreadQuantum.bat
./RemoveRemoteDesktopConnection.bat
./MTU.bat

PAUSE