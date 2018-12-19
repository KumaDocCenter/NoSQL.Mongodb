:: ============================================================================= ::
:: 子模块稀疏检出
::
:: 将此脚本和Script目录一起复制到子仓库根目录。
:: 注： 当前脚本所在目录需要有 sparse-checkout 文件
::
:: 存放目录： ./Script/sh 
:: 运行目录： ./
:: 
:: 必须参数： 
:: %1 : 子模块名      (Ajax)
:: ============================================================================= ::

:: 关闭回显
@echo off
:: 开启变量延迟
setlocal enabledelayedexpansion
:: 调试开关
set debug=0

:: cd跳转到根目录(因为当前存放目录：./Script/sh，所以需要更改)
cd %~dp0
cd..
cd..
:: 设置根目录路径
set root=%cd%
:: 设置当前脚本路径
set thispath=%~dp0
:: 设置子模块根目录
set SubModuleRoot=source_md

if %debug%==1 echo ------------------------ 简易日期时间和时间戳  ----------------------

:: 日期分隔符
set delim=-

:: 日期处理( 2018-12-10 )
for /f "tokens=1-4  delims=/ " %%a in ("%date%") do (
	set _de=%%a%delim%%%b%delim%%%c
	set de=%%a%%b%%c
	set week=%%d
)
:: 时间处理( 21:43:58 )
for /f "tokens=1-4  delims=:." %%a in ("%time%") do (
	set _ti=%%a:%%b:%%c
	set ti=%%a%%b%%c
)

:: 当前日期时间( 2018-12-10 21:43:58 )
set "datetime=%_de% %_ti%"
if %debug%==1 echo "%datetime%"

:: 日期时间 戳( 20181207180016 )
set deti=%de%%ti%
:::: 去除所有空格
set timestamp=%deti: =%
if %debug%==1 echo "%timestamp%"

if %debug%==1 echo ------------------------ 简易日期时间和时间戳  ----------------------



REM 稀疏检出
REM  git config core.sparsecheckout true
REM  echo "path1/" >> .git/info/sparse-checkout
REM  echo "path2/" >> .git/info/sparse-checkout
REM  git checkout master

echo ------------------------ 复制 sparse-checkout  ------------------------
:: %1 : 子模块名      (Ajax)
:: 只适用于子模块
:: .git/modules/source_md/Ajax
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
:: 设置文件名称
set filename=sparse-checkout
:: 存在则备份
if exist ".git\modules\%SubModuleRoot%\%1\info\%filename%"  (
 	ren .git\modules\%SubModuleRoot%\%1\info\%filename%   %filename%.%timestamp%
)
:: 复制文件
REM %~dp0 : K:\...\Script\sh\ 
xcopy  %~dp0%filename%   .git\modules\%SubModuleRoot%\%1\info\  /Y
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

echo ------------------------ 复制 sparse-checkout  ------------------------


echo ------------------------ 启用 sparse-checkout 并检出分支 ------------------------

:: 跳转到子模块工作目录
cd %SubModuleRoot%\%1
echo cd: %cd%
:: 启用 sparse-checkout 
git config core.sparsecheckout true
:: 检出分支
git checkout master

echo ------------------------ 启用 sparse-checkout 并检出分支 ------------------------

pause
GOTO:EOF
::exit
