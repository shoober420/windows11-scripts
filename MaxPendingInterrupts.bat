Windows Registry Editor Version 5.00

;Founder by kizzimo

; CPU Performance Tuning
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment]
"CPU_MAX_PENDING_INTERRUPTS"="0"  ; Minimizes the number of interrupts waiting, reducing latency.
"CPU_MAX_PENDING_IO"="0"           ; Keeps I/O processing instant, minimizing wait times.
"CPU_IDLE_POLICY"="0"              ; Prevents CPU from idling to maintain maximum performance.
"CPU_BOOST_POLICY"="2"             ; Always allows the CPU to boost for better performance.
"CPU_MAX_FREQUENCY"="100"          ; Allows the CPU to reach maximum frequency.
"CPU_INTERRUPT_BALANCE_POLICY"="1" ; Ensures interrupts are balanced across all CPU cores.
"MKL_DEBUG_CPU_TYPE"="10"

; I/O Performance Tuning
"IO_COMPLETION_POLICY"="0"         ; Immediate completion of I/O requests to minimize latency.
"IO_REQUEST_LIMIT"="1024"          ; Increases the number of simultaneous I/O requests.
"DISK_MAX_PENDING_IO"="0"          ; No pending I/O for disk operations, reducing read/write latency.
"IO_PRIORITY"="0"                  ; Maximize I/O priority for all operations to minimize bottlenecks.
"DISK_MAX_PENDING_INTERRUPTS"="0"
"IO_MAX_PENDING_INTERRUPTS"="0"

; Power Management and Performance
"POWER_THROTTLE_POLICY"="0"        ; Disables power throttling, ensuring high performance at all times.
"POWER_IDLE_TIMEOUT"="0"           ; Disables idle timeout to maintain continuous high performance.
"CPU_POWER_POLICY"="1"             ; Enforces high-performance power policy, disabling all power-saving features.
"DISABLE_DYNAMIC_TICK"="yes"

; Memory and Latency Tuning
"MEMORY_MAX_ALLOCATION"="0"     ; Increase memory allocation to allow more data in memory for faster access.
"MEMORY_LATENCY_POLICY"="0"        ; Minimizes memory latency, optimizing for faster memory access.
"MEMORY_PREFETCH_POLICY"="2"       ; Enables memory prefetch to speed up data access in memory.
"MEMORY_MAX_PENDING_INTERRUPTS"="0"
"DWM_MAX_PENDING_INTERRUPTS"="0"
"DWM_COMPOSITOR_MAX_PENDING_INTERRUPTS"="0"

; Network and Connectivity Tuning
"NETWORK_BUFFER_SIZE"="512"       ; Increases network buffer size for faster throughput.
"NETWORK_INTERRUPT_COALESCING"="0" ; Disables interrupt coalescing for lower network latency.
"NETWORK_MAX_PENDING_INTERRUPTS"="0"

; Miscellaneous Performance Tuning
"TIMER_RESOLUTION"="0"             ; Sets the smallest possible timer resolution for the highest responsiveness.
"THREAD_SCHEDULER_POLICY"="0"      ; Prioritizes immediate thread scheduling to reduce latency.
"GPU_MAX_PENDING_INTERRUPTS"="0"   ; Minimizes GPU interrupts for faster rendering.

; Network Adapter Performance Tuning
"NETWORK_ADAPTER_PENDING_INTERRUPTS"="0"        ; Ensures no pending interrupts for network devices.
"NETWORK_ADAPTER_MAX_PENDING_IO"="0"            ; Ensures instant I/O processing for network operations.
"NETWORK_ADAPTER_INTERRUPT_MODERATION"="0"      ; Disables interrupt moderation for lower network latency.
"NETWORK_ADAPTER_MAX_PENDING_INTERRUPTS"="0"

; Storage Device (HDD/SSD) Performance Tuning
"STORAGE_DEVICE_PENDING_INTERRUPTS"="0"         ; Ensures no pending interrupts for storage devices.
"STORAGE_DEVICE_MAX_PENDING_IO"="0"             ; Ensures storage I/O operations are processed immediately.
"STORAGE_DEVICE_COMPLETION_POLICY"="0"          ; Forces immediate completion of storage I/O tasks.
"STORAGE_MAX_PENDING_INTERRUPTS"="0"
"STORAGE_DEVICE_MAX_PENDING_INTERRUPTS"="0" 

; USB Device Performance Tuning
"USB_DEVICE_PENDING_INTERRUPTS"="0"             ; No pending interrupts for USB devices.
"USB_DEVICE_MAX_PENDING_IO"="0"                 ; Processes USB I/O instantly, reducing latency.
"USB_MAX_PENDING_INTERRUPTS"="0"
"USB_DEVICE_MAX_PENDING_INTERRUPTS"="0" 

; PCIe Device Performance Tuning
"PCIE_DEVICE_PENDING_INTERRUPTS"="0"            ; No pending interrupts for PCIe devices.
"PCIE_DEVICE_MAX_PENDING_IO"="0"                ; Ensures PCIe I/O operations are processed immediately.
"PCIE_MAX_PENDING_INTERRUPTS"="0"
"PCIE_DEVICE_MAX_PENDING_INTERRUPTS"="0"

; GPU Performance Tuning
"GPU_PENDING_INTERRUPTS"="0"                    ; Reduces GPU interrupt queue to zero for immediate processing.
"GPU_MAX_PENDING_COMPUTE"="0"                   ; Ensures compute operations are processed without delay.
"GPU_MAX_PENDING_RENDER"="0"                    ; Forces immediate rendering tasks processing.

; Audio Device Performance Tuning
"AUDIO_DEVICE_PENDING_INTERRUPTS"="0"           ; Ensures no pending interrupts for sound cards.
"AUDIO_DEVICE_BUFFER_SIZE"="512"                ; Keeps audio buffer size low to reduce latency in sound processing.
"AUDIO_MAX_PENDING_INTERRUPTS"="0"
"AUDIO_DEVICE_MAX_PENDING_INTERRUPTS"="0" 

; General Device Tuning
"DEVICE_PENDING_INTERRUPTS"="0"                 ; Generic setting to ensure no pending interrupts for all devices.
"DEVICE_MAX_PENDING_IO"="0"                     ; Ensures immediate I/O operations across all devices.
"DEVICE_COMPLETION_POLICY"="0"                  ; Forces devices to complete tasks instantly.
"DEVICE_MAX_PENDING_INTERRUPTS"="0"

