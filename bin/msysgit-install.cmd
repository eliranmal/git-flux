@echo off
setlocal
if not "%~1"=="" set GIT_HOME=%~f1
if "%GIT_HOME%"=="" call :FindGitHome "git.cmd"

if not exist "%GIT_HOME%" set GIT_HOME="%ProgramFiles%\Git"

if exist "%GIT_HOME%" goto :GitHomeOK
endlocal

:GitHomeOK
set ERR=0

echo Installing git-le into "%GIT_HOME%"...

if not exist "%GIT_HOME%\usr\bin\git-le" goto :Install
echo GitLE is already installed.>&2
set /p mychoice="Do you want to replace it [y/n]"
if "%mychoice%"=="y" goto :DeleteOldFiles
goto :Abort

:DeleteOldFiles
echo Deleting old files...
for /F %%i in ("%GIT_HOME%\git-le*") do if exist "%%~fi" del /F /Q "%%~fi"

:Install
echo Copying files...
xcopy "%~dp0\..\git-le"            "%GIT_HOME%\usr\bin"                 /Y /R /F
if errorlevel 4 if not errorlevel 5 goto :AccessDenied
if errorlevel 1 set ERR=1
xcopy "%~dp0\..\git-le*"           "%GIT_HOME%\usr\bin"                 /Y /R /F || set ERR=1

if %ERR%==1 choice /T 30 /C Y /D Y /M "Some unexpected errors happened. Sorry, you'll have to fix them by yourself."

:End
endlocal & exit /B %ERR%
goto :EOF

:AccessDenied
set ERR=1
echo.
echo You should run this script with "Full Administrator" rights:>&2
echo - Right-click with Shift on the script from the Explorer>&2
echo - Select "Run as administrator">&2
choice /T 30 /C YN /D Y /N >nul
goto :End

:Abort
echo Installation canceled.>&2
set ERR=1
goto :End

:FindGitHome
setlocal
set GIT_CMD_DIR=%~dp$PATH:1
if "%GIT_CMD_DIR%"=="" endlocal & goto :EOF
endlocal & set GIT_HOME=%GIT_CMD_DIR:~0,-5%
goto :EOF