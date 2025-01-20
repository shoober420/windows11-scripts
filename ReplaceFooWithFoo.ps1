# Replace foo with foo in a script
# Useful for debugging

# Copy-Item C:\Users\$env:username\Downloads\windows11-scripts-main\foo.bat -Destination C:\Users\$env:username\Downloads\windows11-scripts-main\foo.batBACKUP
# $content = Get-Content -Path C:\Users\$env:username\Downloads\windows11-scripts-main\foo.bat
# $newcontent = $content -replace 'foo', 'foo' | Set-Content C:\Users\$env:username\Downloads\windows11-scripts-main\foo.bat

# For registry tweaks
Copy-Item C:\Users\$env:username\Downloads\windows11-scripts-main\foo.bat -Destination C:\Users\$env:username\Downloads\windows11-scripts-main\foo.batBACKUP
$content = Get-Content -Path C:\Users\$env:username\Downloads\windows11-scripts-main\foo.bat
$newcontent = $content -replace 'reg add', 'ECHO Yes | reg delete' -replace '/t REG_DWORD /d "0" /f', '' -replace '/t REG_DWORD /d "1" /f', '' -replace ' /t REG_DWORD /d 0 /f', '' -replace ' /t REG_DWORD /d 1 /f', '' -replace '" /v "', '\' -replace '" /v ', '\' | Set-Content C:\Users\$env:username\Downloads\windows11-scripts-main\foo.bat

PAUSE