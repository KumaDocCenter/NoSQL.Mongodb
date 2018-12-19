:: =================================================================== ::
:: 修复子模块 public 并检出自定义文件
:: 
:: 存放目录： ./Script/sh 
:: 运行目录： ./
::
:: =================================================================== ::
@echo off


:: cd跳转到根目录
cd %~dp0
cd..
cd..
:: 设置根目录路径
set root=%cd%

echo gitdir: ../.git/modules/public>%root%\public\.git

cd  public

:: 检出自定义文件
git checkout .gitignore
git checkout README.md
git checkout CNAME

cd %~dp0