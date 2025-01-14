# Download ZIP files with PowerShell

# use LAST_CHANGE to find latest build version
# https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Win_x64%2F1406093%2Fchrome-win.zip?generation=1736872063088846&alt=media

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