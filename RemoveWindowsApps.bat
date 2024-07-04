rem # Remove bloat windows apps
rem # "winget list" shows installed apps
rem # powershell -command "Get-AppxPackage | Select Name, PackageFullName" shows installed apps

rem # winget requires "Application Information" service to be running
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Appinfo" /v "Start" /t REG_DWORD /d "2" /f
net start Appinfo

rem # Enable and start WMI

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v "Start" /t REG_DWORD /d "2" /f
sc config winmgmt start= auto
net start winmgmt

rem # Enable PowerShell

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /v "powershell.exe" /t REG_DWORD /d "0" /f

powershell.exe Enable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2Root

winget uninstall onedrive
winget uninstall camera
winget uninstall help
winget uninstall photos
winget uninstall phone
winget uninstall edge
winget uninstall "windows web experience pack"
winget uninstall "microsoft teams"
winget uninstall "feedback hub"
winget uninstall paint

powershell -command "Get-AppxPackage *Microsoft.WindowsNotepad* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.People* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.549981C3F5F10* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.Windows.CloudExperienceHost* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.Windows.PeopleExperienceHost* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.XboxGameOverlay* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.XboxGamingOverlay* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.XboxIdentityProvider* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.XboxSpeechToTextOverlay* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.XboxGameCallableUI* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.GamingServices* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.MicrosoftEdgeBeta* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.MicrosoftEdgeStable* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.MicrosoftEdgeDevToolsClient* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.Windows.ShellExperienceHost* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.Windows.StartMenuExperienceHost* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Client-ProjFS* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *TelnetClient* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *TFTP* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *TIFFIFilter* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *NetFx4-AdvSrvs* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *WCF-Services45* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.Todos* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.SecHealthUI* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.GamingApp* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.BingWeather* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.ZuneMusic* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.ZuneVideo* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.WindowsAlarms* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.WindowsMaps* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.MicrosoftStickyNotes* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.YourPhone* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.WindowsNotepad* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *MicrosoftTeams* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.BingSearch* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.ScreenSketch* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.PowerAutomateDesktop* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.WindowsSoundRecorder* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.Getstarted* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.WindowsCalculator* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.WindowsCamera* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.BingNews* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.Xbox.TCUI* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Clipchamp.Clipchamp* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Clipchamp* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.OutlookForWindows* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.DolbyAudioExtensions* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.MicrosoftOfficeHub* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *microsoft.windowscommunicationsapps* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.WindowsTerminal* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.Windows.NarratorQuickStart* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.Windows.ContentDeliveryManager* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.Win32WebViewHost* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *devhome* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.BingFinance* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.3DBuilder* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.BingFoodAndDrink * | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.BingHealthAndFitness* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.BingSports* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.BingTranslator* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.BingTravel* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.Messaging* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.Microsoft3DViewer* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.MicrosoftJournal* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.MicrosoftPowerBIForWindows* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.MixedReality.Portal* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.NetworkSpeedTest* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.News* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.Office.OneNote* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.Office.Sway* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.OneConnect* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.Print3D* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.SkypeApp* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.XboxApp* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *MicrosoftCorporationII.MicrosoftFamily* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *MicrosoftCorporationII.QuickAssist* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *MSTeams* | Remove-AppxPackage"

powershell -command "Get-AppxPackage *ACGMediaPlayer* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *ActiproSoftwareLLC* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *AdobeSystemsIncorporated.AdobePhotoshopExpress* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Amazon.com.Amazon* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *AmazonVideo.PrimeVideo* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Asphalt8Airborne* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *AutodeskSketchBook* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *CaesarsSlotsFreeCasino* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *COOKINGFEVER* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *CyberLinkMediaSuiteEssentials* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *DisneyMagicKingdoms* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Disney* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *DrawboardPDF* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Duolingo-LearnLanguagesforFree* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *EclipseManager* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Facebook* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *FarmVille2CountryEscape* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *fitbit* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Flipboard* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *HiddenCity* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *HULULLC.HULUPLUS* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *iHeartRadio* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Instagram* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *king.com.BubbleWitch3Saga* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *king.com.CandyCrushSaga* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *king.com.CandyCrushSodaSaga* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *LinkedInforWindows* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *MarchofEmpires* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Netflix* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *NYTCrossword* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *OneCalendar* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *PandoraMediaInc* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *PhototasticCollage* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *PicsArt-PhotoStudio* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Plex* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *PolarrPhotoEditorAcademicEdition* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Royal Revolt* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Shazam* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Sidia.LiveWallpaper* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *SlingTV* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Spotify* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *TikTok* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *TuneInRadio* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Twitter* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Viber* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *WinZipUniversal* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Wunderlist* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *XING* | Remove-AppxPackage"

rem # Remove all other apps except Microsoft Store
powershell -command "Get-AppXPackage | where-object {$_.name -notlike '*store*'} | Remove-AppxPackage"

rem # Uninstalls "Remote Desktop Connection" program
mstsc /uninstall

rem # Disable "Application Information" service
net stop Appinfo
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Appinfo" /v "Start" /t REG_DWORD /d "4" /f

rem # Disable PowerShell
powershell.exe Disable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2Root

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /v "powershell.exe" /t REG_DWORD /d "1" /f

rem # Disable and stop WMI

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v "Start" /t REG_DWORD /d "4" /f
sc config winmgmt start= disabled
net stop winmgmt

PAUSE
