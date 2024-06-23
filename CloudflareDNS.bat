rem # Make sure name matches network name, half of internet breaks unless DNS is specified
rem # Enables Cloudflare DNS
netsh interface ip set dns name="Wi-Fi 2" static 1.1.1.1
netsh interface ip add dns name="Wi-Fi 2" 1.1.1.1 index=2

PAUSE
