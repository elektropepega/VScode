@ECHO OFF
CLS
#####################################################################################################
mode 80,25
title UNIKA by zelvafilas
goto setbarva

:zpet


goto :hlmenu
#####################################################################################################

:hlmenu
CLS
ECHO +----------------+-------------------------------------------------------------+
ECHO \    UNIKA OS    \                                                 English     \
ECHO +----------------+-------------------------------------------------------------+
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \   Select another menu or function                                            \
ECHO +------------------------------------------------------------------------------+
ECHO \   1) INTERNET                                                                \
ECHO \   2) Calculator                                                              \
ECHO \   3) Change of language                                                      \
ECHO \   4)                                                                         \
ECHO \   5) Additional function and settings                                        \
ECHO \   6) About the system                                                        \
ECHO \   0) Trun off OS                                                             \
ECHO \                                                            by zelvafilas     \
ECHO +------------------------------------------------------------------------------+

set /p mainmenu="Enter your choice : " 
if "%mainmenu%"=="1" goto internet
if "%mainmenu%"=="2" goto kalkulacka
if "%mainmenu%"=="3" goto zmenajazyka
if "%mainmenu%"=="4" goto hlmenu
if "%mainmenu%"=="5" goto nastaveni
if "%mainmenu%"=="6" goto systeminfo > c:\specs.txt
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
ECHO \   Choice the wibsite you want to view                                        \
ECHO +------------------------------------------------------------------------------+
ECHO \   1) GOOGLE search                                                           \
ECHO \   2) YOUTUBE                                                                 \
ECHO \   3) NOVINKY CZ                                                              \
ECHO \   4) GOOGLE translator                                                       \
ECHO \   5) NIC                                                                     \
ECHO \   6) wether                                                                  \
ECHO \   0) Back to the Main Menu                                                   \
ECHO \                                                                              \
ECHO +------------------------------------------------------------------------------+

set /p web="Enter your choice : "
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
ECHO \    UNIKA OS    \     Additional function and settings                        \
ECHO +----------------+-------------------------------------------------------------+
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \   Additional function and settings                                           \
ECHO +------------------------------------------------------------------------------+
ECHO \   1) Change color OS                                                         \
ECHO \   2) information network                                                     \
ECHO \   3)                                                                         \
ECHO \   4)                                                                         \
ECHO \   5)                                                                         \
ECHO \   6)                                                                         \
ECHO \   0) Back to the Main Menu                                                   \
ECHO \                                                                          7not\
ECHO +------------------------------------------------------------------------------+

set /p more="Enter your choice: "
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
ECHO \    UNIKA OS    \   Change color                                              \
ECHO +----------------+-------------------------------------------------------------+
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \   Choice the color of the OS                                                 \
ECHO +------------------------------------------------------------------------------+
ECHO \   1) Blue     text                                                           \
ECHO \   2) White    text                                                           \
ECHO \   3) Red      text                                                           \
ECHO \   4) Green    text                                                           \
ECHO \   5) Purple   text                                                           \
ECHO \   6) Yellow   text                                                           \
ECHO \   0) Back to the Main Menu                                                   \
ECHO \                                                                              \
ECHO +------------------------------------------------------------------------------+

set /p farba="Enter your choice: "
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
ECHO The network specification will be displayed in a moment
ECHO Press any key to return to the main menu
timeout /t 6 /nobreak > NUL
ipconfig
PAUSE
goto hlmenu
#####################################################################################################
:kalkulacka
CLS
echo.
echo Welcome to the calculator
echo.
echo   1)addition
echo.
echo   2)subtraction
echo.
echo   3)division
echo.
echo   4)multiplication
echo. 
echo   0)Back to the main menu
echo.
set /p do="Select an operation: "
if %do%== 1 goto scit
if %do%== 2 goto odcit
if %do%== 3 goto delen
if %do%== 4 goto krate
if %do%== 0 goto hlmenu
goto kalkulacka

:scit
cls
echo addition
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
echo subtraction
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
echo division
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
echo multiplication
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
ECHO \    UNIKA OS    \   Change Language                                           \
ECHO +----------------+-------------------------------------------------------------+
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \   Choose the language of the operating system                                \
ECHO +------------------------------------------------------------------------------+
ECHO \   1) Czech                                                                   \
ECHO \   2) English                                                                 \
ECHO \   3) German                                                                  \
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \                                                                              \
ECHO \   0) Back to the Main Menu                                                     \
ECHO \                                                                              \
ECHO +------------------------------------------------------------------------------+

set /p setjazyk="Enter your choice: " 
if "%setjazyk%"=="1" echo 1 > setjazyk.txt & czmain.bat
if "%setjazyk%"=="2" echo 2 > setjazyk.txt & enmain.bat
if "%setjazyk%"=="3" echo 3 > setjazyk.txt & demain.bat
if "%setjazyk%"=="0" goto hlmenu
goto zmenajazyka


:odejit