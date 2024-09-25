@echo off
set repo_path=C:\Users\86188\AppData\Roaming\DarkSoulsIII
cd /d "%repo_path%" || (
    echo Unable to find the specified path.
    exit /b
)
echo Welcome to the Dark Souls cloud save auto commit script!
set /p use_default="Do you want to use the default commit message? (y/n): "
if "%use_default%"=="y" (
    set commit_message=Auto commit: %date% %time%
) else (
    set /p commit_message="Please enter the commit message: "
)

set /p use_default_branch="Do you want to push from the local master branch to the remote master branch? (y/n): "
if "%use_default_branch%"=="y" (
    git push origin master:master
) else (
    set /p local_branch="Please enter the local branch name: "
    set /p remote_branch="Please enter the remote branch name: "
    git push origin %local_branch%:%remote_branch%
)

git add .
git commit -m "%commit_message%"

pause
