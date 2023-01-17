@ECHO OFF
CLS
mode 80,25
color 7
TYPE unikaimage.txt
timeout /t 3 /nobreak > NUL

set /p setjazyk=<setjazyk.txt
if "%setjazyk%"=="1 " czmain.bat
if "%setjazyk%"=="2 " enmain.bat
if "%setjazyk%"=="3 " demain.bat¨
timeuot /t 1 /nobreak >NUL
Echo Error nelze najít soubor se zvoleným jazykem
enmain.bat