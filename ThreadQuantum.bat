rem # Thread Quantum
rem # https://smallvoid.com/article/winnt-process-scheduler-priority.html
rem # https://forums.blurbusters.com/viewtopic.php?t=8535
rem # 2A Hex = Short, Fixed, High foreground boost (very good input)
rem # 29 Hex = Short, Fixed, Medium foreground boost
rem # 28 Hex = Short, Fixed, No foreground boost (best input, possible lag spikes)
rem # 26 Hex = Short, Variable, High foreground boost (good input)
rem # 25 Hex = Short, Variable, Medium foreground boost
rem # 24 Hex = Short, Variable, No foreground boost (possible lag spikes)
rem # 1A Hex = Long, Fixed, High foreground boost
rem # 19 Hex = Long, Fixed, Medium foreground boost
rem # 18 Hex = Long, Fixed, No foreground boost
rem # 16 Hex = Long, Variable, High foreground boost (best performance)
rem # 15 Hex = Long, Variable, Medium foreground boost
rem # 14 Hex = Long, Variable, No foreground boost
rem # Best input: Short, Fixed, No foreground boost (28, possible lag spikes)
rem # Best performance: Long, Variable, High foreground boost (16)
rem # "No foreground boost" causes lag spikes
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x00000028" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "0x00000028" /f

PAUSE
