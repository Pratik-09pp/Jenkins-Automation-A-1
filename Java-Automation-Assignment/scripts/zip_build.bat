@echo off
echo Zipping build folder...

:: Check if the archive folder exists, and delete it if it does, then create a new one
IF EXIST ..\archives (
    rmdir /s /q ..\archives
)
mkdir ..\archives

:: Get the current timestamp and format it (replace ":" with "-" and remove leading/trailing spaces)
set timestamp=%DATE%_%TIME%
set timestamp=%timestamp:/=-%
set timestamp=%timestamp::=-%
set timestamp=%timestamp: =%

:: Create the zip file with the timestamp in its name using 7-Zip
7z a ..\archives\build_archive_%timestamp%.zip ..\build\*

:: Check if the zipping was successful
IF %ERRORLEVEL% EQU 0 (
    echo Build folder zipped successfully!
) ELSE (
    echo Failed to zip the folder!
    exit /b 1
)

pause
