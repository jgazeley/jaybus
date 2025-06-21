@echo off

if not exist "build" mkdir build

REM single‐line compile & link:
xc8-cc.exe -mcpu=18f1320 -O1 -Wall -Ihal app\main.c hal\hal_pic18f.c -o build\main.elf

echo.
echo Build command finished.
pause
