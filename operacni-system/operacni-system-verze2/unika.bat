@ECHO OFF
CLS
mode 80,25
TYPE unikaimage.txt
timeout /t 2 /nobreak > NUL
ECHO.
:verpass
set /p passwd=<D:\vscode\VScode\operacni-system\operacni-system-verze2\verification\verifiset.txt
set /p yourpasswd=<D:\vscode\VScode\operacni-system\operacni-system-verze2\verification\password.txt

if "%passwd%"=="2 " goto :rune
if "%passwd%"=="0 " set /p passwdset="Nastav si heslo: "
if "%passwd%"=="0 " echo %passwdset%> D:\vscode\VScode\operacni-system\operacni-system-verze2\verification\password.txt
if "%passwd%"=="0 " echo 1 > D:\vscode\VScode\operacni-system\operacni-system-verze2\verification\verifiset.txt
if "%passwd%"=="1 " set /p passwdver="Zadej heslo: "
if "%passwd%"=="1 " if "%passwdver%"=="%yourpasswd%" goto rune

echo spatne heslo
timeout /t 1 /nobreak > NUL
goto verpass


:rune
CLS
#####################################################################################################
mode 80,25
title UNIKA by zelvafilas
set /p language=<setjazyk.txt
goto setbarva
:zpet
goto :hlmenu
#####################################################################################################
:hlmenu
CLS
if "%language%"=="1 " TYPE D:\vscode\VScode\operacni-system\operacni-system-verze2\language\cz\hlmenu.txt
if "%language%"=="2 " TYPE D:\vscode\VScode\operacni-system\operacni-system-verze2\language\en\hlmenu.txt
if "%language%"=="1 " set /p mainmenu="Zadej svoji volbu: " & goto skiphlmenu
if "%language%"=="2 " set /p mainmenu="Enter your choice: " & goto skiphlmenu


:skiphlmenu
if "%mainmenu%"=="1" goto internet
if "%mainmenu%"=="2" goto kalkulacka
if "%mainmenu%"=="3" goto zmenajazyka
if "%mainmenu%"=="4" goto hlmenu
if "%mainmenu%"=="5" goto nastaveni
if "%mainmenu%"=="6" systeminfo > c:\specs.txt
if "%mainmenu%"=="0" goto odejit
goto hlmenu

#####################################################################################################
:pomoc
CLS
TYPE pomoc.txt
PAUSE
goto hlmenu
#####################################################################################################
:internet
CLS
if "%language%"=="1 " TYPE D:\vscode\VScode\operacni-system\operacni-system-verze2\language\cz\internet.txt
if "%language%"=="2 " TYPE D:\vscode\VScode\operacni-system\operacni-system-verze2\language\en\internet.txt
if "%language%"=="1 " set /p web="Zadej svoji volbu: " & goto skipnetmenu
if "%language%"=="2 " set /p web="Enter your choice: " & goto skipnetmenu

:skipnetmenu
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
if "%language%"=="1 " TYPE D:\vscode\VScode\operacni-system\operacni-system-verze2\language\cz\nastaveni.txt
if "%language%"=="2 " TYPE D:\vscode\VScode\operacni-system\operacni-system-verze2\language\en\nastaveni.txt
if "%language%"=="1 " set /p more="Zadej svoji volbu: " & goto skipsettingmenu
if "%language%"=="2 " set /p more="Enter your choice: " & goto skipsettingmenu

:skipsettingmenu
if "%more%"=="1" goto barva
if "%more%"=="2" goto net
if "%more%"=="3" goto changepasswd
if "%more%"=="4" goto 
if "%more%"=="5" goto hlmenu
if "%more%"=="6" goto 
if "%more%"=="7" shutdown /h
if "%more%"=="0" goto hlmenu
goto nastaveni
#####################################################################################################
:barva
CLS
if "%language%"=="1 " TYPE D:\vscode\VScode\operacni-system\operacni-system-verze2\language\cz\barva.txt
if "%language%"=="2 " TYPE D:\vscode\VScode\operacni-system\operacni-system-verze2\language\en\barva.txt
if "%language%"=="1 " set /p farba="Zadej svoji volbu: " & goto skipfarbamenu
if "%language%"=="2 " set /p farba="Enter your choice: " & goto skipfarbamenu

:skipfarbamenu
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

#####################################################################################################
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
if "%language%"=="1 " TYPE D:\vscode\VScode\operacni-system\operacni-system-verze2\language\cz\jazyk.txt
if "%language%"=="2 " TYPE D:\vscode\VScode\operacni-system\operacni-system-verze2\language\en\jazyk.txt
if "%language%"=="1 " set /p setjazyk="Zadej svoji volbu: " & goto skipjazykmenu
if "%language%"=="2 " set /p setjazyk="Enter your choice: " & goto skipjazykmenu

:skipjazykmenu 
if "%setjazyk%"=="1" echo 1 > setjazyk.txt
if "%setjazyk%"=="2" echo 2 > setjazyk.txt
if "%setjazyk%"=="1" goto rune
if "%setjazyk%"=="2" goto rune


if "%setjazyk%"=="0" goto hlmenu
goto zmenajazyka
#####################################################################################################

:changepasswd
CLS
set /p yourpasswd=<D:\vscode\VScode\operacni-system\operacni-system-verze2\verification\password.txt
ECHO zmena hesla
if "%passwd%"=="1 " (set /p chanpas="Zadej sve heslo: ") else (echo heslo vypnuto & goto nastaveni )
if "%chanpas%"=="%yourpasswd%" (set /p novheslo="Zadej nove heslo: ")
if "%chanpas%"=="%yourpasswd%" (echo %novheslo%> D:\vscode\VScode\operacni-system\operacni-system-verze2\verification\password.txt)
ECHO spatne heslo
timeout /t 1 / nobreak > NUL
goto nastaveni

#####################################################################################################
:odejit