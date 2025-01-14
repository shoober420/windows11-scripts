# Download ZIP files with PowerShell

# URL and Destination
# Enter URL inside the quotes
$url = ""

# Create temp destination for the zip and get zipfile name from source URL
$zipFile = "c:\temp\zipfiles" + $(Split-Path -Path $Url -Leaf)

# Extract path
$extractPath = "c:\temp\zipfiles"

# Download file
Invoke-WebRequest -Uri $url -OutFile $zipFile