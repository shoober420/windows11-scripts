# Download ZIP files with PowerShell

# https://commondatastorage.googleapis.com/chromium-browser-snapshots/index.html?prefix=Win_x64/LAST_CHANGE/chrome_win.zip

# https://github.com/shoober420/windows11-scripts/archive/refs/heads/main.zip

# URL and Destination
# Enter URL inside the quotes
$url = ""

# Create temp destination for the zip and get zipfile name from source URL
$zipFile = "c:\temp\zipfiles" + $(Split-Path -Path $Url -Leaf)

# Extract path
$extractPath = "c:\temp\zipfiles"

# Download file
# Change $zipFile to desired file name
Invoke-WebRequest -Uri $url -OutFile $zipFile