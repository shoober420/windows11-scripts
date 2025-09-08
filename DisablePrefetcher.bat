rem # Disable Prefetcher

rem # !!! WARNING !!!

rem # Causes slow app startup and inconsistent FPS

rem # !!! WARNING !!!

rem # https://en.m.wikipedia.org/wiki/Prefetcher

PAUSE

rem # 0 - Disable Prefetch / 1 - Enable Prefetch when the application starts / 2 - Enable Prefetch when the device starts up / 3 - Enable Prefetch when the application or device starts up (default)

reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetch" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f

PAUSE