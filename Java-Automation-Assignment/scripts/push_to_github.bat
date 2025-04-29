@echo off
echo -----------------------------------------------------
echo Pushing archive file to GitHub...
echo -----------------------------------------------------
cd
REM Move to Java-Automation-Assignment folder
cd ..

cd

REM Now you are inside Java-Automation-Assignment (No need for another cd)

REM Set important paths
set ARCHIVE_DIR=archives
set DEST_DIR=..\Build-Archieves

REM Read the PAT passed from Jenkins
set GITHUB_PAT=%1

REM Set GitHub URL using username and PAT
set GITHUB_URL=https://Pratik-09pp:%GITHUB_PAT%@github.com/Pratik-09pp/Jenkins-Automation-A-1.git

cd


REM Find the zip file (assuming only one zip file)
for %%f in (%ARCHIVE_DIR%\*.zip) do set ZIP_FILE=%%f

REM Copy the zip file to Build-Archieves folder
copy "%ZIP_FILE%" "%DEST_DIR%"

REM Stage the copied file for commit
git add "../Build-Archieves/%~nxZIP_FILE%"

REM Commit the change
git commit -m "Add new build archive: %~nxZIP_FILE%"

REM Push to GitHub
git push %GITHUB_URL% main


cd

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
