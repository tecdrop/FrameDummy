; FrameDummy Setup Program

;--------------------------------------

!include MUI.nsh ;Include Modern UI
!include WordFunc.nsh
!insertmacro VersionCompare
!include LogicLib.nsh
;--------------------------------------

;General

  RequestExecutionLevel admin

  ;The name of the installer
  Name "FrameDummy"

  ;The setup executable file to create
  OutFile "framedummy-windows-installer.exe"

  ;The default installation directory
  InstallDir "$PROGRAMFILES64\Tecdrop\FrameDummy"

;--------------------------------------

;Interface Settings

  !define MUI_ABORTWARNING

;--------------------------------------

;Pages

  !insertmacro MUI_PAGE_WELCOME
  !insertmacro MUI_PAGE_LICENSE "Files\license.txt"  
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES

  !define MUI_FINISHPAGE_RUN FrameDummy.exe
  !define MUI_FINISHPAGE_RUN_TEXT "Start FrameDummy"
  !insertmacro MUI_PAGE_FINISH

  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES

;--------------------------------------

;Languages

  !insertmacro MUI_LANGUAGE "English"

;--------------------------------------

;Version Information

  VIProductVersion "2.0.1.130"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName" "FrameDummy"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "Comments" "A fake Desktop window frame anywhere. For screenshots, pranks, or development."
  VIAddVersionKey /LANG=${LANG_ENGLISH} "CompanyName" "Tecdrop"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalTrademarks" ""
  VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright" "Copyright (c) 2013-2025 Tecdrop (https://www.tecdrop.com/)"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "FrameDummy Installer"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion" "2.0.1.130"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductVersion" "2.0.1.130"

;--------------------------------------

Section
  ; Copy files to installation directory
  SetOutPath $INSTDIR
  File Files\FrameDummy.exe
  File Files\FrameDummy.exe.config
  File Files\HomepageLink.html
  File Files\license.txt

  ; Copy settings file to user Application Data folder
  CreateDirectory "$APPDATA\Tecdrop\FrameDummy"
  File "/oname=$APPDATA\Tecdrop\FrameDummy\framedummy.ini" Files\framedummy.ini

  ; Create Start Menu shortcuts
  CreateShortCut "$SMPROGRAMS\FrameDummy.lnk" "$INSTDIR\FrameDummy.exe" "" "" "" SW_SHOWNORMAL "" "A fake Desktop window frame anywhere. For screenshots, pranks, or development."

  ;Create uninstaller
  WriteUninstaller "$INSTDIR\uninstall.exe"
  SetRegView 64
  WriteRegStr   HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\FrameDummy" "DisplayName" "FrameDummy"
  WriteRegStr   HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\FrameDummy" "UninstallString" "$\"$INSTDIR\uninstall.exe$\""
  WriteRegStr   HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\FrameDummy" "QuietUninstallString" "$\"$INSTDIR\uninstall.exe$\" /S" 
  WriteRegStr   HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\FrameDummy" "DisplayVersion" "2.0.1.130"
  WriteRegStr   HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\FrameDummy" "DisplayIcon" "$\"$INSTDIR\FrameDummy.exe$\""
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\FrameDummy" "EstimatedSize" "136"
  WriteRegStr   HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\FrameDummy" "HelpLink" "https://www.tecdrop.com/framedummy/"
  WriteRegStr   HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\FrameDummy" "InstallLocation" "$INSTDIR"
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\FrameDummy" "NoModify" "1"
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\FrameDummy" "NoRepair" "1"
  WriteRegStr   HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\FrameDummy" "Publisher" "Tecdrop"
  WriteRegStr   HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\FrameDummy" "URLInfoAbout" "https://www.tecdrop.com/framedummy/"
  WriteRegStr   HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\FrameDummy" "URLUpdateInfo" "https://www.tecdrop.com/framedummy/"
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\FrameDummy" "VersionMajor" "2"
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\FrameDummy" "VersionMinor" "0"
SectionEnd

;--------------------------------------

;Uninstaller Section

Section "Uninstall"

  ; Delete files from installation directory
  Delete "$INSTDIR\uninstall.exe"
  Delete "$INSTDIR\FrameDummy.exe"
  Delete "$INSTDIR\FrameDummy.exe.config"
  Delete "$INSTDIR\HomepageLink.html"
  Delete "$INSTDIR\license.txt"
  RMDir "$INSTDIR"
  RMDir "$PROGRAMFILES64\Tecdrop"

  ; Delete settings file and folder from user Application Data folder
  Delete "$APPDATA\Tecdrop\FrameDummy\framedummy.ini"
  RMDir "$APPDATA\Tecdrop\FrameDummy"
  RMDir "$APPDATA\Tecdrop"

  ; Delete Start Menu shortcut
  Delete "$SMPROGRAMS\FrameDummy.lnk"

  ; Delete Uninstall registry key
  SetRegView 64
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\FrameDummy"

SectionEnd