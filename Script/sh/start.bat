@echo off
:: 开启变量延迟
setlocal enabledelayedexpansion
:: 调试开关
set debug=0

cd %~dp0

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
echo 日期时间："%datetime%"

:: 日期时间 戳( 20181207180016 )
set deti=%de%%ti%
:::: 去除所有空格
set timestamp=%deti: =%
echo 时间戳："%timestamp%"

if %debug%==1 echo ------------------------ 简易日期时间和时间戳  ----------------------


:: 判断脚本所在路径，Script\sh\或仓库根目录
if exist init.bat (
	REM 跳转到仓库根目录(当前脚本路径为 Script\sh\)
	cd.. 
	cd..  

	REM 设置根目录路径
	set root=!cd!
	REM 设置当前脚本路径
	set thispath=%~dp0

	REM 跳转到上级目录
	cd..
	REM 备份目录
	xcopy !root!\*  !root!.bak\  /eiy

	REM 删除文件
	rd  /s/q !root!.bak\Script
	del /f/s/q !root!.bak\start.bat
	
	REM 输出备份信息
	echo 备份目录：!root! >!root!.bak\back.log
	echo 备份时间：%datetime% >>!root!.bak\back.log
	echo ------------------------------------------------------------ >>!root!.bak\back.log
	echo.  >>!root!.bak\back.log
	tree /f  !root!.bak  >>!root!.bak\back.log
	
	REM 跳转到当前脚本路径
	cd !thispath!

	REM 调用脚本	
	start init.bat
	
	REM 退出脚本
	exit
) else (
	REM 设置根目录路径
	set root=!cd!
	REM 设置当前脚本路径
	set thispath=%~dp0

	REM 跳转到上级目录
	cd..
	REM 备份目录
	xcopy !thispath!*  !root!.bak\  /eiy

	REM 删除文件
	rd  /s/q !root!.bak\Script
	del /f/s/q !root!.bak\start.bat
	
	REM 输出备份信息
	echo 备份目录：!root! >!root!.bak\back.log
	echo 备份时间：%datetime% >>!root!.bak\back.log
	echo ------------------------------------------------------------ >>!root!.bak\back.log
	echo.  >>!root!.bak\back.log
	tree /f  !root!.bak  >>!root!.bak\back.log
	
	REM 跳转到当前脚本路径
	cd !thispath!
		
	REM 调用脚本
	start Script\sh\init.bat
	
	REM 删除本脚本并退出
	del %0
	exit
)

