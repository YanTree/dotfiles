@echo off

::: About scoop to install app 
::
set "buckets=extras versions java games"
set "base=7zip dark innounp git"
set "tools=ccache pkg-config make cmake uutils-coreutils everything renderdoc fontcreator"
set "shell=nu"
set "cli=fzf ripgrep lazygit windows-terminal zoxide starship"
set "apps=blender logseq obs-studio powertoys telegram xmind"
set "editor=emacs neovim vscode helix"
set "sdk=lua-language-server rustup-msvc vulkan python"


echo ------- Scoop add buckets
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

REM Git repository
echo ------- Clone neovim config
set "nvchad=git@github.com:YanTree/NvChad.git"
call git clone -b main "%nvchad%" nvim


REM Create symbol link
echo ------- Create symbol link
call mklink /j %dst_lazygit% %src_lazygit%
call mklink /j %dst_nushell% %src_nushell%
call mklink /j %dst_nvim% %src_nvim%

echo ------- Done!

REM Pause to keep the console window open (optional)
pause
