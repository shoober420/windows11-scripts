rem # Ultimate Performance Plan

rem # Use "powercfg /list" to show all power config plans

rem # Use "powercfg -delete" to remove old and unused power config plans

rem # !!! ATTENTION !!!
rem # New GUID is generated after "powercfg -duplicatescheme" command is executed, you must manually set randomly generated GUID using the "powercfg /setactive" command each time
rem # !!! ATTENTION !!!

rem # Using Ultimate Performance plan causes CPU Utilization to be at 100% percent at all times, this is normal

rem # powercfg /setactive *GUID*

PAUSE

powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61

PAUSE
