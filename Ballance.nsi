!include MUI2.nsh
!include LogicLib.nsh

Outfile "BallanceInstaller.exe"
Name "$(TITLE_Ballance)"
Unicode true
BrandingText "$(TITLE_Installer)"

SetCompress auto
SetCompressor /final /solid lzma ; use the 7-zip compression
SetCompressorDictSize 64

!define MUI_ICON "Resources\Ballance.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "Ballance\Bin\splash.bmp"
!define MUI_HEADERIMAGE_BITMAP_STRETCH AspectFitHeight

!define MUI_ABORTWARNING
!define MUI_LANGDLL_ALLLANGUAGES

; !define MUI_FINISHPAGE_NOAUTOCLOSE
!define MUI_FINISHPAGE_NOREBOOTSUPPORT
!define MUI_FINISHPAGE_SHOWREADME "$InstDir\Readme.pdf"
!define MUI_FINISHPAGE_RUN
!define MUI_FINISHPAGE_RUN_FUNCTION runBallance ; Custom working directory
!define MUI_FINISHPAGE_RUN_NOTCHECKED
!define MUI_FINISHPAGE_LINK "$(LINK_Help)"
!define MUI_FINISHPAGE_LINK_LOCATION "$InstDir\help\help_eng.htm"

RequestExecutionLevel user
; SetShellVarContext all
InstallDir "$LOCALAPPDATA\Programs\Ballance"

!insertmacro MUI_PAGE_WELCOME
; !insertmacro MUI_PAGE_LICENSE "${NSISDIR}\Docs\Modern UI\License.txt"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "SimpChinese"

!insertmacro MUI_RESERVEFILE_LANGDLL


Section "Ballance" SecBallance

  ${If} ${FileExists} "$InstDir\*"
    MessageBox MB_YESNO "$(WARN_DirectoryExists)" IDYES true IDNO false
    false:
      Abort
    true:
  ${EndIf}

  SetDetailsPrint both
  SetOutPath $InstDir
  DetailPrint "Extracting Ballance..."
  File /r "Ballance\*.*"

  ; SetCompress off
	; ReserveFile "Ballance.7z"
	; File "Ballance.7z"
  ; Nsis7z::ExtractWithDetails "Ballance.7z" "Installing package %s..."
  ; Delete "$OUTDIR\Ballance.7z"  

SectionEnd

Section "Ballance Mod Loader" SecBML

  SetDetailsPrint both
  SetOutPath $InstDir
  DetailPrint "Extracting BMLPlus..."
  File /r "BMLPlus\*.*"

SectionEnd

Section "$(TITLE_Shortcut)" SecShortcut

  SetOutPath "$InstDir\Bin"
  CreateShortCut "$Desktop\Ballance.lnk" "$InstDir\Bin\Player.exe"
  SetOutPath "$InstDir"

SectionEnd


Function .onInit
  !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd

Function runBallance
  SetOutPath "$InstDir\Bin"
  Exec "$InstDir\Bin\Player.exe"
FunctionEnd


LangString WARN_DirectoryExists ${LANG_ENGLISH} `"$InstDir" directory already exists, continue installing anyways?`
LangString WARN_DirectoryExists ${LANG_SIMPCHINESE} `"$InstDir" 目录已经存在，仍然要继续安装吗？`

LangString TITLE_Ballance ${LANG_ENGLISH} "Ballance"
LangString TITLE_Ballance ${LANG_SIMPCHINESE} "Ballance (平衡球)"

LangString TITLE_Installer ${LANG_ENGLISH} "Ballance Modern Repack with NSIS ${NSIS_VERSION}"
LangString TITLE_Installer ${LANG_SIMPCHINESE} "Ballance 现代整合包 with NSIS ${NSIS_VERSION}"

LangString TITLE_Shortcut ${LANG_ENGLISH} "Desktop Shortcut"
LangString TITLE_Shortcut ${LANG_SIMPCHINESE} "桌面快捷方式"

LangString LINK_Help ${LANG_ENGLISH} "View Official Help Document"
LangString LINK_Help ${LANG_SIMPCHINESE} "查看官方帮助文档"

LangString DESC_SecBallance ${LANG_ENGLISH} "Core files for running the Ballance Game."
LangString DESC_SecBallance ${LANG_SIMPCHINESE} "Ballance 游戏运行的核心文件。"

LangString DESC_SecBML ${LANG_ENGLISH} "Ballance Mod Loader (Plus). Usually required for the game to run on modern systems."
LangString DESC_SecBML ${LANG_SIMPCHINESE} "Ballance Mod 加载器 (Plus)，使得游戏可以在现代系统上运行。"

LangString DESC_SecShortcut ${LANG_ENGLISH} "Create a shortcut on the desktop."
LangString DESC_SecShortcut ${LANG_SIMPCHINESE} "在桌面上创建快捷方式。"


!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SecBallance} $(DESC_SecBallance)
  !insertmacro MUI_DESCRIPTION_TEXT ${SecBML} $(DESC_SecBML)
  !insertmacro MUI_DESCRIPTION_TEXT ${SecShortcut} $(DESC_SecShortcut)
!insertmacro MUI_FUNCTION_DESCRIPTION_END
