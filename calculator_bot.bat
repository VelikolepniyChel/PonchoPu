@echo off
setlocal enabledelayedexpansion

:: Простой BAT‑скрипт: периодически проверяет активные TCP‑подключения и,
:: если видит процесс с именем, характерным для VNC (tvnserver, winvnc, tigervnc и т.п.),
:: запускает калькулятор.

:loop
for /f "tokens=5" %%a in ('netstat -ano ^| findstr /i "tvnserver winvnc tigervnc vnc"') do (
    calc.exe
    goto :end
)
timeout /t 5 /nobreak >nul
goto :loop

:end
timeout /t 60 /nobreak >nul
goto :loop