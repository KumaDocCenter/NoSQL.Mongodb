:: =================================================================== ::
::  检出public数据库并复制到仓库根目录public下
:: 
:: 存放目录： ./Script/sh 
:: 运行目录： ./
::
:: =================================================================== ::
@echo off

:: 设置文件夹名称
set DestDirName=public

:: 设置远程仓库
set git=https://github.com/KumaNNN/KumaNNN.github.io.git

:: cd跳转到根目录
cd %~dp0
cd..
cd..

:: 设置根目录路径
set root=%cd%


:: 目录不存在则创建
if not exist ".git/temp"  mkdir ".git/temp"
cd .git/temp
::::::::::::::::::::仓库处理::::::::::::::::::::::::::::::::::::::
if not exist "%DestDirName%/.git" (
	echo 克隆远程仓库...
	git clone %git%  %DestDirName%
	
	echo 备份 .git 目录... 
	xcopy "%DestDirName%/.git"  "%DestDirName%_temp/.git"  /Y/I/E
	
	echo 删除原 目标文件夹
	::/s:删除文件夹及其所有子目录和文件。/q:安静模式
	rd /s/q %DestDirName%	
	
	echo 重命名目录...
	ren %DestDirName%_temp  %DestDirName%
	echo.
) else (
	cd %DestDirName%
	
	echo 抓取远程仓库信息...
	git fetch %git% 
)
::::::::::::::::::::仓库处理::::::::::::::::::::::::::::::::::::::

:: cd 回根目录
cd %root%

:: 复制 .git 目录到指定目录(仓库根目录/同名目录/.git)
xcopy ".git/temp/%DestDirName%/.git"  "%DestDirName%/.git"  /Y/I/E

cd  public

:: 检出自定义文件
git checkout .gitignore
git checkout README.md
git checkout CNAME

GOTO:EOF
