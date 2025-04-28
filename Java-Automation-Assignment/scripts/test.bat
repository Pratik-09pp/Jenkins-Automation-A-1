@echo off
REM ==========================================
REM Create reports directory
echo Preparing reports folder...
rmdir /S /Q ..\build\reports
mkdir ..\build\reports

REM ==========================================
REM Run JUnit tests
echo Running JUnit tests...

java -cp "..\lib\junit-4.13.2.jar;..\lib\hamcrest-core-1.3.jar;..\build\classes;..\build\test-classes" org.junit.runner.JUnitCore AppTest > ..\build\reports\test-report.txt

REM ==========================================
REM Show test result
type ..\build\reports\test-report.txt

IF %ERRORLEVEL% EQU 0 (
    echo Tests Passed Successfully!
) ELSE (
    echo Some Tests Failed!
    exit /b 1
)

pause