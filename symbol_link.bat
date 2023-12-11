echo off

setlocal enabledelayedexpansion

REM Directory info
set "dir_default=%CD%"
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


REM Git repository
echo ------- Clone nvchad fork -------
set "nvchad=git@github.com:YanTree/NvChad.git"
REM Clone the repository
git clone -b main "%nvchad%" nvim


REM Create symbol link
echo ------ Create symbol link -------
mklink /j %dst_lazygit% %src_lazygit%
mklink /j %dst_nushell% %src_nushell%
mklink /j %dst_nvim% %src_nvim%
echo ------ Done --------------------

endlocal

pause