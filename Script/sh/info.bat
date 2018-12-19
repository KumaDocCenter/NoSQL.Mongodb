:: ============================================================================= ::
:: 仓库配置信息
::
:: 将此脚本和Script目录一起复制到子仓库根目录。
:: 注： 通常情况，此脚本运行完毕会删除自身
::
:: 存放目录： ./Script/sh 
:: 运行目录： ./ 
:: 
:: 在sh目录以外，都会删除脚本自身
:: ============================================================================= ::

:: 关闭回显
@echo off
:: 开启变量延迟
setlocal EnableDelayedExpansion

:: 设置子模块根目录
set SubModuleRoot=source_md

:: 先跳转到脚本目录
cd %~dp0

REM %~dp0 : K:\...\Script\sh\ 
:: 被调用(存放目录：./Script/sh)
:: NEQ - 不等于 (参数%1不等于空)
if "%1" NEQ "" (
	cd..
	cd..
	xcopy  %~dp0%0  %SubModuleRoot%\%1\  /Y	
	start  %SubModuleRoot%\%1\info.bat
	exit
)


:: 获取目录名  EQU - 等于
:: 如果当前脚本目录是public，则目录名为自定义
:: 如果当前脚本目录是sh(存放目录：./Script/sh)，则2次cd且目录名为cd所在
:: 如果当前脚本目录是其它，则目录名为当前目录
for %%a in ("%~dp0\.") do ( 
	REM 当前目录=public
	if "%%~na" EQU "public" (
		REM 设置目录名为自定义
		set dirname=KumaNNN.github.io
		REM 设置删除开关
		set dd=1
	) else (
		REM 当前目录=sh(存放目录：./Script/sh)
		if "%%~na" EQU "sh" (
			REM  2次cd
			cd..
			cd..
			REM 设置目录名为cd所在
			for %%i in ("!cd!\.") do (
			  set dirname=%%~ni
			)	
		) else (
			REM 当前目录=其它
			REM 设置目录名为当前目录
			set dirname=%%~na
			REM 设置删除开关
			set dd=1
		)
	) 
)
echo 目录名: !dirname! 


if not exist .git (
	echo 没有git数据库，脚本将退出...
	pause
	GOTO:EOF
)


echo ------------------------ 仓库配置  ------------------------ 

echo 配置用户名...
git config user.name "kuma8866"

echo 配置邮箱... 
git config user.email "kuma8866@163.com" 

echo 配置提交缓存...
git config http.postBuffer  524288000   

echo 添加远程仓库...
git remote remove origin
git remote add origin https://github.com/KumaDocCenter/!dirname!.git


echo ------------------------ 仓库配置  ------------------------ 

:: 删除脚本自身
( if "!dd!" EQU "1"   del %~f0  )& exit || exit
