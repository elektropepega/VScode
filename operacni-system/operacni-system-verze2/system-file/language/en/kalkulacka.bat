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
if %do%== 0 goto end
goto kalkulacka

:scit
cls
echo addition
echo.
set /p no1="number 1: "
echo       +
set /p no2="number 2: "
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
set /p no1="number 1: "
echo       -
set /p no2="number 2: "
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
set /p no1="number 1: "
echo       /
set /p no2="number 2: "
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
set /p no1="number 1: "
echo       *
set /p no2="number 2: "
set /a sum=no1*no2
echo ------------
echo %sum%
echo.
pause
cls
goto kalkulacka

:end

echo 1 > system-file\kalkset.txt
unika.bat