@ECHO OFF
CLS
set /p setkalk=<system-file\kalkset.txt
if "%setkalk%"=="1 " goto hlmenu

mode 80,25
goto setbarva
:zpet
TYPE system-file\unikaimage.txt
timeout /t 2 /nobreak > NUL
ECHO.
:verpass
set /p passwd=<system-file\verification\verifiset.txt
set /p yourpasswd=<system-file\verification\password.txt
set /p language=<system-file\setjazyk.txt

if "%passwd%"=="2 " goto rune
if "%language%"=="1 " if "%passwd%"=="0 " set /p passwdset="Nastav si sve heslo: "
if "%language%"=="2 " if "%passwd%"=="0 " set /p passwdset="Set your password: "
if "%passwd%"=="0 " echo %passwdset%> system-file\verification\password.txt
if "%passwd%"=="0 " echo 1 > system-file\verification\verifiset.txt
if "%language%"=="1 " if "%passwd%"=="1 " set /p passwdver="Zadejte sve heslo: "
if "%language%"=="2 " if "%passwd%"=="1 " set /p passwdver="Enter your password: "
if "%passwd%"=="1 " if "%passwdver%"=="%yourpasswd%" goto rune


timeout /t 1 /nobreak > NUL
goto verpass


:rune
CLS
#####################################################################################################
mode 80,25
title UNIKA
set /p language=<system-file\setjazyk.txt

goto :hlmenu
#####################################################################################################
:hlmenu
CLS
echo 0 > system-file\kalkset.txt 
if "%language%"=="1 " TYPE system-file\language\cz\hlmenu.txt
if "%language%"=="2 " TYPE system-file\language\en\hlmenu.txt
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
if "%language%"=="1 " TYPE system-file\language\cz\internet.txt
if "%language%"=="2 " TYPE system-file\language\en\internet.txt
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
if "%language%"=="1 " TYPE system-file\language\cz\nastaveni.txt
if "%language%"=="2 " TYPE system-file\language\en\nastaveni.txt
if "%language%"=="1 " set /p more="Zadej svoji volbu: " & goto skipsettingmenu
if "%language%"=="2 " set /p more="Enter your choice: " & goto skipsettingmenu

:skipsettingmenu
if "%more%"=="1" goto barva
if "%more%"=="2" goto net
if "%more%"=="3" goto changepasswd
if "%more%"=="4" goto onoffheslo
if "%more%"=="5" goto hlmenu
if "%more%"=="6" goto 
if "%more%"=="7" shutdown /h
if "%more%"=="0" goto hlmenu
goto nastaveni
#####################################################################################################
:barva
CLS
if "%language%"=="1 " TYPE system-file\language\cz\barva.txt
if "%language%"=="2 " TYPE system-file\language\en\barva.txt
if "%language%"=="1 " set /p farba="Zadej svoji volbu: " & goto skipfarbamenu
if "%language%"=="2 " set /p farba="Enter your choice: " & goto skipfarbamenu

:skipfarbamenu
if "%farba%"=="1" color 1 & echo 1 > system-file\setcolor.txt
if "%farba%"=="2" color 7 & echo 2 > system-file\setcolor.txt
if "%farba%"=="3" color 4 & echo 3 > system-file\setcolor.txt
if "%farba%"=="4" color 2 & echo 4 > system-file\setcolor.txt
if "%farba%"=="5" color 5 & echo 5 > system-file\setcolor.txt
if "%farba%"=="6" color 6 & echo 6 > system-file\setcolor.txt
if "%farba%"=="0" goto nastaveni
goto barva

:setbarva
set /p setcolor=<system-file\setcolor.txt
if "%setcolor%"=="1 " color 1
if "%setcolor%"=="2 " color 7 
if "%setcolor%"=="3 " color 4
if "%setcolor%"=="4 " color 2
if "%setcolor%"=="5 " color 5
if "%setcolor%"=="6 " color 6
goto zpet

#####################################################################################################
:net
cls
ECHO Za moment se vypise specifikace siti
ECHO Na hlavni menu se vratite stisknusim jakekoliv klavesy
timeout /t 6 /nobreak > NUL
ipconfig
PAUSE
goto hlmenu
#####################################################################################################
:kalkulacka

if "%language%"=="1 " system-file\language\cz\kalkulacka.bat
if "%language%"=="2 " system-file\language\en\kalkulacka.bat

#####################################################################################################

:zmenajazyka
CLS
if "%language%"=="1 " TYPE system-file\language\cz\jazyk.txt
if "%language%"=="2 " TYPE system-file\language\en\jazyk.txt
if "%language%"=="1 " set /p setjazyk="Zadej svoji volbu: " & goto skipjazykmenu
if "%language%"=="2 " set /p setjazyk="Enter your choice: " & goto skipjazykmenu

:skipjazykmenu 
if "%setjazyk%"=="1" echo 1 > system-file\setjazyk.txt
if "%setjazyk%"=="2" echo 2 > system-file\setjazyk.txt
if "%setjazyk%"=="1" goto rune
if "%setjazyk%"=="2" goto rune


if "%setjazyk%"=="0" goto hlmenu
goto zmenajazyka
#####################################################################################################

:changepasswd
CLS
if "%passwd%"=="2 " echo heslo vypnuto & goto :rune
set /p yourpasswd=<system-file\verification\password.txt
set /p language=<system-file\setjazyk.txt

if "%language%"=="1 " ECHO zmena hesla
if "%language%"=="2 " echo changing the password

if "%language%"=="1 " if "%passwd%"=="1 " (set /p chanpas="Zadejte sve heslo: ") else (echo heslo vypnuto & goto nastaveni )
if "%language%"=="2 " if "%passwd%"=="1 " (set /p chanpas="Enter your password: ") else (echo heslo vypnuto & goto nastaveni )
if "%language%"=="1 " if "%chanpas%"=="%yourpasswd%" (set /p novheslo="Zadejte nove heslo: ")
if "%language%"=="2 " if "%chanpas%"=="%yourpasswd%" (set /p novheslo="Enter a new password: ")
if "%chanpas%"=="%yourpasswd%" (echo %novheslo%> system-file\verification\password.txt)
if "%language%"=="1 " ECHO spatne heslo
if "%language%"=="2 " echo wrong password
timeout /t 1 / nobreak > NUL
goto nastaveni

#####################################################################################################
:onoffheslo
CLS
set /p onoff=<system-file\verification\verifiset.txt
if "%onoff%"=="1 " echo 2 > system-file\verification\verifiset.txt
if "%onoff%"=="2 " echo 0 > system-file\verification\verifiset.txt
goto verpass

#####################################################################################################
:odejit
