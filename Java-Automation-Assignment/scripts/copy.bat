@echo off
echo Copying JAR file to shared folder...

IF NOT EXIST ..\shared (
    mkdir ..\shared
)

copy ..\build\jar\App.jar ..\shared\App.jar

IF %ERRORLEVEL% EQU 0 (
    echo JAR successfully copied!
) ELSE (
    echo Failed to copy JAR!
    exit /b 1
)

pause 