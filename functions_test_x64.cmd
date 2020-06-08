@echo off
title %~n0
mode con lines=3000
call "%~dpn0.exe"
echo. return: %errorlevel%
pause