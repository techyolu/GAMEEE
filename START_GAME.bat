@echo off
echo ==========================================
echo   Letter Boxed Game - Local Server
echo ==========================================
echo.

:: Check if Python is available
python --version >nul 2>&1
if %errorlevel% == 0 (
    echo Python mila! Server shuru ho raha hai...
    echo.
    echo Browser mein yeh address khulega:
    echo   http://localhost:8000
    echo.
    echo Server band karne ke liye: Ctrl+C dabayein
    echo.
    start "" http://localhost:8000
    python -m http.server 8000
    goto end
)

:: Try python3
python3 --version >nul 2>&1
if %errorlevel% == 0 (
    echo Python3 mila! Server shuru ho raha hai...
    echo.
    echo Browser mein yeh address khulega:
    echo   http://localhost:8000
    echo.
    start "" http://localhost:8000
    python3 -m http.server 8000
    goto end
)

:: Python nahi mila - Node.js try karo
node --version >nul 2>&1
if %errorlevel% == 0 (
    echo Node.js mila! Server shuru ho raha hai...
    echo.
    start "" http://localhost:8000
    node server.js
    goto end
)

:: Kuch nahi mila
echo.
echo ERROR: Python ya Node.js install nahi hai!
echo.
echo Python install karein: https://www.python.org/downloads/
echo (Install karte waqt "Add Python to PATH" zaroor tick karein)
echo.
pause
:end
