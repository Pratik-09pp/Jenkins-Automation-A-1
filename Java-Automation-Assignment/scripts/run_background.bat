@echo off
echo Running JAR as background process and saving logs...

IF NOT EXIST ..\build\logs (
    mkdir ..\build\logs
)

start /B java -jar ..\shared\App.jar > ..\build\logs\app.log 2>&1

echo App is running in background. Logs are being written to build\logs\app.log


pause 