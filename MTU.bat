rem # Maximum Transmission Unit (MTU)
rem # Automatically finds MTU value and applies

rem # garlin: https://www.elevenforum.com/members/garlin.5387/
rem # https://www.elevenforum.com/t/network-tweak-script.30284/#post-523372

rem # Query MTU Size: netsh interface ipv4 show subinterfaces

rem # Disables MTU Discovery, which auto sets MTU value randomly based on traffic, never enable
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUDiscovery" /t REG_DWORD /d "0" /f

netsh interface ipv4 set subinterface "Wi-Fi" mtu=1500 store=persistent
netsh interface ipv4 set subinterface "Ethernet" mtu=1500 store=persistent

TIMEOUT 5

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

netsh interface ipv4 set subinterface "Wi-Fi" minmtu=%MTU% store=persistent
netsh interface ipv4 set subinterface "Ethernet" minmtu=%MTU% store=persistent

netsh interface ipv4 set subinterface "Wi-Fi" maxmtu=%MTU% store=persistent
netsh interface ipv4 set subinterface "Ethernet" maxmtu=%MTU% store=persistent

rem # FastSendDatagramThreshold / FastCopyReceiveThreshold should match MTU value in decimal, not hexadecimal (usually 1472)
rem # https://docs.oracle.com/cd/E13924_01/coh.340/e13818/perftune.htm
rem # As opposed to NVIDIA saying to use a value of 64K, which is meant for jumbo packet enabled configurations
rem # https://docs.nvidia.com/networking/display/winofv55054000/general+performance+optimization+and+tuning
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "FastSendDatagramThreshold" /t REG_DWORD /d "%MTU%" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "FastCopyReceiveThreshold" /t REG_DWORD /d "%MTU%" /f

PAUSE