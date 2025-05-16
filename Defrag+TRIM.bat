rem # Defrag and TRIM SSD and NVMe

defrag /C /O
powershell "Optimize-Volume -DriveLetter C -ReTrim -Verbose"

PAUSE