rem # Thread Quantum
rem # https://smallvoid.com/article/winnt-process-scheduler-priority.html
rem # https://forums.blurbusters.com/viewtopic.php?t=8535

rem # 2A Hex = Short, Fixed, High foreground boost (very good input/latency)
rem # 29 Hex = Short, Fixed, Medium foreground boost
rem # 28 Hex = Short, Fixed, No foreground boost (best input/latency, possible lag spikes)
rem # 26 Hex = Short, Variable, High foreground boost (good input/latency)
rem # 25 Hex = Short, Variable, Medium foreground boost
rem # 24 Hex = Short, Variable, No foreground boost (possible lag spikes)
rem # 1A Hex = Long, Fixed, High foreground boost
rem # 19 Hex = Long, Fixed, Medium foreground boost
rem # 18 Hex = Long, Fixed, No foreground boost
rem # 16 Hex = Long, Variable, High foreground boost (best performance/FPS)
rem # 15 Hex = Long, Variable, Medium foreground boost
rem # 14 Hex = Long, Variable, No foreground boost

rem # "No foreground boost" causes possible lag spikes

rem # Best Input/Latency - 28: Short, Fixed, No foreground boost (possible lag spikes)
rem # Best Performance/FPS - 16: Long, Variable, High foreground boost

reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x00000028" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x00000028" /f

PAUSE
