@echo off
CLS

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