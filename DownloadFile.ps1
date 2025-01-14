rem # Download file with PowerShell
 
rem # https://raw.githubusercontent.com/shoober420/windows11-scripts/refs/heads/main/

rem # https://commondatastorage.googleapis.com/chromium-browser-snapshots/index.html?prefix=Win_x64/LAST_CHANGE/chrome_win.zip

rem # Change $Path to desired file name
 
Invoke-WebRequest -URI $URL -OutFile $Path