# Download ZIP files with PowerShell

# https://commondatastorage.googleapis.com/chromium-browser-snapshots/index.html?prefix=Win_x64/LAST_CHANGE/chrome_win.zip

# URL and Destination
# Enter URL inside the quotes
$url = ""

# Create temp destination for the zip and get zipfile name from source URL
$zipFile = "c:\temp\zipfiles" + $(Split-Path -Path $Url -Leaf)

# Extract path
$extractPath = "c:\temp\zipfiles"

# Download file
Invoke-WebRequest -Uri $url -OutFile $zipFile