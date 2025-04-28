@echo off
echo -----------------------------------------------------
echo Pushing archive file to GitHub...
echo -----------------------------------------------------

REM Move to project root
cd ..

REM Set the archive folder and destination GitHub subfolder
set ARCHIVE_DIR=archives
set GITHUB_SUBFOLDER=Java-Automation-Assignment/Build-Archieves

REM Read the PAT passed from Jenkins
set GITHUB_PAT=%1

REM Set the GitHub URL using username and dynamic PAT
set GITHUB_URL=https://<your-username>:%GITHUB_PAT%@github.com/Pratik-09pp/Jenkins-Automation-A-1.git

REM Check if .git exists
IF NOT EXIST .git (
    echo Not a Git repository! Exiting...
    exit /b 1
)

REM Assuming only one zip file in archives
for %%f in (%ARCHIVE_DIR%\*.zip) do set ZIP_FILE=%%f

REM Add the file to Git
git add %ARCHIVE_DIR%\%~nxZIP_FILE%

REM Commit the change
git commit -m "Add new build archive %~nxZIP_FILE%"

REM Push the change
git push %GITHUB_URL% main

IF %ERRORLEVEL% EQU 0 (
    echo Archive pushed successfully to GitHub!
) ELSE (
    echo Failed to push archive to GitHub!
    exit /b 1
)

REM Return to scripts
cd scripts

echo -----------------------------------------------------
echo GitHub push step completed!
echo -----------------------------------------------------

pause 