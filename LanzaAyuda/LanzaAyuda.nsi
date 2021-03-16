
!include "ZipDLL.nsh"
!include "MUI2.nsh"

;General

  ;Name and file
  Name "Lanza Ayuda"
  OutFile "InstallAyuda.exe"
  Unicode True

  ;Default installation folder
  InstallDir "$APPDATA\LanzaAyuda"

  ;Request application privileges for Windows Vista
  RequestExecutionLevel user

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

Section "Lanza Ayuda" SecLanzaAyuda

  SetOutPath "$INSTDIR"
  
  ;ADD YOUR OWN FILES HERE...
  
  File dist.7z
	Nsis7z::Extract dist.7z
	Delete $INSTDIR\dist.7z
  
  ;Create uninstaller
  WriteUninstaller "$INSTDIR\UninstallLanzaAyuda.exe"
    
    ;Create shortcuts
    CreateDirectory "$SMPROGRAMS\LanzaAyuda"
    CreateShortcut "$SMPROGRAMS\LanzaAyuda\UninstallLanzaAyuda.lnk" "$INSTDIR\UninstallLanzaAyuda.exe"
    CreateShortcut "$SMPROGRAMS\LanzaAyuda\LanzaAyuda.lnk" "$INSTDIR\LanzaAyuda.jar"

SectionEnd

;--------------------------------
;Descriptions

  ;Language strings
  LangString DESC_SecLanzaAyuda ${LANG_SPANISH} "Lanza Ayuda."

  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SecLanzaAyuda} $(DESC_SecLanzaAyuda)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END
;--------------------------------
;Uninstaller Sectiont

Section "Uninstall"

  ;ADD YOUR OWN FILES HERE...

  RMDir /R "$INSTDIR"

  RMDir /R "$SMPROGRAMS\LanzaAyuda"

SectionEnd