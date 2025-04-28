@echo off
REM ==========================================
REM Clean previous compiled files
echo Cleaning old build folders...
rmdir /S /Q ..\build\classes
mkdir ..\build\classes

REM ==========================================
REM Compile application code
echo Compiling main Java source files...
javac -d ..\build\classes ..\src\main\App.java

REM ==========================================
REM Compile test code
echo Compiling test Java source files...
rmdir /S /Q ..\build\test-classes
mkdir ..\build\test-classes
javac -cp "..\lib\junit-4.13.2.jar;..\lib\hamcrest-core-1.3.jar;..\build\classes" -d ..\build\test-classes ..\src\test\AppTest.java

IF %ERRORLEVEL% EQU 0 (
    echo Compilation Successful!
) ELSE (
    echo Compilation Failed!
    exit /b 1
)


pause 