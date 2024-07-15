@echo off
cd /d %~dp0
setlocal

:menu
echo Select host architecture:
echo 1. 64-bit
echo 2. 32-bit
set /p choice=Enter option (1 or 2):

if "%choice%"=="1" (
    goto copy_x64
) else if "%choice%"=="2" (
    goto copy_x86
) else (
    echo Invalid choice, please choose again.
    goto menu
)

:copy_x64
echo Copying x64 files to bin directory...
copy /y "src\cbsexploder\x64\Release\*.exe" "bin\"
copy /y "src\sxsfounder\x64\Release\*.exe" "bin\"
if errorlevel 1 (
    echo File copy failed.
    pause >nul
    goto end
)
goto end

:copy_x86
echo Copying x86 files to bin directory...
copy /y "src\cbsexploder\Release\*.exe" "bin\"
copy /y "src\sxsfounder\Release\*.exe" "bin\"
if errorlevel 1 (
    echo File copy failed.
    pause >nul
    goto end
)
goto end

:end
endlocal