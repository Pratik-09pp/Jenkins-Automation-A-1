@echo off
REM ==========================================
REM Clean previous JARs
echo Cleaning old jar files...
rmdir /S /Q ..\build\jar
mkdir ..\build\jar

REM ==========================================
REM Create the JAR
echo Creating JAR file...
cd ..\build\classes
jar cfe ..\jar\App.jar App *.class
cd ..\..\scripts

IF exist ..\build\jar\App.jar (
    echo Packaging Successful!
) ELSE (
    echo Packaging Failed!
    exit /b 1
)



pause 