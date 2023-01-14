@ECHO OFF
CLS
mode 80,25
TYPE unikaimage.txt
timeout /t 3 /nobreak > NUL
mode 80,25
goto :hlmenu


:hlmenu
CLS
ECHO +----------------+-------------------------------------------------------------+
ECHO \    UNIKA OS    \                                                             \
ECHO +----------------+-------------------------------------------------------------+
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \   Zvol dalsi menu nebo funkci.                                               \
ECHO +------------------------------------------------------------------------------+
ECHO \   1) INTERNET                                                                \
ECHO \   2)                                                                         \
ECHO \   3)                                                                         \
ECHO \   4)                                                                         \
ECHO \   5) Dalsi fukce a nastaveni                                                 \
ECHO \   6) Pomoc / Napoveda                                                        \
ECHO \   7) Vypnuti OS nastavby                                                     \
ECHO \                                                                              \
ECHO +------------------------------------------------------------------------------+

set /p mainmenu="Zadej svoji volbu: " 
if "%mainmenu%"=="1" goto internet
if "%mainmenu%"=="2" goto hlmenu
if "%mainmenu%"=="3" goto hlmenu
if "%mainmenu%"=="4" goto hlmenu
if "%mainmenu%"=="5" goto nastaveni
if "%mainmenu%"=="6" goto pomoc
if "%mainmenu%"=="7" goto odejit


:pomoc
CLS
TYPE pomoc.txt
PAUSE
goto hlmenu


:internet
CLS
ECHO +----------------+-------------------------------------------------------------+
ECHO \    UNIKA OS    \     INTERNET                                                \
ECHO +----------------+-------------------------------------------------------------+
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \   Zvol si web na ktery se cchces podivat                                     \
ECHO +------------------------------------------------------------------------------+
ECHO \   1) GOOGLE vyhledavac                                                       \
ECHO \   2) YOUTUBE                                                                 \
ECHO \   3) NOVINKY CZ                                                              \
ECHO \   4) GOOGLE PREKLADAC                                                        \
ECHO \   5)                                                                         \
ECHO \   6)                                                                         \
ECHO \   7) Zpet na HLAVNI MENU                                                     \
ECHO \                                                                              \
ECHO +------------------------------------------------------------------------------+

set /p web="Zvol svoji volbu: "
if "%web%"=="1" start https://www.google.com
if "%web%"=="2" start https://www.youtube.com
if "%web%"=="3" start https://www.novinky.cz
if "%web%"=="4" start https://translate.google.com
if "%web%"=="5" goto hlmenu
if "%web%"=="6" goto hlmenu
if "%web%"=="7" goto hlmenu
goto hlmenu


:nastaveni
CLS
ECHO +----------------+-------------------------------------------------------------+
ECHO \    UNIKA OS    \     Dalsi funkce a nastaveni                                    \
ECHO +----------------+-------------------------------------------------------------+
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \   Zvol dalsi funkce nebo nastaveni                                           \
ECHO +------------------------------------------------------------------------------+
ECHO \   1) znena barvy OS                                                         \
ECHO \   2) YOUTUBE                                                                 \
ECHO \   3) NOVINKY CZ                                                              \
ECHO \   4) GOOGLE PREKLADAC                                                        \
ECHO \   5)                                                                         \
ECHO \   6)                                                                         \
ECHO \   7) Zpet na HLAVNI MENU                                                     \
ECHO \                                                                              \
ECHO +------------------------------------------------------------------------------+

set /p more="Zvol svoji volbu: "
if "%more%"=="1" goto barva
if "%more%"=="2" goto hlmenu
if "%more%"=="3" goto hlmenu
if "%more%"=="4" goto hlmenu
if "%more%"=="5" goto hlmenu
if "%more%"=="6" goto hlmenu
if "%more%"=="7" goto hlmenu
goto hlmenu

:barva
CLS
ECHO +----------------+-------------------------------------------------------------+
ECHO \    UNIKA OS    \   Zmena barvy                                               \
ECHO +----------------+-------------------------------------------------------------+
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \   Zvol si web na ktery se cchces podivat                                     \
ECHO +------------------------------------------------------------------------------+
ECHO \   1) Modrý text                                                              \
ECHO \   2) Bily  text                                                             \
ECHO \   3) Cerveny text                                                            \
ECHO \   4) Zeleny text                                                             \
ECHO \   5)                                                                         \
ECHO \   6)                                                                         \
ECHO \   7) Zpet na HLAVNI MENU                                                     \
ECHO \                                                                              \
ECHO +------------------------------------------------------------------------------+

set /p web="Zvol svoji volbu: "
if "%web%"=="1" 
if "%web%"=="2" 
if "%web%"=="3" 
if "%web%"=="4" 
if "%web%"=="5" goto hlmenu
if "%web%"=="6" goto hlmenu
if "%web%"=="7" goto hlmenu
goto hlmenu



:odejit