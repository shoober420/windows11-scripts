rem Ultimate Performance Plan
rem New GUID is generated after "powercfg -duplicatescheme" command is executed, you must manually set randomly generated GUID using the "powercfg /setactive" command each time
rem Use "powercfg /list" to show all power config plans
rem Use "powercfg -delete" to remove old and unused power config plans
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
REM powercfg /setactive GUID

PAUSE
