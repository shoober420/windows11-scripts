rem # Ultimate Performance Plan

rem # Use "powercfg /l" to show all power config plans

rem # Use "powercfg -delete" to remove old and unused power config plans

rem # Using Ultimate Performance plan causes CPU Utilization to be at 100% percent at all times, this is normal

rem # powercfg /setactive *GUID*

PAUSE

rem # https://www.elevenforum.com/members/garlin.5387/
rem # https://www.elevenforum.com/t/select-ultimate-performance-power-plan-guid-automatically.33089/

powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 00000000-0000-0000-0000-000000001234

powercfg /setactive 00000000-0000-0000-0000-000000001234

PAUSE
