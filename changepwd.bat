@echo off 
cd  %~dp0
set name = admin
set pwd = admin

setlocal enabledelayedexpansion 
for /f "tokens=1,2 delims=:" %%i in (pwd.txt) do (
REM echo %%i
REM echo %%j
set name=%%i
set pwd=%%j
net user %%i >nul 2>nul && goto set || goto add
)

:set
echo set
@net user !name! !pwd!  
goto end

:add
echo add
@net user !name! !pwd! /add /active:yes
net localgroup administrators !name! /add
goto end

:end
pause
REM echo exit
REM echo !nam!
REM echo !pwd!
REM exit