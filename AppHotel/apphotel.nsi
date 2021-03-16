
!include "ZipDLL.nsh"
!include "MUI2.nsh"

;General

  ;Name and file
  Name "App Hotel"
  OutFile "InstallAppHotel.exe"
  Unicode True

  ;Default installation folder
  InstallDir "$PROGRAMFILES\AppHotel"

  ;Request application privileges for Windows Vista
  RequestExecutionLevel admin

;--------------------------------
;Variables

;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING

;--------------------------------
;Pages

  !insertmacro MUI_PAGE_WELCOME
  !insertmacro MUI_PAGE_LICENSE "${NSISDIR}\Docs\Modern UI\License.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
  !insertmacro MUI_PAGE_FINISH

  !insertmacro MUI_UNPAGE_WELCOME
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  !insertmacro MUI_UNPAGE_FINISH

;--------------------------------
;Languages

  !insertmacro MUI_LANGUAGE "Spanish"

;--------------------------------
;Installer Sections

Section "App Hotel" SecAppHotel

  SetOutPath "$INSTDIR"
  
  ;ADD YOUR OWN FILES HERE...
  
  File apphotel.7z
	Nsis7z::Extract apphotel.7z
	Delete $INSTDIR\apphotel.7z
  
  ;Create uninstaller
  WriteUninstaller "$INSTDIR\UninstallAppHotel.exe"
    
    ;Create shortcuts
    CreateDirectory "$SMPROGRAMS\AppHotel"
    CreateShortcut "$SMPROGRAMS\AppHotel\UninstallAppHotel.lnk" "$INSTDIR\UninstallAppHotel.exe"
    CreateShortcut "$SMPROGRAMS\AppHotel\AppHotel.lnk" "$INSTDIR\AppHotel.jar"

SectionEnd

;--------------------------------
;Descriptions

  ;Language strings
  LangString DESC_SecAppHotel ${LANG_SPANISH} "App Hotel"

  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SecAppHotel} $(DESC_SecAppHotel)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END
;--------------------------------
;Uninstaller Section

Section "Uninstall"

  ;ADD YOUR OWN FILES HERE...

  RMDir /R "$INSTDIR"

  RMDir /R "$SMPROGRAMS\AppHotel"

SectionEnd