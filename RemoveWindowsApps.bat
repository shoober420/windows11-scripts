rem # Remove bloat windows apps

rem # "winget list" shows installed apps

rem # powershell -command "Get-AppxPackage | Select Name, PackageFullName" shows installed apps

rem # Add-AppxPackage installs apps

rem # Do NOT uninstall "Microsoft.UI.Xaml.CBS", causes constant screen flickering and blinking

rem # !!!WARNING!!!
rem # This script may delete Windows Apps you use, do a back up in case anything is lost you need
rem # !!!WARNING!!!

rem # REBOOT RECOMMENDED

PAUSE

rem # EnableStore.bat required for this script to function if DisableServices.bat was executed

PAUSE

rem # winget requires "Application Information" service to be running
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Appinfo" /v "Start" /t REG_DWORD /d "3" /f
net start Appinfo

rem # Enable and start WMI

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v "Start" /t REG_DWORD /d "2" /f
sc config winmgmt start= auto
net start winmgmt

rem # Enable PowerShell

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
winget uninstall "Microsoft.Copilot_8wekyb3d8bbwe"
winget uninstall "Microsoft.Copilot"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.WindowsNotepad* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.People* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.549981C3F5F10* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.XboxGameOverlay* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.XboxGamingOverlay* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.XboxIdentityProvider* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.XboxSpeechToTextOverlay* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.GamingServices* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.MicrosoftEdgeBeta* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.MicrosoftEdgeStable* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Client-ProjFS* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *TelnetClient* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *TFTP* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *TIFFIFilter* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *NetFx4-AdvSrvs* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *WCF-Services45* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.Todos* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.GamingApp* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.BingWeather* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.ZuneMusic* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.ZuneVideo* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.WindowsAlarms* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.WindowsMaps* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.MicrosoftStickyNotes* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.YourPhone* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.WindowsNotepad* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.GetHelp* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *MicrosoftTeams* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.BingSearch* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.ScreenSketch* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.PowerAutomateDesktop* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.WindowsSoundRecorder* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.Getstarted* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.WindowsCalculator* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.WindowsCamera* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.BingNews* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.Xbox.TCUI* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Clipchamp.Clipchamp* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Clipchamp* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.Clipchamp.Clipchamp* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.Windows.Clipchamp.Clipchamp* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.Clipchamp* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Clipchamp.Clipchamp* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Clipchamp* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.Windows.Clipchamp* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.OutlookForWindows* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.DolbyAudioExtensions* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.MicrosoftOfficeHub* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *microsoft.windowscommunicationsapps* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.WindowsTerminal* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *devhome* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Windows.DevHome* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.BingFinance* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.3DBuilder* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.BingFoodAndDrink* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.BingHealthAndFitness* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.BingSports* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.BingTranslator* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.BingTravel* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.Messaging* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.Microsoft3DViewer* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.MicrosoftJournal* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.MicrosoftPowerBIForWindows* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.MixedReality.Portal* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.NetworkSpeedTest* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.News* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.Office.OneNote* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.Office.Sway* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.OneConnect* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.Print3D* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.SkypeApp* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.XboxApp* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *MicrosoftCorporationII.MicrosoftFamily* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *MicrosoftCorporationII.QuickAssist* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *MSTeams* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.Edge* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.MSPaint* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.OneDrive* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.Paint* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.Whiteboard* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.Windows.Photos* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.WindowsStore* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.RemoteDesktop* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.EdgeWebView2Runtime* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *ACGMediaPlayer* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *ActiproSoftwareLLC* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *AdobeSystemsIncorporated.AdobePhotoshopExpress* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Amazon.com.Amazon* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *AmazonVideo.PrimeVideo* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Asphalt8Airborne* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *AutodeskSketchBook* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *CaesarsSlotsFreeCasino* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *COOKINGFEVER* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *CyberLinkMediaSuiteEssentials* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *DisneyMagicKingdoms* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Disney* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *DrawboardPDF* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Duolingo-LearnLanguagesforFree* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *EclipseManager* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Facebook* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *FarmVille2CountryEscape* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *fitbit* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Flipboard* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *HiddenCity* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *HULULLC.HULUPLUS* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *iHeartRadio* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Instagram* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *king.com.BubbleWitch3Saga* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *king.com.CandyCrushSaga* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *king.com.CandyCrushSodaSaga* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *LinkedInforWindows* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *LinkedIn* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *LinkedIn* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *LinkedInforWindows* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *MarchofEmpires* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Netflix* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *NYTCrossword* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *OneCalendar* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *PandoraMediaInc* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *PhototasticCollage* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *PicsArt-PhotoStudio* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Plex* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *PolarrPhotoEditorAcademicEdition* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Royal Revolt* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Shazam* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Sidia.LiveWallpaper* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *SlingTV* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Spotify* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *TikTok* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *TuneInRadio* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Twitter* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Viber* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *WinZipUniversal* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Wunderlist* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *XING* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.HEVCVideoExtension* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.HEIFImageExtension* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.MPEG2VideoExtension* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.RawImageExtension* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.VP9VideoExtensions* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.WebMediaExtensions* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.WebpImageExtension* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *MicrosoftWindows.CrossDevice* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.WidgetsPlatformRuntime* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *RivetNetworks.KillerControlCenter* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.StorePurchaseApp* | Remove-AppxPackage"

powershell -command "Get-AppxPackage -AllUsers *Microsoft.StartExperiencesApp* | Remove-AppxPackage"

powershell "Get-WindowsPackage -Online | Where PackageName -like *QuickAssist* | Remove-WindowsPackage -Online -NoRestart"

powershell "Get-WindowsPackage -Online | Where PackageName -like *Hello-Face* | Remove-WindowsPackage -Online -NoRestart"

powershell "Get-WindowsOptionalFeature -Online | Where FeatureName -eq *WindowsMediaPlayer* | Disable-WindowsOptionalFeature -Online -NoRestart -WarningAction SilentlyContinue | Out-Null"

powershell "Get-WindowsOptionalFeature -Online | Where FeatureName -eq *WorkFolders-Client* | Disable-WindowsOptionalFeature -Online -NoRestart -WarningAction SilentlyContinue | Out-Null"

powershell "Get-WindowsOptionalFeature -Online | Where FeatureName -eq *Printing-XPSServices-Features* | Disable-WindowsOptionalFeature -Online -NoRestart -WarningAction SilentlyContinue | Out-Null"

powershell "Get-WindowsOptionalFeature -Online | Where FeatureName -eq *FaxServicesClientPackage* | Disable-WindowsOptionalFeature -Online -NoRestart -WarningAction SilentlyContinue | Out-Null"

powershell "Remove-Printer -Name "Fax" -ErrorAction SilentlyContinue"

powershell "Get-WindowsCapability -Online | Where Name -like *Media.WindowsMediaPlayer* | Remove-WindowsCapability -Online | Out-Null"

powershell "Get-WindowsCapability -Online | Where Name -like *MathRecognizer* | Remove-WindowsCapability -Online | Out-Null"

powershell "Get-WindowsCapability -Online | Where Name -like *Hello.Face* | Remove-WindowsCapability -Online | Out-Null"

powershell "Get-WindowsCapability -Online | Where Name -like *OpenSSH.Client* | Remove-WindowsCapability -Online | Out-Null"

powershell "Get-WindowsCapability -Online | Where Name -like *OpenSSH.Server* | Remove-WindowsCapability -Online | Out-Null"

powershell "Get-WindowsCapability -Online | Where Name -like *Print.Fax.Scan* | Remove-WindowsCapability -Online | Out-Null"

powershell "Get-WindowsCapability -Online | Where Name -like *Print.Management.Console* | Remove-WindowsCapability -Online | Out-Null"

powershell "Get-WindowsCapability -Online | Where Name -like *Microsoft.Windows.WordPad* | Remove-WindowsCapability -Online | Out-Null"

powershell "Get-WindowsCapability -Online | Where Name -like *App.StepsRecorder* | Remove-WindowsCapability -Online | Out-Null"

powershell "Get-WindowsCapability -Online | Where Name -like *OneCoreUAP.OneSync* | Remove-WindowsCapability -Online | Out-Null"

powershell "Get-AppPackage -Allusers *Microsoft.Windows.SecureAssessmentBrowser* | Remove-AppPackage"

rem # Remove Provisioned packages through DISM
rem # DISM /Online /Get-ProvisionedAppxPackages | select-string Packagename

DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.XboxGamingOverlay_2.34.28001.0_neutral_~_8wekyb3d8bbwe

DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsMaps_2019.716.2316.0_neutral_~_8wekyb3d8bbwe

DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsCalculator_2021.2210.0.0_neutral_~_8wekyb3d8bbwe

rem # REBOOT RECOMMENDED

PAUSE
