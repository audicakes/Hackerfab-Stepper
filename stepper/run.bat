@echo off
:: HackerFab Stepper – Windows launcher
:: Double-click this file to start the application.
title HackerFab Stepper

:: Run the PowerShell launcher (handles uv install + dependency sync)
powershell -ExecutionPolicy Bypass -File "%~dp0run.ps1"

:: Keep the window open if something went wrong
if %ERRORLEVEL% neq 0 (
    echo.
    echo  Something went wrong. See the error above.
    pause
)
