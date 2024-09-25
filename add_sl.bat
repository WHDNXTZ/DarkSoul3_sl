@echo off
set /p use_default="是否使用默认提交信息？(y/n): "
if "%use_default%"=="y" (
    set commit_message=Auto commit: %date% %time%
) else (
    set /p commit_message="请输入提交信息: "
)

set /p use_default_branch="是否从本地 master 分支提交到远程的 master 分支？(y/n): "
if "%use_default_branch%"=="y" (
    git push origin master:master
) else (
    set /p local_branch="请输入本地分支名称: "
    set /p remote_branch="请输入远程分支名称: "
    git push origin %local_branch%:%remote_branch%
)

git add .
git commit -m "%commit_message%"
