rem # Updates monitor refresh rate to 240Hz
rem # Requires Refresh Rate Switcher (https://github.com/sryze/RefreshRateSwitcher)

rem # !!!WARNING!!!
rem # Black screen may occur if unsupported refresh rate is chosen]
rem # !!!WARNING!!!

PAUSE

%USERPROFILE%\Downloads\RefreshRateSwitcher-0.1.1-win64\RefreshRateSwitcher.exe RefreshRateSwitcher 0 240

TIMEOUT /T 5
