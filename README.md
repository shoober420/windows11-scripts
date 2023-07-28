# Windows Batch Scripts
windows11checklist.txt (information on tweaks)

win11tweaks.bat (to disable windows defender, run in safe mode)

disablewinupdate.bat / enablewinupdate.bat

disablewmi.bat / enablewmi.bat (needed for powershell and systeminfo)

disableui.bat / enableui.bat

disablestore.bat / enablestore.bat

disablecomponets.bat / enablecomponents.bat

wing3t.bat (if named "winget", other bat scripts with winget command will attempt to launch this bat script instead of launching winget normally since they are in the same directory and both named "winget")

vcredist.bat

HKCUdsound.reg (adds dsound registry keys needed for older games, like Max Payne)

disablebluetooth.bat / enablebluetooth.bat

disableappx.bat / enableappx.bat (causes "explorer.exe - System warning ! Unknown Hard error" at login screen, black screen after sign in and bugs input if AppXSvc is disabled with State Repository Service enabled) (build 25905)

disablewinhttp.bat / enablewinhttp.bat (borks internet)

disablestaterepository.bat / enablestaterepository.bat (ultra mega minimal only, borks themes and UI)

run.bat
