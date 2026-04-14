@echo off
setlocal enabledelayedexpansion

set "OUTPUT_FILE=file-index.js"
set "DATA_FOLDER=data"

if exist "%OUTPUT_FILE%" del "%OUTPUT_FILE%"

:: Write opening line
echo const FILE_INDEX = [ > "%OUTPUT_FILE%"

set first=1
set "list="
for %%F in ("%DATA_FOLDER%\*.txt") do (
    set "filename=%%~nxF"
    if !first!==1 (
        set "list=!list!  "!filename!""
        set first=0
    ) else (
        set "list=!list!, "!filename!""
    )
)

:: Write the list
if !first!==1 (
    echo   // No .txt files found >> "%OUTPUT_FILE%"
) else (
    echo !list! >> "%OUTPUT_FILE%"
)

:: Write closing line
echo ]; >> "%OUTPUT_FILE%"

echo File index written to %OUTPUT_FILE%
if %first%==1 echo Warning: No .txt files found in %DATA_FOLDER%\