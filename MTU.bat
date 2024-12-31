rem # Maximum Transmission Unit (MTU)
rem # Automatically finds MTU value and applies

rem # garlin: https://www.elevenforum.com/members/garlin.5387/
rem # https://www.elevenforum.com/t/network-tweak-script.30284/#post-523372

@echo off
setlocal
set /a MTU=1500

:check_MTU_size
    for /f %%f in ('ping -f -l %MTU% 1.1.1.1 -n 1 ^| find /c "fragmented"') do set result=%%f
    if %result% equ 1 (
        set /a MTU=MTU - 1
        goto :check_MTU_size
    )

echo %MTU%

netsh interface ipv4 set subinterface "Wi-Fi" mtu=%MTU% store=persistent
netsh interface ipv4 set subinterface "Ethernet" mtu=%MTU% store=persistent

PAUSE