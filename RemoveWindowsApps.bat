rem # Remove bloat windows apps
rem # "winget list" shows installed apps
rem # powershell -command "Get-AppxPackage | Select Name, PackageFullName" shows installed apps
rem # Add-AppxPackage installs apps

rem # Do NOT uninstall "Microsoft.UI.Xaml.CBS", causes constant screen flickering and blinking

rem # !!!WARNING!!!
rem # This script may delete Windows Apps you use, do a back up in case anything is lost you need
rem # !!!WARNING!!!

PAUSE

rem # winget requires "Application Information" service to be running
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Appinfo" /v "Start" /t REG_DWORD /d "3" /f
net start Appinfo

rem # Enable and start WMI

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v "Start" /t REG_DWORD /d "2" /f
sc config winmgmt start= auto
net start winmgmt

rem # Enable PowerShell

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /v "powershell.exe" /t REG_DWORD /d "0" /f

powershell.exe Enable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2Root

winget uninstall "cortana"
winget uninstall "Microsoft.OneDrive"
winget uninstall camera
winget uninstall help
winget uninstall photos
winget uninstall phone
winget uninstall edge
winget uninstall "windows web experience pack"
winget uninstall "Microsoft.Teams.Free"
winget uninstall "Microsoft.Teams"
winget uninstall "feedback hub"
winget uninstall paint
winget uninstall WebView2
winget uninstall "LinkedIn"
winget uninstall "LinkedInforWindows"
winget uninstall "Clipchamp"
winget uninstall "Clipchamp.Clipchamp"
winget uninstall "Microsoft.Clipchamp"
winget uninstall "Microsoft.Clipchamp.Clipchamp"
winget uninstall "Microsoft.Windows.Clipchamp"
winget uninstall "Microsoft.Windows.Clipchamp.Clipchamp"

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
powershell -command "Get-AppxPackage *Microsoft.Clipchamp.Clipchamp* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.Windows.Clipchamp.Clipchamp* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.Clipchamp* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Clipchamp.Clipchamp* | Remove-AppxPackage -allusers"
powershell -command "Get-AppxPackage *Clipchamp* | Remove-AppxPackage -allusers"
powershell -command "Get-AppxPackage *Microsoft.Windows.Clipchamp* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.OutlookForWindows* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.DolbyAudioExtensions* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.MicrosoftOfficeHub* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *microsoft.windowscommunicationsapps* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.WindowsTerminal* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.Windows.NarratorQuickStart* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.Windows.ContentDeliveryManager* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.Win32WebViewHost* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *devhome* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Windows.DevHome* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.BingFinance* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.3DBuilder* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.BingFoodAndDrink* | Remove-AppxPackage"
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

powershell -command "Get-AppxPackage *Microsoft.Edge* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.MSPaint* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.OneDrive* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.Paint* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.Whiteboard* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.Windows.Photos* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.WindowsStore* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.RemoteDesktop* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.EdgeWebView2Runtime* | Remove-AppxPackage"

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
powershell -command "Get-AppxPackage *LinkedIn* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *LinkedIn* | Remove-AppxPackage -allusers"
powershell -command "Get-AppxPackage *LinkedInforWindows* | Remove-AppxPackage -allusers"
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

powershell -command "Get-AppxPackage *Microsoft.HEVCVideoExtension* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.HEIFImageExtension* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.MPEG2VideoExtension* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.RawImageExtension* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.VP9VideoExtensions* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.WebMediaExtensions* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.WebpImageExtension* | Remove-AppxPackage"

powershell -command "Get-AppxPackage *MicrosoftWindows.CrossDevice* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.WidgetsPlatformRuntime* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *RivetNetworks.KillerControlCenter* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.StorePurchaseApp* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.StartExperiencesApp* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.WindowsAppRuntime.CBS* | Remove-AppxPackage"

rem # Remove all apps
rem # Uninstalls "Microsoft.UI.Xaml.CBS", which causes constant desktop refresh flicker
rem powershell "Get-AppxPackage | Remove-AppxPackage"

rem # Find and Remove for all existing user packages
rem powershell "Get-AppxPackage -AllUsers | Remove-AppxPackage"

rem # Find, remove, and nevercomeback for every User and every future User on this computer
rem powershell "Get-AppxProvisionedPackage -online | Remove-AppxProvisionedPackage -online"

rem # Remove all other apps except Microsoft Store
rem powershell -command "Get-AppXPackage | where-object {$_.name -notlike '*store*'} | Remove-AppxPackage"

rem # Remove all apps except "Microsoft.UI.Xaml.CBS"
powershell -command "Get-AppXPackage | where-object {$_.name -notlike '*Microsoft.UI.Xaml.CBS*'} | Remove-AppxPackage"

rem # Remove all apps for every user but keep "Microsoft.UI.Xaml.CBS"
powershell -command "Get-AppXPackage -AllUsers | where-object {$_.name -notlike '*Microsoft.UI.Xaml.CBS*'} | Remove-AppxPackage"

PAUSE