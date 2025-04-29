@echo off
echo -----------------------------------------------------
echo Pushing archive file to GitHub...
echo -----------------------------------------------------

set PATH=%PATH%;C:\Users\pratikp\AppData\Local\Programs\Git\cmd;C:\Users\pratikp\AppData\Local\Programs\Git\bin

REM Set important paths
set "ARCHIVE_DIR=Java-Automation-Assignment\archives"
set "DEST_DIR=Build-Archieves"

REM Read the GitHub Personal Access Token passed from Jenkins
set "GITHUB_PAT=%1"

REM Set GitHub URL using username and PAT
set "GITHUB_URL=https://Pratik-09pp:%GITHUB_PAT%@github.com/Pratik-09pp/Jenkins-Automation-A-1.git"

REM Check if this is a Git repository
if not exist ".git" (
    echo Not a Git repository! Exiting...
    exit /b 1
)

REM Find the zip file inside archives folder (assuming only one zip file)
for %%f in ("%ARCHIVE_DIR%\*.zip") do (
    set "ZIP_FILE=%%f"
    set "ZIP_FILENAME=%%~nxf"
)

REM Copy the zip file to Build-Archieves folder
echo Copying %ZIP_FILE% to %DEST_DIR%...
copy "%ZIP_FILE%" "%DEST_DIR%"


git checkout -B main

REM Stage the copied file for commit
echo Staging file for Git commit...
git add "%DEST_DIR%\%ZIP_FILENAME%"

REM Commit the change
echo Creating Git commit...
git commit -m "Add new build archive: %ZIP_FILENAME%"

REM Push to GitHub
echo Pushing to GitHub...
git push "%GITHUB_URL%" main

IF %ERRORLEVEL% EQU 0 (
    echo Archive pushed successfully to GitHub!
) ELSE (
    echo Failed to push archive to GitHub!
    exit /b 1
)

REM Return back to scripts folder
cd scripts

echo -----------------------------------------------------
echo GitHub push step completed!
echo -----------------------------------------------------

pause
