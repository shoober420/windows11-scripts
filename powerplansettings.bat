rem Power Scheme GUID is random, set and check GUID matches using "powercfg -L"

rem Disable CPU Parking (fixes stuttering)
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "0" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 0cc5b647-c1df-4637-891a-dec35c318583 0

rem Allow Throttle States ( 0: Off / 1: On / 2: Automatic )
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb" /v "ValueMin" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb" /v "ValueMin" /t REG_DWORD /d "0" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb 0

rem Processor idle disable ( 0: Enable idle / 1: Disable idle )
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\5d76a2ca-e8c0-402f-a133-2158492d58ad" /v "ValueMax" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\5d76a2ca-e8c0-402f-a133-2158492d58ad" /v "ValueMax" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\5d76a2ca-e8c0-402f-a133-2158492d58ad" /v "ValueMin" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\5d76a2ca-e8c0-402f-a133-2158492d58ad" /v "ValueMin" /t REG_DWORD /d "1" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 5d76a2ca-e8c0-402f-a133-2158492d58ad 1

rem Processor idle demote threshold
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4b92d758-5a24-4851-a470-815d78aee119" /v "ValueMax" /t REG_DWORD /d "100" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4b92d758-5a24-4851-a470-815d78aee119" /v "ValueMax" /t REG_DWORD /d "100" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4b92d758-5a24-4851-a470-815d78aee119" /v "ValueMin" /t REG_DWORD /d "100" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4b92d758-5a24-4851-a470-815d78aee119" /v "ValueMin" /t REG_DWORD /d "100" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 4b92d758-5a24-4851-a470-815d78aee119 100

rem Processor idle promote threshold
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7b224883-b3cc-4d79-819f-8374152cbe7c" /v "ValueMax" /t REG_DWORD /d "100" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7b224883-b3cc-4d79-819f-8374152cbe7c" /v "ValueMax" /t REG_DWORD /d "100" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7b224883-b3cc-4d79-819f-8374152cbe7c" /v "ValueMin" /t REG_DWORD /d "100" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\7b224883-b3cc-4d79-819f-8374152cbe7c" /v "ValueMin" /t REG_DWORD /d "100" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 7b224883-b3cc-4d79-819f-8374152cbe7c 100

rem Processor performance time check interval
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4d2b0152-7d5c-498b-88e2-34345392a2c5" /v "ValueMax" /t REG_DWORD /d "5000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4d2b0152-7d5c-498b-88e2-34345392a2c5" /v "ValueMax" /t REG_DWORD /d "5000" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4d2b0152-7d5c-498b-88e2-34345392a2c5" /v "ValueMin" /t REG_DWORD /d "5000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\4d2b0152-7d5c-498b-88e2-34345392a2c5" /v "ValueMin" /t REG_DWORD /d "5000" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 4d2b0152-7d5c-498b-88e2-34345392a2c5 5000

rem Processor idle time check
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c4581c31-89ab-4597-8e2b-9c9cab440e6b" /v "ValueMax" /t REG_DWORD /d "200000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c4581c31-89ab-4597-8e2b-9c9cab440e6b" /v "ValueMax" /t REG_DWORD /d "200000" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c4581c31-89ab-4597-8e2b-9c9cab440e6b" /v "ValueMin" /t REG_DWORD /d "200000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\c4581c31-89ab-4597-8e2b-9c9cab440e6b" /v "ValueMin" /t REG_DWORD /d "200000" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 c4581c31-89ab-4597-8e2b-9c9cab440e6b 200000

rem Processor autonomous activity window
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\cfeda3d0-7697-4566-a922-a9086cd49dfa" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\cfeda3d0-7697-4566-a922-a9086cd49dfa" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\cfeda3d0-7697-4566-a922-a9086cd49dfa" /v "ValueMin" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\cfeda3d0-7697-4566-a922-a9086cd49dfa" /v "ValueMin" /t REG_DWORD /d "0" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 cfeda3d0-7697-4566-a922-a9086cd49dfa 0

rem Slide Show ( 0: Available / 1: Paused )
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\0d7dbae2-4294-402a-ba8e-26777e8488cd\309dce9b-bef4-4119-9921-a851fb12f0f4" /v "ValueMax" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0d7dbae2-4294-402a-ba8e-26777e8488cd\309dce9b-bef4-4119-9921-a851fb12f0f4" /v "ValueMax" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\0d7dbae2-4294-402a-ba8e-26777e8488cd\309dce9b-bef4-4119-9921-a851fb12f0f4" /v "ValueMin" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0d7dbae2-4294-402a-ba8e-26777e8488cd\309dce9b-bef4-4119-9921-a851fb12f0f4" /v "ValueMin" /t REG_DWORD /d "1" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT 0d7dbae2-4294-402a-ba8e-26777e8488cd 309dce9b-bef4-4119-9921-a851fb12f0f4 1

rem Critical battery notification ( 0: Off / 1: On )
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f" /v "ValueMin" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f" /v "ValueMin" /t REG_DWORD /d "0" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT e73a048d-bf27-4f12-9731-8b2076e8891f 5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f 0

rem Critical battery action ( 0: Do nothing / 1: Sleep / 2: Hibernation / 3: Shut down )
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546" /v "ValueMin" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\637ea02f-bbcb-4015-8e2c-a1c7b9c0b546" /v "ValueMin" /t REG_DWORD /d "0" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT e73a048d-bf27-4f12-9731-8b2076e8891f 637ea02f-bbcb-4015-8e2c-a1c7b9c0b546 0

rem Low battery notification ( 0: Off / 1: On )
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\bcded951-187b-4d05-bccc-f7e51960c258" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\bcded951-187b-4d05-bccc-f7e51960c258" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\bcded951-187b-4d05-bccc-f7e51960c258" /v "ValueMin" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\bcded951-187b-4d05-bccc-f7e51960c258" /v "ValueMin" /t REG_DWORD /d "0" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT e73a048d-bf27-4f12-9731-8b2076e8891f bcded951-187b-4d05-bccc-f7e51960c258 0

rem Low battery action ( 0: Do nothing / 1: Sleep / 2: Hibernation / 3: Shut down )
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\d8742dcb-3e6a-4b3c-b3fe-374623cdcf06" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\d8742dcb-3e6a-4b3c-b3fe-374623cdcf06" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\d8742dcb-3e6a-4b3c-b3fe-374623cdcf06" /v "ValueMin" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\e73a048d-bf27-4f12-9731-8b2076e8891f\d8742dcb-3e6a-4b3c-b3fe-374623cdcf06" /v "ValueMin" /t REG_DWORD /d "0" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT e73a048d-bf27-4f12-9731-8b2076e8891f d8742dcb-3e6a-4b3c-b3fe-374623cdcf06 0

rem Interrupt Steering Mode ( 0: Default / 1: Any processor / 2: Any unparked processor with time delay / 3: Any unparked processor / 4: Lock Interrupt Routing / 5: Processor 0 / 6: Processor 1 )
rem Lowers latency and improves performance
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\48672f38-7a9a-4bb2-8bf8-3d85be19de4e\2bfc24f9-5ea2-4801-8213-3dbae01aa39d" /v "ValueMax" /t REG_DWORD /d "6" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672f38-7a9a-4bb2-8bf8-3d85be19de4e\2bfc24f9-5ea2-4801-8213-3dbae01aa39d" /v "ValueMax" /t REG_DWORD /d "6" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\48672f38-7a9a-4bb2-8bf8-3d85be19de4e\2bfc24f9-5ea2-4801-8213-3dbae01aa39d" /v "ValueMin" /t REG_DWORD /d "6" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672f38-7a9a-4bb2-8bf8-3d85be19de4e\2bfc24f9-5ea2-4801-8213-3dbae01aa39d" /v "ValueMin" /t REG_DWORD /d "6" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT 48672f38-7a9a-4bb2-8bf8-3d85be19de4e 2bfc24f9-5ea2-4801-8213-3dbae01aa39d 6

rem Dim display after
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\17aaa29b-8b43-4b94-aafe-35f64daaf1ee" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\17aaa29b-8b43-4b94-aafe-35f64daaf1ee" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\17aaa29b-8b43-4b94-aafe-35f64daaf1ee" /v "ValueMin" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\17aaa29b-8b43-4b94-aafe-35f64daaf1ee" /v "ValueMin" /t REG_DWORD /d "0" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT 7516b95f-f776-4464-8c53-06167f40cc99 17aaa29b-8b43-4b94-aafe-35f64daaf1ee 0

rem Turn off display after
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e" /v "ValueMin" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e" /v "ValueMin" /t REG_DWORD /d "0" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 0

rem Primary NVMe Idle Timeout
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d639518a-e56d-4345-8af2-b9f32fb26109" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d639518a-e56d-4345-8af2-b9f32fb26109" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d639518a-e56d-4345-8af2-b9f32fb26109" /v "ValueMin" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d639518a-e56d-4345-8af2-b9f32fb26109" /v "ValueMin" /t REG_DWORD /d "0" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT 0012ee47-9041-4b5d-9b77-535fba8b1442 d639518a-e56d-4345-8af2-b9f32fb26109 0

rem Secondary NVMe Idle Timeout
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d3d55efd-c1ff-424e-9dc3-441be7833010" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d3d55efd-c1ff-424e-9dc3-441be7833010" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d3d55efd-c1ff-424e-9dc3-441be7833010" /v "ValueMin" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\d3d55efd-c1ff-424e-9dc3-441be7833010" /v "ValueMin" /t REG_DWORD /d "0" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT 0012ee47-9041-4b5d-9b77-535fba8b1442 d3d55efd-c1ff-424e-9dc3-441be7833010 0

rem Execution Required power request timeout
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\2e601130-5351-4d9d-8e04-252966bad054\3166bc41-7e98-4e03-b34e-ec0f5f2b218e" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2e601130-5351-4d9d-8e04-252966bad054\3166bc41-7e98-4e03-b34e-ec0f5f2b218e" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\2e601130-5351-4d9d-8e04-252966bad054\3166bc41-7e98-4e03-b34e-ec0f5f2b218e" /v "ValueMin" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2e601130-5351-4d9d-8e04-252966bad054\3166bc41-7e98-4e03-b34e-ec0f5f2b218e" /v "ValueMin" /t REG_DWORD /d "0" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT 2e601130-5351-4d9d-8e04-252966bad054 3166bc41-7e98-4e03-b34e-ec0f5f2b218e 0

rem Unparked time trigger
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\48672f38-7a9a-4bb2-8bf8-3d85be19de4e\d6ba4903-386f-4c2c-8adb-5c21b3328d25" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672f38-7a9a-4bb2-8bf8-3d85be19de4e\d6ba4903-386f-4c2c-8adb-5c21b3328d25" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\48672f38-7a9a-4bb2-8bf8-3d85be19de4e\d6ba4903-386f-4c2c-8adb-5c21b3328d25" /v "ValueMin" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\48672f38-7a9a-4bb2-8bf8-3d85be19de4e\d6ba4903-386f-4c2c-8adb-5c21b3328d25" /v "ValueMin" /t REG_DWORD /d "0" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT 48672f38-7a9a-4bb2-8bf8-3d85be19de4e d6ba4903-386f-4c2c-8adb-5c21b3328d25 0

rem Human Presence Sensor Adaptive Away Display Timeout
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\8619b916-e004-4dd8-9b66-dae86f806698\0a7d6ab6-ac83-4ad1-8282-eca5b58308f3" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619b916-e004-4dd8-9b66-dae86f806698\0a7d6ab6-ac83-4ad1-8282-eca5b58308f3" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\8619b916-e004-4dd8-9b66-dae86f806698\0a7d6ab6-ac83-4ad1-8282-eca5b58308f3" /v "ValueMin" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619b916-e004-4dd8-9b66-dae86f806698\0a7d6ab6-ac83-4ad1-8282-eca5b58308f3" /v "ValueMin" /t REG_DWORD /d "0" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT 8619b916-e004-4dd8-9b66-dae86f806698 0a7d6ab6-ac83-4ad1-8282-eca5b58308f3 0

rem Non-sensor Input Presence Timeout
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\8619b916-e004-4dd8-9b66-dae86f806698\5adbbfbc-074e-4da1-ba38-db8b36b2c8f3" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619b916-e004-4dd8-9b66-dae86f806698\5adbbfbc-074e-4da1-ba38-db8b36b2c8f3" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\8619b916-e004-4dd8-9b66-dae86f806698\5adbbfbc-074e-4da1-ba38-db8b36b2c8f3" /v "ValueMin" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619b916-e004-4dd8-9b66-dae86f806698\5adbbfbc-074e-4da1-ba38-db8b36b2c8f3" /v "ValueMin" /t REG_DWORD /d "0" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT 8619b916-e004-4dd8-9b66-dae86f806698 5adbbfbc-074e-4da1-ba38-db8b36b2c8f3 0

rem Human Presence Sensor Adaptive Inattentive Dim Timeout
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\8619b916-e004-4dd8-9b66-dae86f806698\cf8c6097-12b8-4279-bbdd-44601ee5209d" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619b916-e004-4dd8-9b66-dae86f806698\cf8c6097-12b8-4279-bbdd-44601ee5209d" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\8619b916-e004-4dd8-9b66-dae86f806698\cf8c6097-12b8-4279-bbdd-44601ee5209d" /v "ValueMin" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\8619b916-e004-4dd8-9b66-dae86f806698\cf8c6097-12b8-4279-bbdd-44601ee5209d" /v "ValueMin" /t REG_DWORD /d "0" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT 8619b916-e004-4dd8-9b66-dae86f806698 cf8c6097-12b8-4279-bbdd-44601ee5209d 0

rem System unattended sleep timeout
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\238c9fa8-0aad-41ed-83f4-97be242c8f20\7bc4a2f9-d8fc-4469-b07b-33eb785aaca0" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238c9fa8-0aad-41ed-83f4-97be242c8f20\7bc4a2f9-d8fc-4469-b07b-33eb785aaca0" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\238c9fa8-0aad-41ed-83f4-97be242c8f20\7bc4a2f9-d8fc-4469-b07b-33eb785aaca0" /v "ValueMin" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238c9fa8-0aad-41ed-83f4-97be242c8f20\7bc4a2f9-d8fc-4469-b07b-33eb785aaca0" /v "ValueMin" /t REG_DWORD /d "0" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 7bc4a2f9-d8fc-4469-b07b-33eb785aaca0 0

rem Allow hybrid sleep
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\238c9fa8-0aad-41ed-83f4-97be242c8f20\94ac6d29-73ce-41a6-809f-6363ba21b47e" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238c9fa8-0aad-41ed-83f4-97be242c8f20\94ac6d29-73ce-41a6-809f-6363ba21b47e" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\238c9fa8-0aad-41ed-83f4-97be242c8f20\94ac6d29-73ce-41a6-809f-6363ba21b47e" /v "ValueMin" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238c9fa8-0aad-41ed-83f4-97be242c8f20\94ac6d29-73ce-41a6-809f-6363ba21b47e" /v "ValueMin" /t REG_DWORD /d "0" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e 0

rem Allow Standby States
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\238c9fa8-0aad-41ed-83f4-97be242c8f20\abfc2519-3608-4c2a-94ea-171b0ed546ab" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238c9fa8-0aad-41ed-83f4-97be242c8f20\abfc2519-3608-4c2a-94ea-171b0ed546ab" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\238c9fa8-0aad-41ed-83f4-97be242c8f20\abfc2519-3608-4c2a-94ea-171b0ed546ab" /v "ValueMin" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238c9fa8-0aad-41ed-83f4-97be242c8f20\abfc2519-3608-4c2a-94ea-171b0ed546ab" /v "ValueMin" /t REG_DWORD /d "0" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 abfc2519-3608-4c2a-94ea-171b0ed546ab 0

rem Allow wake timers
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\238c9fa8-0aad-41ed-83f4-97be242c8f20\bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238c9fa8-0aad-41ed-83f4-97be242c8f20\bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\238c9fa8-0aad-41ed-83f4-97be242c8f20\bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d" /v "ValueMin" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238c9fa8-0aad-41ed-83f4-97be242c8f20\bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d" /v "ValueMin" /t REG_DWORD /d "0" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 0

rem Hub Selective Suspend Timeout
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\0853a681-27c8-4100-a2fd-82013e970683" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\0853a681-27c8-4100-a2fd-82013e970683" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\0853a681-27c8-4100-a2fd-82013e970683" /v "ValueMin" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\0853a681-27c8-4100-a2fd-82013e970683" /v "ValueMin" /t REG_DWORD /d "0" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT 2a737441-1930-4402-8d77-b2bebba308a3 0853a681-27c8-4100-a2fd-82013e970683 0

rem USB selective suspend setting
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\48e6b7a6-50f5-4782-a5d4-53bb8f07e226" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\48e6b7a6-50f5-4782-a5d4-53bb8f07e226" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\48e6b7a6-50f5-4782-a5d4-53bb8f07e226" /v "ValueMin" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\48e6b7a6-50f5-4782-a5d4-53bb8f07e226" /v "ValueMin" /t REG_DWORD /d "0" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0

rem USB 3 Link Power Mangement
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009" /v "ValueMin" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009" /v "ValueMin" /t REG_DWORD /d "0" /f
powercfg /SETACVALUEINDEX SCHEME_CURRENT 2a737441-1930-4402-8d77-b2bebba308a3 d4e98f31-5ffe-4ce1-be31-1b38b384c009 0
