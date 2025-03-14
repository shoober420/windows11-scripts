rem # Resource Set Tweaks

rem # !!! WARNING !!!

rem # BREAKS SYSTEM

rem # !!! WARNING !!!

rem # TESTING ONLY

PAUSE

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ApplicationService" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ApplicationService" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ApplicationService" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ApplicationService" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ApplicationService" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ApplicationService" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ApplicationServiceElastic" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ApplicationServiceElastic" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ApplicationServiceElastic" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ApplicationServiceElastic" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ApplicationServiceElastic" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ApplicationServiceElastic" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ApplicationServiceHighPriority" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ApplicationServiceHighPriority" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ApplicationServiceHighPriority" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ApplicationServiceHighPriority" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ApplicationServiceHighPriority" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ApplicationServiceHighPriority" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ApplicationServiceRemote" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ApplicationServiceRemote" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ApplicationServiceRemote" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ApplicationServiceRemote" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ApplicationServiceRemote" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ApplicationServiceRemote" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\AppToAppTarget" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\AppToAppTarget" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\AppToAppTarget" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\AppToAppTarget" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\AppToAppTarget" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\AppToAppTarget" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundAudioPlayer" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundAudioPlayer" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundAudioPlayer" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundAudioPlayer" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundAudioPlayer" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundAudioPlayer" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundCachedFileUpdater" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundCachedFileUpdater" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundCachedFileUpdater" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundCachedFileUpdater" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundCachedFileUpdater" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundCachedFileUpdater" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundTaskCompletion" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundTaskCompletion" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundTaskCompletion" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundTaskCompletion" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundTaskCompletion" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundTaskCompletion" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundTaskDebug" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundTaskDebug" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundTaskDebug" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundTaskDebug" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundTaskDebug" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundTaskDebug" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundTransfer" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundTransfer" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundTransfer" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundTransfer" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundTransfer" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundTransfer" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundTransferNetworkState" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundTransferNetworkState" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundTransferNetworkState" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundTransferNetworkState" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundTransferNetworkState" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\BackgroundTransferNetworkState" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\Balloon" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\Balloon" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\Balloon" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\Balloon" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\Balloon" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\Balloon" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\CalendarProviderAsChild" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\CalendarProviderAsChild" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\CalendarProviderAsChild" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\CalendarProviderAsChild" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\CalendarProviderAsChild" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\CalendarProviderAsChild" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\CallingEvent" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\CallingEvent" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\CallingEvent" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\CallingEvent" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\CallingEvent" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\CallingEvent" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\CallingEventHighPriority" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\CallingEventHighPriority" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\CallingEventHighPriority" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\CallingEventHighPriority" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\CallingEventHighPriority" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\CallingEventHighPriority" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ChatMessageNotification" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ChatMessageNotification" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ChatMessageNotification" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ChatMessageNotification" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ChatMessageNotification" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ChatMessageNotification" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ComponentTarget" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ComponentTarget" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ComponentTarget" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ComponentTarget" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ComponentTarget" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ComponentTarget" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ContinuousBackgroundExecution" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ContinuousBackgroundExecution" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ContinuousBackgroundExecution" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ContinuousBackgroundExecution" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ContinuousBackgroundExecution" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ContinuousBackgroundExecution" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\CreateProcess" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\CreateProcess" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\CreateProcess" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\CreateProcess" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\CreateProcess" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\CreateProcess" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\DefaultModernBackgroundTask" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\DefaultModernBackgroundTask" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\DefaultModernBackgroundTask" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\DefaultModernBackgroundTask" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\DefaultModernBackgroundTaskDefaultModernBackgroundTask" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\DefaultModernBackgroundTask" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\DefaultPPLE" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\DefaultPPLE" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\DefaultPPLE" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\DefaultPPLE" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\DefaultPPLE" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\DefaultPPLE" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\DefaultPPLE2" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\DefaultPPLE2" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\DefaultPPLE2" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\DefaultPPLE2" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\DefaultPPLE2" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\DefaultPPLE2" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmCreateProcess" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmCreateProcess" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmCreateProcess" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmCreateProcessEmCreateProcess" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmCreateProcess" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmCreateProcess" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmCreateProcessNormalPriority" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmCreateProcessNormalPriority" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmCreateProcessNormalPriority" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmCreateProcessNormalPriority" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmCreateProcessNormalPriority" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmCreateProcessNormalPriority" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmptyHost" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmptyHost" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmptyHost" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmptyHost" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmptyHost" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmptyHost" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmptyHostHighPriority" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmptyHostHighPriority" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmptyHostHighPriority" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmptyHostHighPriority" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmptyHostHighPriority" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmptyHostHighPriority" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmptyHostPPLE" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmptyHostPPLE" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmptyHostPPLE" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmptyHostPPLE" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmptyHostPPLE" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\EmptyHostPPLE" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\FileProviderTarget" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\FileProviderTarget" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\FileProviderTarget" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\FileProviderTarget" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\FileProviderTarget" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\FileProviderTarget" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ForegroundAgent" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ForegroundAgent" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ForegroundAgent" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ForegroundAgent" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ForegroundAgent" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ForegroundAgent" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ForegroundCachedFileUpdater" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ForegroundCachedFileUpdater" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ForegroundCachedFileUpdater" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ForegroundCachedFileUpdater" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ForegroundCachedFileUpdater" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ForegroundCachedFileUpdater" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ForegroundTaskCompletion" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ForegroundTaskCompletion" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ForegroundTaskCompletion" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ForegroundTaskCompletion" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ForegroundTaskCompletion" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ForegroundTaskCompletion" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\Frozen" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\Frozen" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\Frozen" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\Frozen" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\Frozen" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\Frozen" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\GenericExtendedExecution" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\GenericExtendedExecution" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\GenericExtendedExecution" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\GenericExtendedExecution" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\GenericExtendedExecution" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\GenericExtendedExecution" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\HighPriorityBackgroundAgent" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\HighPriorityBackgroundAgent" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\HighPriorityBackgroundAgent" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\HighPriorityBackgroundAgent" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\HighPriorityBackgroundAgent" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\HighPriorityBackgroundAgent" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\HighPriorityBackgroundDemoted" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\HighPriorityBackgroundDemoted" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\HighPriorityBackgroundDemoted" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\HighPriorityBackgroundDemoted" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\HighPriorityBackgroundDemoted" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\HighPriorityBackgroundDemoted" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\HighPriorityBackgroundTransfer" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\HighPriorityBackgroundTransfer" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\HighPriorityBackgroundTransfer" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\HighPriorityBackgroundTransfer" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\HighPriorityBackgroundTransfer" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\HighPriorityBackgroundTransfer" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\JumboForegroundAgent" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\JumboForegroundAgent" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\JumboForegroundAgent" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\JumboForegroundAgent" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\JumboForegroundAgent" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\JumboForegroundAgent" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaBackgroundTaskCompletion" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaBackgroundTaskCompletion" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaBackgroundTaskCompletion" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaBackgroundTaskCompletion" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaBackgroundTaskCompletion" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaBackgroundTaskCompletion" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaDefaultModernBackgroundTask" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaDefaultModernBackgroundTask" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaDefaultModernBackgroundTask" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaDefaultModernBackgroundTask" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaDefaultModernBackgroundTask" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaDefaultModernBackgroundTask" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaPrelaunchForeground" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaPrelaunchForeground" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaPrelaunchForeground" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaPrelaunchForeground" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaPrelaunchForeground" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaPrelaunchForeground" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiFrozen" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiFrozen" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiFrozen" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiFrozen" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiFrozen" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiFrozen" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiFrozenDNCS" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiFrozenDNCS" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiFrozenDNCS" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiFrozenDNCS" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiFrozenDNCS" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiFrozenDNCS" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiFrozenDNK" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiFrozenDNK" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiFrozenDNK" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiFrozenDNK" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiFrozenDNK" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiFrozenDNK" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiFrozenHighPriority" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiFrozenHighPriority" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiFrozenHighPriority" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiFrozenHighPriority" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiFrozenHighPriority" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiFrozenHighPriority" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiModernForeground" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiModernForeground" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiModernForeground" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiModernForeground" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiModernForeground" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiModernForeground" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiModernForegroundLarge" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiModernForegroundLarge" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiModernForegroundLarge" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiModernForegroundLarge" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiModernForegroundLarge" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiModernForegroundLarge" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiPaused" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiPaused" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiPaused" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiPaused" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiPaused" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiPaused" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiPausedDNK" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiPausedDNK" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiPausedDNK" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiPausedDNK" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiPausedDNK" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiPausedDNK" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiPausedHighPriority" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiPausedHighPriority" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiPausedHighPriority" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiPausedHighPriority" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiPausedHighPriority" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiPausedHighPriority" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiPausing" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiPausing" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiPausing" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiPausing" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiPausing" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LmaUiPausing" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LongRunningBluetooth" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LongRunningBluetooth" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LongRunningBluetooth" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LongRunningBluetooth" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LongRunningBluetooth" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LongRunningBluetooth" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LongRunningControlChannel" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LongRunningControlChannel" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LongRunningControlChannel" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LongRunningControlChannel" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LongRunningControlChannel" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LongRunningControlChannel" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LongRunningSensor" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LongRunningSensor" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LongRunningSensor" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LongRunningSensor" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LongRunningSensor" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\LongRunningSensor" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\MediaProcessing" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\MediaProcessing" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\MediaProcessing" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\MediaProcessing" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\MediaProcessing" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\MediaProcessing" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\OemBackgroundAgent" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\OemBackgroundAgent" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\OemBackgroundAgent" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\OemBackgroundAgent" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\OemBackgroundAgent" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\OemBackgroundAgent" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\OemTask" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\OemTask" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\OemTask" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\OemTask" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\OemTask" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\OemTask" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PendingDefaultPPLE" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PendingDefaultPPLE" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PendingDefaultPPLE" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PendingDefaultPPLE" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PendingDefaultPPLE" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PendingDefaultPPLE" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PiP" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PiP" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PiP" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PiP" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PiP" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PiP" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PreinstallTask" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PreinstallTask" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PreinstallTask" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PreinstallTask" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PreinstallTask" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PreinstallTask" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PrelaunchForeground" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PrelaunchForeground" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PrelaunchForeground" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PrelaunchForeground" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PrelaunchForeground" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PrelaunchForeground" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PushTriggerTask" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PushTriggerTask" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PushTriggerTask" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PushTriggerTask" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PushTriggerTask" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\PushTriggerTask" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ResourceIntensive" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ResourceIntensive" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ResourceIntensive" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ResourceIntensive" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ResourceIntensive" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ResourceIntensive" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ShareDataPackageHost" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ShareDataPackageHost" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ShareDataPackageHost" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ShareDataPackageHost" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ShareDataPackageHost" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ShareDataPackageHost" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ShortRunningBluetooth" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ShortRunningBluetooth" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ShortRunningBluetooth" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ShortRunningBluetooth" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ShortRunningBluetooth" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\ShortRunningBluetooth" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\TaskCompletionHighPriority" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\TaskCompletionHighPriority" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\TaskCompletionHighPriority" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\TaskCompletionHighPriority" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\TaskCompletionHighPriority" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\TaskCompletionHighPriority" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiComposer" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiComposer" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiComposer" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiComposer" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiComposer" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiComposer" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiForegroundDNK" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiForegroundDNK" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiForegroundDNK" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiForegroundDNK" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiForegroundDNK" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiForegroundDNK" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiFrozen" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiFrozen" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiFrozen" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiFrozen" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiFrozen" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiFrozen" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiFrozenDNCS" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiFrozenDNCS" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiFrozenDNCS" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiFrozenDNCS" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiFrozenDNCS" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiFrozenDNCS" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiFrozenHighPriority" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiFrozenHighPriority" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiFrozenHighPriority" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiFrozenHighPriority" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiFrozenHighPriority" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiFrozenHighPriority" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiFrozenDNK" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiFrozenDNK" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiFrozenDNK" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiFrozenDNK" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiFrozenDNK" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiFrozenDNK" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiLockScreen" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiLockScreen" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiLockScreen" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiLockScreen" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiLockScreen" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiLockScreen" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiModernForeground" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiModernForeground" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiModernForeground" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiModernForeground" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiModernForeground" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiModernForeground" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiModernForegroundExtended" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiModernForegroundExtended" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiModernForegroundExtended" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiModernForegroundExtended" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiModernForegroundExtended" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiModernForegroundExtended" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiModernForegroundLarge" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiModernForegroundLarge" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiModernForegroundLarge" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiModernForegroundLarge" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiModernForegroundLarge" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiModernForegroundLarge" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiOverlay" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiOverlay" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiOverlay" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiOverlay" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiOverlay" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiOverlay" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPaused" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPaused" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPaused" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPaused" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPaused" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPaused" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPausedDNK" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPausedDNK" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPausedDNK" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPausedDNK" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPausedDNK" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPausedDNK" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPausedHighPriority" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPausedHighPriority" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPausedHighPriority" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPausedHighPriority" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPausedHighPriority" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPausedHighPriority" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPausing" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPausing" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPausing" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPausing" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPausing" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPausing" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPausingLowPriority" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPausingLowPriority" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPausingLowPriority" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPausingLowPriority" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPausingLowPriority" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiPausingLowPriority" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiShellCustom1" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiShellCustom1" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiShellCustom1" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiShellCustom1" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiShellCustom1" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiShellCustom1" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiShellCustom2" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiShellCustom2" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiShellCustom2" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiShellCustom2" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiShellCustom2" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiShellCustom2" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiShellCustom3" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiShellCustom3" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiShellCustom3" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiShellCustom3" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiShellCustom3" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiShellCustom3" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiShellCustom4" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiShellCustom4" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiShellCustom4" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiShellCustom4" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiShellCustom4" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\UiShellCustom4" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\VideoTranscoding" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\VideoTranscoding" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\VideoTranscoding" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\VideoTranscoding" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\VideoTranscoding" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\VideoTranscoding" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\Vpn" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\Vpn" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\Vpn" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\Vpn" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\Vpn" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\Vpn" /v "Memory" /t REG_SZ /d "NoCap" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\WebAuthSignIn" /v "CPU" /t REG_SZ /d "UnmanagedAboveNormal" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\WebAuthSignIn" /v "ExternalResources" /t REG_SZ /d "ResourceIntensive" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\WebAuthSignIn" /v "Flags" /t REG_SZ /d "Foreground" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\WebAuthSignIn" /v "Importance" /t REG_SZ /d "Critical" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\WebAuthSignIn" /v "IO" /t REG_SZ /d "NoCap" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\PolicySets\WebAuthSignIn" /v "Memory" /t REG_SZ /d "NoCap" /f



rem # BELOW TWEAKS NEED SOURCE
rem # VALUES ARE NOT LEGIT


rem # Setting Resource Policy Store Values

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\HardCap0" /v "CapPercentage" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\HardCap0" /v "SchedulingType" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\Paused" /v "CapPercentage" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\Paused" /v "SchedulingType" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\SoftCapFull" /v "CapPercentage" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\SoftCapFull" /v "SchedulingType" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\SoftCapLow" /v "CapPercentage" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\SoftCapLow" /v "SchedulingType" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Flags\BackgroundDefault" /v "IsLowPriority" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Flags\Frozen" /v "IsLowPriority" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Flags\FrozenDNCS" /v "IsLowPriority" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Flags\FrozenDNK" /v "IsLowPriority" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Flags\FrozenPPLE" /v "IsLowPriority" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Flags\Paused" /v "IsLowPriority" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Flags\PausedDNK" /v "IsLowPriority" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Flags\Pausing" /v "IsLowPriority" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Flags\PrelaunchForeground" /v "IsLowPriority" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Flags\ThrottleGPUInterference" /v "IsLowPriority" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Importance\Critical" /v "BasePriority" /t REG_DWORD /d "82" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Importance\Critical" /v "OverTargetPriority" /t REG_DWORD /d "50" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Importance\CriticalNoUi" /v "BasePriority" /t REG_DWORD /d "82" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Importance\CriticalNoUi" /v "OverTargetPriority" /t REG_DWORD /d "50" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Importance\EmptyHostPPLE" /v "BasePriority" /t REG_DWORD /d "82" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Importance\EmptyHostPPLE" /v "OverTargetPriority" /t REG_DWORD /d "50" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Importance\High" /v "BasePriority" /t REG_DWORD /d "82" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Importance\High" /v "OverTargetPriority" /t REG_DWORD /d "50" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Importance\Low" /v "BasePriority" /t REG_DWORD /d "82" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Importance\Low" /v "OverTargetPriority" /t REG_DWORD /d "50" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Importance\Lowest" /v "BasePriority" /t REG_DWORD /d "82" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Importance\Lowest" /v "OverTargetPriority" /t REG_DWORD /d "50" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Importance\Medium" /v "BasePriority" /t REG_DWORD /d "82" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Importance\Medium" /v "OverTargetPriority" /t REG_DWORD /d "50" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Importance\MediumHigh" /v "BasePriority" /t REG_DWORD /d "82" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Importance\MediumHigh" /v "OverTargetPriority" /t REG_DWORD /d "50" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Importance\StartHost" /v "BasePriority" /t REG_DWORD /d "82" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Importance\StartHost" /v "OverTargetPriority" /t REG_DWORD /d "50" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Importance\VeryHigh" /v "BasePriority" /t REG_DWORD /d "82" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Importance\VeryHigh" /v "OverTargetPriority" /t REG_DWORD /d "50" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Importance\VeryLow" /v "BasePriority" /t REG_DWORD /d "82" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Importance\VeryLow" /v "OverTargetPriority" /t REG_DWORD /d "50" /f

reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\IO\NoCap" /v "IOBandwidth" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Memory\NoCap" /v "CommitLimit" /t REG_DWORD /d "4294967295" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Memory\NoCap" /v "CommitTarget" /t REG_DWORD /d "4294967295" /f



PAUSE