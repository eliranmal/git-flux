@echo off
setlocal
if not "%~1"=="" set GIT_HOME=%~f1
if "%GIT_HOME%"=="" call :FindGitHome "git.cmd"

if exist "%GIT_HOME%" goto :GitHomeOK

echo MsysGit installation directory not found.>&2
echo Try to give the directory name on the command line:>&2
echo   %0 "%ProgramFiles%\Git"
endlocal
exit /B 1

:GitHomeOK
set ERR=0

setlocal
set REPO_URL="http://lpgithub.dev.lprnd.net/UI-Group/le-ui-gitflow.git"
set REPO_NAME="le-ui-gitflow"
if exist "%~dp0\%REPO_NAME%" goto :RepoOk
call git clone "%REPO_URL%" "%REPO_NAME%" || set ERR=1
endlocal

:RepoOk
set ERR=0

echo Installing GitLE into "%GIT_HOME%\usr\bin"...

if not exist "%GIT_HOME%\usr\bin\git-le" goto :Install
echo GitLE is already installed.>&2
set /p mychoice="Do you want to replace it? [y/n] "
if "%mychoice%"=="y" goto :DeleteOldFiles
goto :Abort

:DeleteOldFiles
echo Deleting old files...
for /F %%i in ("%GIT_HOME%\usr\bin\git-le*") do if exist "%%~fi" del /F /Q "%%~fi"
for /F %%i in ("%GIT_HOME%\usr\bin\gitle-*") do if exist "%%~fi" del /F /Q "%%~fi"

:Install
echo Copying files...
xcopy "%~dp0\%REPO_NAME%\git-le"                     "%GIT_HOME%\usr\bin"                 /Y /R /F
if errorlevel 4 if not errorlevel 5 goto :AccessDenied
if errorlevel 1 set ERR=1
xcopy "%~dp0\%REPO_NAME%\commands\git-le*"           "%GIT_HOME%\usr\bin"                 /Y /R /F || set ERR=1
xcopy "%~dp0\%REPO_NAME%\commands\gitle-*"           "%GIT_HOME%\usr\bin"                 /Y /R /F || set ERR=1

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