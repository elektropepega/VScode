@ECHO OFF
CLS
#####################################################################################################
mode 80,25
title UNIKA by zelvafilas
goto setbarva

:zpet
set /p sethatmatilka=<setjazyk.txt
if "%sethatmatilka%"=="1 " color 1
if "%sethatmatilka%"=="2 " color 7 
if "%sethatmatilka%"=="3 " color 4

goto :hlmenu
#####################################################################################################

:hlmenu
CLS
ECHO +----------------+-------------------------------------------------------------+
ECHO \    UNIKA OS    \                                                 Cestina     \
ECHO +----------------+-------------------------------------------------------------+
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \   Zvol dalsi menu nebo funkci.                                               \
ECHO +------------------------------------------------------------------------------+
ECHO \   1) INTERNET                                                                \
ECHO \   2) Kalkulacka                                                              \
ECHO \   3) Zmena jazyka                                                            \
ECHO \   4)                                                                         \
ECHO \   5) Dalsi fukce a nastaveni                                                 \
ECHO \   6) O systemu                                                               \
ECHO \   0) Vypnuti OS nastavby                                                     \
ECHO \                                                            by zelvafilas     \
ECHO +------------------------------------------------------------------------------+

set /p mainmenu="Zadej svoji volbu: " 
if "%mainmenu%"=="1" goto internet
if "%mainmenu%"=="2" goto kalkulacka
if "%mainmenu%"=="3" goto zmenajazyka
if "%mainmenu%"=="4" goto hlmenu
if "%mainmenu%"=="5" goto nastaveni
if "%mainmenu%"=="6" systeminfo > c:\specs.txt
if "%mainmenu%"=="0" goto odejit
goto hlmenu


:pomoc
CLS
TYPE pomoc.txt
PAUSE
goto hlmenu
#####################################################################################################

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
ECHO \   5) NIC                                                                     \
ECHO \   6) POCASI                                                                  \
ECHO \   0) Zpet na HLAVNI MENU                                                     \
ECHO \                                                                              \
ECHO +------------------------------------------------------------------------------+

set /p web="Zvol svoji volbu: "
if "%web%"=="1" start https://www.google.com
if "%web%"=="2" start https://www.youtube.com
if "%web%"=="3" start https://www.novinky.cz
if "%web%"=="4" start https://translate.google.com
if "%web%"=="5" start https://www.youtube.com/watch?v=dQw4w9WgXcQ
if "%web%"=="6" start https://pocasi.idnes.cz/
if "%web%"=="0" goto hlmenu
goto internet

#####################################################################################################
:nastaveni
CLS
ECHO +----------------+-------------------------------------------------------------+
ECHO \    UNIKA OS    \     Dalsi funkce a nastaveni                                \
ECHO +----------------+----------------------------------------------- -------------+
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \   Zvol dalsi funkce nebo nastaveni                                           \
ECHO +------------------------------------------------------------------------------+
ECHO \   1) zmena barvy OS                                                          \
ECHO \   2) informace o siti                                                        \
ECHO \   3)                                                                         \
ECHO \   4)                                                                         \
ECHO \   5)                                                                         \
ECHO \   6)                                                                         \
ECHO \   0) Zpet na HLAVNI MENU                                                     \
ECHO \                                                                          7not\
ECHO +------------------------------------------------------------------------------+

set /p more="Zvol svoji volbu: "
if "%more%"=="1" goto barva
if "%more%"=="2" goto net
if "%more%"=="3" goto hlmenu
if "%more%"=="4" goto hlmenu
if "%more%"=="5" goto hlmenu
if "%more%"=="6" goto 
if "%more%"=="7" shutdown /h
if "%more%"=="0" goto hlmenu
goto nastaveni

:barva
CLS
ECHO +----------------+-------------------------------------------------------------+
ECHO \    UNIKA OS    \   Zmena barvy                                               \
ECHO +----------------+-------------------------------------------------------------+
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \   Zvol si barvu operacniho systemu                                           \
ECHO +------------------------------------------------------------------------------+
ECHO \   1) Modry     text                                                          \
ECHO \   2) Bily      text                                                          \
ECHO \   3) Cerveny   text                                                          \
ECHO \   4) Zeleny    text                                                          \
ECHO \   5) Fialovy   text                                                          \
ECHO \   6) Zluty     text                                                          \
ECHO \   0) Zpet na HLAVNI MENU                                                     \
ECHO \                                                                              \
ECHO +------------------------------------------------------------------------------+

set /p farba="Zvol svoji volbu: "
if "%farba%"=="1" color 1 & echo 1 > setcolor.txt
if "%farba%"=="2" color 7 & echo 2 > setcolor.txt
if "%farba%"=="3" color 4 & echo 3 > setcolor.txt
if "%farba%"=="4" color 2 & echo 4 > setcolor.txt
if "%farba%"=="5" color 5 & echo 5 > setcolor.txt
if "%farba%"=="6" color 6 & echo 6 > setcolor.txt
if "%farba%"=="0" goto nastaveni
goto barva

:setbarva
set /p setcolor=<setcolor.txt
if "%setcolor%"=="1 " color 1
if "%setcolor%"=="2 " color 7 
if "%setcolor%"=="3 " color 4
if "%setcolor%"=="4 " color 2
if "%setcolor%"=="5 " color 5
if "%setcolor%"=="6 " color 6
goto zpet


:net
SCL
ECHO Za moment se vypise specifikace siti
ECHO Na hlavni menu se vratite stisknusim jakekoliv klavesy
timeout /t 6 /nobreak > NUL
ipconfig
PAUSE
goto hlmenu
#####################################################################################################
:kalkulacka
CLS
echo.
echo Vítej v kalkulacce
echo.
echo   1)scitani
echo.
echo   2)odcitani
echo.
echo   3)deleni
echo.
echo   4)nasobeni
echo. 
echo   0)Zpet na hlavni menu
echo.
set /p do="Zvol operaci: "
if %do%== 1 goto scit
if %do%== 2 goto odcit
if %do%== 3 goto delen
if %do%== 4 goto krate
if %do%== 0 goto hlmenu
goto kalkulacka

:scit
cls
echo Scitani
echo.
set /p no1="cislo 1: "
echo       +
set /p no2="cislo 2: "
set /a sum=no1+no2
echo ------------
echo %sum%
echo.
pause
cls
goto kalkulacka


:odcit
cls
echo Odcitani
echo.
set /p no1="cislo 1: "
echo       -
set /p no2="cislo 2: "
set /a sum=no1-no2
echo ------------
echo %sum%
echo.
pause
cls
goto kalkulacka


:delen
cls
echo Deleni
echo.
set /p no1="cislo 1: "
echo       /
set /p no2="cislo 2: "
set /a sum=no1/no2
echo ------------
echo %sum%
echo.
pause
cls
goto kalkulacka


:krate
cls
echo Nasobeni
echo.
set /p no1="cislo 1: "
echo       *
set /p no2="cislo 2: "
set /a sum=no1*no2
echo ------------
echo %sum%
echo.
pause
cls
goto kalkulacka

#####################################################################################################

:zmenajazyka
CLS
ECHO +----------------+-------------------------------------------------------------+
ECHO \    UNIKA OS    \   Zmena Jazyka                                              \
ECHO +----------------+-------------------------------------------------------------+
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \   Zvol si jazyk operacniho systemu                                           \
ECHO +------------------------------------------------------------------------------+
ECHO \   1) Cestina                                                                 \
ECHO \   2) Anglictina                                                              \
ECHO \   3) Nemcina                                                                 \
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \   0) Zpet na HLAVNI MENU                                                     \
ECHO \                                                                              \
ECHO +------------------------------------------------------------------------------+

set /p setjazyk="Zadej svoji volbu: " 
if "%setjazyk%"=="1" echo 1 > setjazyk.txt & czmain.bat
if "%setjazyk%"=="2" echo 2 > setjazyk.txt & enmain.bat
if "%setjazyk%"=="3" echo 3 > setjazyk.txt & demain.bat
if "%setjazyk%"=="0" goto hlmenu
goto zmenajazyka



:odejit