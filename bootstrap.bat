@echo off


:: Window useful tools?
echo ------- Windows module
echo ------- irm https://massgrave.dev/get ^| iex


:: Detection scoop exist
REM Check scoop is installed
call where scoop >nul 2>nul
REM Check the exit code to determine existence
echo ------- Scoop module
if %errorlevel% equ 0 (
    echo ------- Homo, scoop is ready!.
) else (
    echo ------- First go to install scoop, follow link:
    echo ------- https://scoop.sh/#/
)


::: About scoop to install app 
::
set "buckets=extras versions java games"
set "base=7zip unzip wget dark innounp git"
set "tools=ccache pkg-config make cmake uutils-coreutils everything renderdoc apktool wezterm"
set "shell=nu"
set "cli=unar jq poppler fd fzf ripgrep lazygit windows-terminal yazi zoxide starship"
set "apps=blender logseq obs-studio powertoys telegram xmind fontcreator firefox steam"
set "editor=emacs neovim vscode helix"
set "sdk=luarocks lua-language-server rustup-msvc vulkan python mingw-winlibs-llvm-ucrt-mcf openjdk16"


echo ------- Scoop buckets module
REM Scoop add bucket
for %%i in (%buckets%) do (
    call scoop bucket add %%i
)

echo ------- Base module
REM Scoop install base module
for %%i in (%base%) do (
    call scoop install %%i
)

echo ------- Tool module
REM Scoop install tool module
for %%i in (%tools%) do (
    call scoop install %%i
)

echo ------- Shell module
REM Scoop install shell module
for %%i in (%shell%) do (
    call scoop install %%i
)

echo ------- Cli module
REM Scoop install cli module
for %%i in (%cli%) do (
    call scoop install %%i
)

echo ------- Apps module
REM Scoop install apps module
for %%i in (%apps%) do (
    call scoop install %%i
)

echo ------- Editor module
REM Scoop install editor module
for %%i in (%editor%) do (
    call scoop install %%i
)

echo ------- SDK module
REM Scoop install SDK module
for %%i in (%sdk%) do (
    call scoop install %%i
)


::Detection HOME environment variable is ready!
::
REM Add `HOME` environment variable
set "home=HOME"
set "home_path=%USERPROFILE%"
set "git_usr_bin=%USERPROFILE%\scoop\apps\git\current\usr\bin"

rem Check if a user environment variable exists
reg query HKCU\Environment /v %home% >nul 2>&1

if %errorlevel% equ 0 (
    echo ------- [%home%] environment variable is ready!
    echo ------- [%home%] : %home_path%
) else (
    echo ------- [%home%] environment variable to create... 

    setx %home% %home_path%
    echo ------- [%home%] : %home_path%
    echo ------- Done!
)

rem Check if a user environment variable exists
echo %PATH% | find /i "%git_usr_bin%" >nul

if %errorlevel% equ 0 (
    echo ------- [Path] path variable is ready!
    echo ------- [Path] : %git_usr_bin%
) else (
    echo ------- [Path] path variable to create... 
    reg add HKCU\Environment /v PATH /t REG_EXPAND_SZ /d "%PATH%;%git_usr_bin%" /f
    echo ------- [Path] : %git_usr_bin%
    echo ------- Done!
)


::: About create symbol link
::
set "dir_default=%CD%"
set "dir_cache=%USERPROFILE%\.cache"
set "dir_local=%USERPROFILE%\AppData\Local"
set "dir_roaming=%USERPROFILE%\AppData\Roaming"

REM Data src directory collection
set "src_lazygit=%dir_default%\lazygit"
set "src_nushell=%dir_default%\nushell"
set "src_nvim=%dir_default%\nvim"

REM Data dst directory collection
set "dst_lazygit=%dir_roaming%\lazygit"
set "dst_nushell=%dir_roaming%\nushell"
set "dst_nvim=%dir_local%\nvim"


REM Create cache folder
if not exist "%dir_cache%" (
    echo ------- Create .cache folder
    call mkdir %dir_cache%
)


REM Create symbol link
echo ------- Create symbol link
call mklink /j %dst_lazygit% %src_lazygit%
call mklink /j %dst_nushell% %src_nushell%
call mklink /j %dst_nvim% %src_nvim%

echo ------- Done!

REM Pause to keep the console window open (optional)
pause
