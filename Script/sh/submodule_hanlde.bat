:: ============================================================================= ::
:: 子模块处理 脚本调度器
::
:: 将此脚本和Script目录一起复制到子仓库根目录。
:: 注： 使用 start 方式调用其它脚本
::
:: 存放目录： ./Script/sh 
:: 运行目录： ./Script/sh
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

:: cd跳转当前脚本目录
cd %~dp0

:: 设置根目录路径
set root=%cd%
:: 设置当前脚本路径
set thispath=%~dp0
:: 设置子模块根目录
set SubModuleRoot=source_md

if %debug%==1 echo %0 ------------------------
if %debug%==1 echo  0: %0
if %debug%==1 echo  1: %1
if %debug%==1 echo  2: %2
if %debug%==1 echo  3: %3
if %debug%==1 echo  4: %4
if %debug%==1 echo  5: %5
if %debug%==1 echo  6: %6
if %debug%==1 echo  7: %7
if %debug%==1 echo  8: %8
if %debug%==1 echo  9: %9
if %debug%==1 echo %0 ------------------------


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


echo ------------------------ 调用脚本  ------------------------
:: %1 : 子模块名      (Ajax)
:: /source_md/Ajax
:: 只适用于子模块
:: 注： 使用 start 方式调用其它脚本
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

echo 调用复制钩子脚本...
start Copy_hook_submodule.bat   %1  %2  %3  %4  %5  %6  %7  %8  %9
echo 调用基本信息脚本...
start info.bat   %1  %2  %3  %4  %5  %6  %7  %8  %9
echo 调用子模块稀疏检出脚本...
start submodule_sparse_checkout.bat   %1  %2  %3  %4  %5  %6  %7  %8  %9

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

echo ------------------------ 调用脚本  ------------------------



pause
GOTO:EOF
::exit
