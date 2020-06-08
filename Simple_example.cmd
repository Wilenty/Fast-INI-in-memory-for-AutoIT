@echo off
title %~n0
mode con lines=3000
call "%~dpn0.exe" "%~1"
echo. return: %errorlevel%
pause