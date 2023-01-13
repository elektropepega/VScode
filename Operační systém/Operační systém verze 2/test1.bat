 @ECHO off 

:start 
CLS 
ECHO Welcome, %USERNAME%! 
echo. 
echo Main Menu
echo. 
echo 1. Network Utilities
echo 2. Display Submenu 2 
echo 3. Display Submenu 3 
echo 4. Shutdown
echo 5. Restart
echo 6. Log Off
echo 7. Exit this Menu

set /p choice="Enter your choice: " 
if "%choice%"=="1" goto submenu_1 
if "%choice%"=="2" goto submenu_2 
if "%choice%"=="3" goto submenu_3 
if "%choice%"=="4" shutdown -t 20
if "%choice%"=="5" shutdown -r
if "%choice%"=="6" shutdown -l
if "%choice%"=="7" goto bail 

:submenu_1 
echo Submenu_1 
ECHO    
ECHO 1 - Open Router Config 192.168.0.1
ECHO 2 - Open Router Config 192.168.100.1
ECHO 3 - Open Router Config 192.168.254.1
ECHO 4 - Show Network Config
ECHO 5 - Open Control Panel
ECHO 6 - Open Network And Sharing Center
ECHO 7 - Open Add or Remove Apps
ECHO 8 - Show All Network Devices
ECHO 0 - Back to Main Menu
ECHO.
SET /P M=Type 1, 2, 3, 4, 5, 6, 7, 8, 0, then press ENTER:
IF %M%==1 start HTTP://192.168.0.1
IF %M%==2 start HTTP://192.168.100.1
IF %M%==3 start HTTP://192.168.254.1
IF %M%==4 ipconfig /all
IF %M%==5 start control
IF %M%==6 start control /name Microsoft.NetworkAndSharingCenter
IF %M%==7 start appwiz.cpl
IF %M%==8 NET VIEW
IF %M%==0 goto start
goto submenu_1


:submenu_2 
echo Submenu_2 
ECHO    
ECHO 1 - Show Disk Space
ECHO 2 - Disk Defrag and Cleanup
ECHO 0 - Back to Main Menu
ECHO.
SET /P M=Type 1, 2, 0, then press ENTER:
IF %M%==1 
IF %M%==2 call Disk_Defrag_and_Cleanup.bat
IF %M%==0 goto start
goto submenu_2


:submenu_3 
echo Submenu_3 
set /p menu_choice="Would you like to run this submenu again (Y) ? " 
if "%menu_choice%"=="Y" goto submenu_3 

:bail