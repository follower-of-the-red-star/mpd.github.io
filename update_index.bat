@echo off
setlocal enabledelayedexpansion

set "OUTPUT_FILE=file-index.js"
set "DATA_FOLDER=data"

if exist "%OUTPUT_FILE%" del "%OUTPUT_FILE%"

:: Write the assignment to window object
echo window.FILE_INDEX = [ > "%OUTPUT_FILE%"

set first=1
set "line="

for %%F in ("%DATA_FOLDER%\*.txt") do (
    set "filename=%%~nxF"
    if !first!==1 (
        set "line=  "!filename!""
        set first=0
    ) else (
        set "line=!line!, "!filename!""
    )
)

if !first!==1 (
    echo   // No .txt files found >> "%OUTPUT_FILE%"
) else (
    echo !line! >> "%OUTPUT_FILE%"
)

echo ]; >> "%OUTPUT_FILE%"

echo File index written to %OUTPUT_FILE%
if %first%==1 echo Warning: No .txt files found in %DATA_FOLDER%\