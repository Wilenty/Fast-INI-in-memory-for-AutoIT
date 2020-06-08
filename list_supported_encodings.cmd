@echo off
title %~n0
call "%~dpn0.exe"
echo. return: %errorlevel%
pause