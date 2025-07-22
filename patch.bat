@echo off
setlocal

set "patch_directory=patches"
set "project_directory=qbittorrent"

where git > nul 2>&1
if %errorlevel% neq 0 (
    echo Error: "git" command not found
    exit /b
)

if not exist "%patch_directory%" (
    echo Error: "%patch_directory%" folder not found
    exit /b
)

if not exist "%project_directory%" (
    echo Error: "%project_directory%" folder not found
    exit /b
)

pushd "%project_directory%"

for %%F in ("..\%patch_directory%\*.patch") do (
    echo Applying %%~nxF
    git apply --ignore-space-change --ignore-whitespace "%%F"
)

popd
endlocal
