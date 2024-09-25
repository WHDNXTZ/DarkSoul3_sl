#!/bin/bash

# 询问是否使用默认提交信息
read -p "是否使用默认提交信息？(y/n): " use_default

if [ "$use_default" == "y" ]; then
    commit_message="Auto commit: $(date +'%Y-%m-%d %H:%M:%S')"
else
    read -p "请输入提交信息: " commit_message
fi

# 询问是否默认从 master 分支提交到远程的 master 分支
read -p "是否从本地 master 分支提交到远程的 master 分支？(y/n): " use_default_branch

if [ "$use_default_branch" == "y" ]; then
    git push origin master:master
else
    read -p "请输入本地分支名称: " local_branch
    read -p "请输入远程分支名称: " remote_branch
    git push origin "$local_branch":"$remote_branch"
fi

# 添加更改并提交
git add .
git commit -m "$commit_message"
