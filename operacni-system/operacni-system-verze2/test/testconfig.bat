@echo off
for /f "tokens=1,2 delims==" %%a in (config.txt) do (
    if %%a==name set %%a=%%b
    if %%a==lastName set %%a=%%b
)

 echo %lastName% > out.txt
