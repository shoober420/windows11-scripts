rem # Enable extra PowerPlan options

rem # !!! WARNING !!!

rem # THESE SETTINGS ARE UNNECESSARY TO TWEAK

rem # SCRIPT WILL UNHIDE ADDITIONAL POWER PLAN OPTIONS WHICH ARE NOT NEEDED

rem # USE POWERPLANULTRA.BAT ONLY

rem # TESTING ONLY

rem # !!! WARNING !!!

rem # WinRE "Refresh your PC" will not remove tweaked Ultimate Performance power plan, you must load another power plan and delete the tweaked Ultimate Performance power plan to restore default power plan settings

PAUSE

rem # Reserve battery level
powercfg -attributes e73a048d-bf27-4f12-9731-8b2076e8891f f3c5027d-cd16-4930-aa6b-90db844a8f00 -ATTRIB_HIDE

rem # Maximum processor frequency
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 75b0ae3f-bce0-45a7-8c89-c9611c25e100 -ATTRIB_HIDE

rem # Maximum processor frequency for Processor Power Efficiency Class 1
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 75b0ae3f-bce0-45a7-8c89-c9611c25e101 -ATTRIB_HIDE

rem # Processor idle threshold scaling
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 6c2993b0-8f48-481f-bcc6-00dd2742aa06 -ATTRIB_HIDE

rem # Low battery action
powercfg -attributes e73a048d-bf27-4f12-9731-8b2076e8891f d8742dcb-3e6a-4b3c-b3fe-374623cdcf06 -ATTRIB_HIDE

rem # NVMe Idle Timeout
powercfg -attributes 0012ee47-9041-4b5d-9b77-535fba8b1442 d639518a-e56d-4345-8af2-b9f32fb26109 -ATTRIB_HIDE

rem # USB 3 Link Power Mangement
powercfg -attributes 2a737441-1930-4402-8d77-b2bebba308a3 d4e98f31-5ffe-4ce1-be31-1b38b384c009 -ATTRIB_HIDE

rem # Low battery level
powercfg -attributes e73a048d-bf27-4f12-9731-8b2076e8891f 8183ba9a-e910-48da-8769-14ae6dc1170a -ATTRIB_HIDE

rem # NVMe Power State Transition Latency Tolerance
powercfg -attributes 0012ee47-9041-4b5d-9b77-535fba8b1442 fc95af4d-40e7-4b6d-835a-56d131dbc80e -ATTRIB_HIDE

rem # Processor performance increase policy
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 465e1f50-b610-473a-ab58-00d1077dc418 -ATTRIB_HIDE

rem # Processor performance increase policy for Processor Power Efficiency Class 1
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 465e1f50-b610-473a-ab58-00d1077dc419 -ATTRIB_HIDE

rem # Processor idle demote threshold
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 4b92d758-5a24-4851-a470-815d78aee119 -ATTRIB_HIDE

rem # Power Saving Mode
powercfg -attributes 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a -ATTRIB_HIDE

rem # Standby Reset Percentage
powercfg -attributes 8619b916-e004-4dd8-9b66-dae86f806698 49cb11a5-56e2-4afb-9d38-3df47872e21b -ATTRIB_HIDE

rem # Allow display required policy
powercfg -attributes 7516b95f-f776-4464-8c53-06167f40cc99 a9ceb8da-cd46-44fb-a98b-02af69de4623 -ATTRIB_HIDE

rem # Unparked time trigger
powercfg -attributes 48672f38-7a9a-4bb2-8bf8-3d85be19de4e d6ba4903-386f-4c2c-8adb-5c21b3328d25 -ATTRIB_HIDE

rem # USB selective suspend setting
powercfg -attributes 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 -ATTRIB_HIDE

rem # Processor Idle Resiliency Timer Resolution
powercfg -attributes 2e601130-5351-4d9d-8e04-252966bad054 c42b79aa-aa3a-484b-a98f-2cf32aa90a28 -ATTRIB_HIDE

rem # Processor performance core parking max cores
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 ea062031-0e34-4ff1-9b6d-eb1059334028 -ATTRIB_HIDE

rem # Processor performance core parking max cores for Processor Power Efficiency Class 1
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 ea062031-0e34-4ff1-9b6d-eb1059334029 -ATTRIB_HIDE

rem # Processor performance core parking decrease policy
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 71021b41-c749-4d21-be74-a00f335d582b -ATTRIB_HIDE

rem # Processor performance core parking parked performance state
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 447235c7-6a8d-4cc0-8e24-9eaf70b96e2b -ATTRIB_HIDE

rem # Processor performance core parking parked performance state for Processor Power Efficiency Class 1
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 447235c7-6a8d-4cc0-8e24-9eaf70b96e2c -ATTRIB_HIDE

rem # Processor performance core parking increase time
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 2ddd5a84-5a71-437e-912a-db0b8c788732 -ATTRIB_HIDE

rem # IO coalescing timeout
powercfg -attributes 2e601130-5351-4d9d-8e04-252966bad054 c36f0eb4-2988-4a70-8eee-0884fc2c2433 -ATTRIB_HIDE

rem # Lid close action
powercfg -attributes 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 -ATTRIB_HIDE

rem # Processor performance autonomous mode
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 8baa4a8a-14c6-4451-8e8b-14bdbd197537 -ATTRIB_HIDE

rem # Standby Reserve Grace Period
powercfg -attributes 8619b916-e004-4dd8-9b66-dae86f806698 c763ee92-71e8-4127-84eb-f6ed043a3e3d -ATTRIB_HIDE

rem # Standby Budget Grace Period
powercfg -attributes 8619b916-e004-4dd8-9b66-dae86f806698 60c07fe1-0556-45cf-9903-d56e32210242 -ATTRIB_HIDE

rem # Deep Sleep Enabled/Disabled
powercfg -attributes 2e601130-5351-4d9d-8e04-252966bad054 d502f7ee-1dc7-4efd-a55d-f04b6f5c0545 -ATTRIB_HIDE

rem # Critical battery action
powercfg -attributes e73a048d-bf27-4f12-9731-8b2076e8891f 637ea02f-bbcb-4015-8e2c-a1c7b9c0b546 -ATTRIB_HIDE

rem # Video playback quality bias.
powercfg -attributes 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 10778347-1370-4ee0-8bbd-33bdacaade49 -ATTRIB_HIDE

rem # Minimum processor state
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 893dee8e-2bef-41e0-89c6-b55d0929964c -ATTRIB_HIDE

rem # Minimum processor state for Processor Power Efficiency Class 1
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 893dee8e-2bef-41e0-89c6-b55d0929964d -ATTRIB_HIDE

rem # Allow sleep with remote opens
powercfg -attributes 238c9fa8-0aad-41ed-83f4-97be242c8f20 d4c1d4c8-d5cc-43d3-b83e-fc51215cb04d -ATTRIB_HIDE

rem # AHCI Link Power Management - Adaptive
powercfg -attributes 0012ee47-9041-4b5d-9b77-535fba8b1442 dab60367-53fe-4fbc-825e-521d069d2456 -ATTRIB_HIDE

rem # Low battery notification
powercfg -attributes e73a048d-bf27-4f12-9731-8b2076e8891f bcded951-187b-4d05-bccc-f7e51960c258 -ATTRIB_HIDE

rem # Processor performance boost policy
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 45bcc044-d885-43e2-8605-ee0ec6e96b59 -ATTRIB_HIDE

rem # Adaptive display
powercfg -attributes 7516b95f-f776-4464-8c53-06167f40cc99 90959d22-d6a1-49b9-af93-bce885ad335b -ATTRIB_HIDE

rem # Processor performance increase threshold
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 06cadf0e-64ed-448a-8927-ce7bf90eb35d -ATTRIB_HIDE

rem # Processor performance core parking concurrency headroom threshold
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 f735a673-2066-4f80-a0c5-ddee0cf1bf5d -ATTRIB_HIDE

rem # Processor performance increase threshold for Processor Power Efficiency Class 1
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 06cadf0e-64ed-448a-8927-ce7bf90eb35e -ATTRIB_HIDE

rem # Processor performance history count
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 7d24baa7-0b84-480f-840c-1b0743c00f5f -ATTRIB_HIDE

rem # Processor performance history count for Processor Power Efficiency Class 1
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 7d24baa7-0b84-480f-840c-1b0743c00f60 -ATTRIB_HIDE

rem # AHCI Link Power Management - HIPM/DIPM
powercfg -attributes 0012ee47-9041-4b5d-9b77-535fba8b1442 0b2d69d7-a2a1-449c-9680-f91c70521c60 -ATTRIB_HIDE

rem # Processor energy performance preference policy
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 36687f9e-e3a5-4dbf-b1dc-15eb381c6863 -ATTRIB_HIDE

rem # Hard disk burst ignore time
powercfg -attributes 0012ee47-9041-4b5d-9b77-535fba8b1442 80e3c60e-bb94-4ad8-bbe0-0d3195efc663 -ATTRIB_HIDE

rem # Hibernate after
powercfg -attributes 238c9fa8-0aad-41ed-83f4-97be242c8f20 9d7815a6-7ee4-497e-8888-515a05f02364 -ATTRIB_HIDE

rem # Critical battery level
powercfg -attributes e73a048d-bf27-4f12-9731-8b2076e8891f 9a66d8d7-4ff7-4ef9-b5a2-5a326ca2a469 -ATTRIB_HIDE

rem # Processor idle time check
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 c4581c31-89ab-4597-8e2b-9c9cab440e6b -ATTRIB_HIDE

rem # Processor performance level decrease threshold for Processor Power Efficiency Class 1 processor count decrease
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 f8861c27-95e7-475c-865b-13c0cb3f9d6b -ATTRIB_HIDE

rem # Allow wake timers
powercfg -attributes 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d -ATTRIB_HIDE

rem # Turn off hard disk after
powercfg -attributes 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e -ATTRIB_HIDE

rem # Latency sensitivity hint processor performance
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 619b7505-003b-4e82-b7a6-4dd29c300971 -ATTRIB_HIDE

rem # Latency sensitivity hint processor performance for Processor Power Efficiency Class 1
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 619b7505-003b-4e82-b7a6-4dd29c300972 -ATTRIB_HIDE

rem # Setting IOC on all TDs
powercfg -attributes 2a737441-1930-4402-8d77-b2bebba308a3 498c044a-201b-4631-a522-5c744ed4e678 -ATTRIB_HIDE

rem # Processor idle promote threshold
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 7b224883-b3cc-4d79-819f-8374152cbe7c -ATTRIB_HIDE

rem # Turn off display after
powercfg -attributes 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e -ATTRIB_HIDE

rem # Allow hybrid sleep
powercfg -attributes 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e -ATTRIB_HIDE

rem # System cooling policy
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 94d3a615-a899-4ac5-ae2b-e4d8f634367f -ATTRIB_HIDE

rem # When sharing media
powercfg -attributes 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 03680956-93bc-4294-bba6-4e0f09bb717f -ATTRIB_HIDE

rem # A floor performance for Processor Power Efficiency Class 0 when there are Processor Power Efficiency Class 1 processors unparked
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 fddc842b-8364-4edc-94cf-c17f60de1c80 -ATTRIB_HIDE

rem # Power button action
powercfg -attributes 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 -ATTRIB_HIDE

rem # Energy Saver Policy
powercfg -attributes de830923-a562-41af-a086-e3a2c6bad2da 5c5bb349-ad29-4ee2-9d0b-2b25270f7a81 -ATTRIB_HIDE

rem # Processor performance core parking decrease time
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 dfd10d17-d5eb-45dd-877a-9a34ddd15c82 -ATTRIB_HIDE

rem # NVIDIA-näytön virransäästöteknologia
powercfg -attributes 7516b95f-f776-4464-8c53-06167f40cc99 89cc76a4-f226-4d4b-a040-6e9a1da9b882 -ATTRIB_HIDE

rem # Hub Selective Suspend Timeout
powercfg -attributes 2a737441-1930-4402-8d77-b2bebba308a3 0853a681-27c8-4100-a2fd-82013e970683 -ATTRIB_HIDE

rem # Processor performance core parking min cores
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 0cc5b647-c1df-4637-891a-dec35c318583 -ATTRIB_HIDE

rem # Processor performance core parking min cores for Processor Power Efficiency Class 1
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 0cc5b647-c1df-4637-891a-dec35c318584 -ATTRIB_HIDE

rem # Allow Away Mode Policy
powercfg -attributes 238c9fa8-0aad-41ed-83f4-97be242c8f20 25dfa149-5dd1-4736-b5ab-e8a37b5b8187 -ATTRIB_HIDE

rem # Latency sensitivity hint min unparked cores/packages
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 616cdaa5-695e-4545-97ad-97dc2d1bdd88 -ATTRIB_HIDE

rem # Latency sensitivity hint min unparked cores/packages for Processor Power Efficiency Class 1
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 616cdaa5-695e-4545-97ad-97dc2d1bdd89 -ATTRIB_HIDE

rem # Execution Required power request timeout
powercfg -attributes 2e601130-5351-4d9d-8e04-252966bad054 3166bc41-7e98-4e03-b34e-ec0f5f2b218e -ATTRIB_HIDE

rem # Standby Budget Percent
powercfg -attributes 8619b916-e004-4dd8-9b66-dae86f806698 9fe527be-1b70-48da-930d-7bcf17b44990 -ATTRIB_HIDE

rem # Dimmed display brightness
powercfg -attributes 7516b95f-f776-4464-8c53-06167f40cc99 f1fbfde2-a960-4165-9f88-50667911ce96 -ATTRIB_HIDE

rem # Interrupt Steering Mode
powercfg -attributes 48672f38-7a9a-4bb2-8bf8-3d85be19de4e 2bfc24f9-5ea2-4801-8213-3dbae01aa39d -ATTRIB_HIDE

rem # System unattended sleep timeout
powercfg -attributes 238c9fa8-0aad-41ed-83f4-97be242c8f20 7bc4a2f9-d8fc-4469-b07b-33eb785aaca0 -ATTRIB_HIDE

rem # Processor duty cycling
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 4e4450b3-6179-4e91-b8f1-5bb9938f81a1 -ATTRIB_HIDE

rem # Processor idle state maximum
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 9943e905-9a30-4ec1-9b99-44dd3b76f7a2 -ATTRIB_HIDE

rem # Processor performance decrease threshold
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 12a0ab44-fe28-4fa9-b3bd-4b64f44960a6 -ATTRIB_HIDE

rem # Processor performance decrease threshold for Processor Power Efficiency Class 1
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 12a0ab44-fe28-4fa9-b3bd-4b64f44960a7 -ATTRIB_HIDE

rem # Console lock display off timeout
powercfg -attributes 7516b95f-f776-4464-8c53-06167f40cc99 8ec4b3a5-6868-48c2-be75-4f3044be88a7 -ATTRIB_HIDE

rem # Display brightness weight
powercfg -attributes de830923-a562-41af-a086-e3a2c6bad2da 13d09884-f74e-474a-a852-b6bde8ad03a8 -ATTRIB_HIDE

rem # Processor performance increase time
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 984cf492-3bed-4488-a8f9-4286c97bf5aa -ATTRIB_HIDE

rem # Allow Standby States
powercfg -attributes 238c9fa8-0aad-41ed-83f4-97be242c8f20 abfc2519-3608-4c2a-94ea-171b0ed546ab -ATTRIB_HIDE

rem # Processor performance increase time for Processor Power Efficiency Class 1
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 984cf492-3bed-4488-a8f9-4286c97bf5ab -ATTRIB_HIDE

rem # Processor idle disable
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 5d76a2ca-e8c0-402f-a133-2158492d58ad -ATTRIB_HIDE

rem # Processor performance core parking concurrency threshold
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 2430ab6f-a520-44a2-9601-f7f23b5134b1 -ATTRIB_HIDE

rem # Lid open action
powercfg -attributes 4f971e89-eebd-4455-a8de-9e59040e7347 99ff10e7-23b1-4c07-a9d1-5c3206d741b4 -ATTRIB_HIDE

rem # Heterogeneous policy in effect
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 7f2f5cfa-f10c-4823-b5e1-e93ae85f46b5 -ATTRIB_HIDE

rem # Enable adaptive brightness
powercfg -attributes 7516b95f-f776-4464-8c53-06167f40cc99 fbd9aa66-9553-4097-ba44-ed6e9d65eab8 -ATTRIB_HIDE

rem # Allow Throttle States
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb -ATTRIB_HIDE

rem # Processor performance level increase threshold for Processor Power Efficiency Class 1 processor count increase
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 b000397d-9b0b-483d-98c9-692a6060cfbf -ATTRIB_HIDE

rem # Initial performance for Processor Power Efficiency Class 1 when unparked
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 1facfc65-a930-4bc5-9f38-504ec097bbc0 -ATTRIB_HIDE

rem # Processor performance increase time for Processor Power Efficiency Class 1
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 4009efa7-e72d-4cba-9edf-91084ea8cbc3 -ATTRIB_HIDE

rem # Processor performance time check interval
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 4d2b0152-7d5c-498b-88e2-34345392a2c5 -ATTRIB_HIDE

rem # Processor performance decrease policy
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 40fbefc7-2e9d-4d25-a185-0cfd8574bac6 -ATTRIB_HIDE

rem # Processor performance core parking increase policy
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 c7be0679-2817-4d69-9d02-519a537ed0c6 -ATTRIB_HIDE

rem # Processor performance boost mode
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 be337238-0d82-4146-a960-4f3749d470c7 -ATTRIB_HIDE

rem # Processor performance decrease policy for Processor Power Efficiency Class 1
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 40fbefc7-2e9d-4d25-a185-0cfd8574bac7 -ATTRIB_HIDE

rem # Maximum Power Level
powercfg -attributes 0012ee47-9041-4b5d-9b77-535fba8b1442 51dea550-bb38-4bc4-991b-eacf37be5ec8 -ATTRIB_HIDE

rem # Processor performance decrease time
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 d8edeb9b-95cf-4f95-a73c-b061973693c8 -ATTRIB_HIDE

rem # Processor performance decrease time for Processor Power Efficiency Class 1
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 d8edeb9b-95cf-4f95-a73c-b061973693c9 -ATTRIB_HIDE

rem # Display brightness
powercfg -attributes 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcb -ATTRIB_HIDE

rem # Mukautuva taustavalo
powercfg -attributes 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcc -ATTRIB_HIDE

rem # JavaScript Timer Frequency
powercfg -attributes 02f815b5-a5cf-4c84-bf20-649d1f75d3d8 4c793e7d-a264-42e1-87d3-7a0d2f523ccd -ATTRIB_HIDE

rem # Standby Reserve Time
powercfg -attributes 8619b916-e004-4dd8-9b66-dae86f806698 468fe7e5-1158-46ec-88bc-5b96c9e44fd0 -ATTRIB_HIDE

rem # Processor performance core parking overutilization threshold
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 943c8cb6-6f93-4227-ad87-e9a3feec08d1 -ATTRIB_HIDE

rem # Processor performance core parking utility distribution
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 e0007330-f589-42ed-a401-5ddb10e785d3 -ATTRIB_HIDE

rem # Charge level
powercfg -attributes de830923-a562-41af-a086-e3a2c6bad2da e69653ca-cf7f-4f05-aa73-cb833fa90ad4 -ATTRIB_HIDE

rem # Enable forced button/lid shutdown
powercfg -attributes 4f971e89-eebd-4455-a8de-9e59040e7347 833a6b62-dfa4-46d1-82f8-e09e34d029d6 -ATTRIB_HIDE

rem # Sleep after
powercfg -attributes 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1db-86da-48c5-9fdb-f2b67b1f44da -ATTRIB_HIDE

rem # Allow system required policy
powercfg -attributes 238c9fa8-0aad-41ed-83f4-97be242c8f20 a4b195f5-8225-47d8-8012-9d41369786e2 -ATTRIB_HIDE

rem # Start menu power button
powercfg -attributes 4f971e89-eebd-4455-a8de-9e59040e7347 a7066653-8d6c-40a8-910e-a1f54b84c7e5 -ATTRIB_HIDE

rem # Sleep button action
powercfg -attributes 4f971e89-eebd-4455-a8de-9e59040e7347 96996bc0-ad50-47ec-923b-6f41874dd9eb -ATTRIB_HIDE

rem # Maximum processor state
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec -ATTRIB_HIDE

rem # Processor performance decrease time for Processor Power Efficiency Class 1
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 7f2492b6-60b1-45e5-ae55-773f8cd5caec -ATTRIB_HIDE

rem # Maximum processor state for Processor Power Efficiency Class 1
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ed -ATTRIB_HIDE

rem # Dim display after
powercfg -attributes 7516b95f-f776-4464-8c53-06167f40cc99 17aaa29b-8b43-4b94-aafe-35f64daaf1ee -ATTRIB_HIDE

rem # User Presence Prediction mode
powercfg -attributes 8619b916-e004-4dd8-9b66-dae86f806698 82011705-fb95-4d46-8d35-4042b1d20def -ATTRIB_HIDE

rem # Processor performance core parking distribution threshold
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 4bdaf4e9-d103-46d7-a5f0-6280121616ef -ATTRIB_HIDE

rem # Target Load
powercfg -attributes 48672f38-7a9a-4bb2-8bf8-3d85be19de4e 73cde64d-d720-4bb2-a860-c755afe77ef2 -ATTRIB_HIDE

rem # Non-sensor Input Presence Timeout
powercfg -attributes 8619b916-e004-4dd8-9b66-dae86f806698 5adbbfbc-074e-4da1-ba38-db8b36b2c8f3 -ATTRIB_HIDE

rem # When playing video
powercfg -attributes 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 34c7b99f-9a6d-4b3c-8dc7-b6693b78cef4 -ATTRIB_HIDE

rem # Slide show
powercfg -attributes 0d7dbae2-4294-402a-ba8e-26777e8488cd 309dce9b-bef4-4119-9921-a851fb12f0f4 -ATTRIB_HIDE

rem # Link State Power Management
powercfg -attributes 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d277-404b-b6da-e5fa1a576df5 -ATTRIB_HIDE

rem # Processor autonomous activity window
powercfg -attributes 54533251-82be-4824-96c1-47b60b740d00 cfeda3d0-7697-4566-a922-a9086cd49dfa -ATTRIB_HIDE
