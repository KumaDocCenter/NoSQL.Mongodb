:: =================================================================== ::
::  输出md文件的YAML代码块
:: 
:: 存放目录： ./Script/sh 
:: 运行目录： ./  
:: 
:: =================================================================== ::

@echo off
:: 调试开关
set debug=0

:: 开启变量延迟
setlocal enabledelayedexpansion

:: cd跳转到根目录(因为当前存放目录：./Script/sh，所以需要更改)
cd %~dp0
cd..
cd..
:: 设置根目录路径
set root=%cd%
:: 设置当前脚本路径
set thispath=%~dp0



:: 调用
call :YAML_write_in  doc\md
GOTO:EOF

GOTO:EOF
:: ================================================== ::
:: 函数名称：YAML_write_in						  	  ::
:: 函数功能：YAML格式写入到md文件 					  ::
:: 函数参数：arg1: 相对路径						 	  ::
::           	   待处理的md文件路径	  			  ::
::           	   如，doc\md	  			  		  ::
::           							 			  ::
:: 返回值：          							      ::
::        								   			  ::
:: ================================================== ::
:YAML_write_in
if %debug%==1 echo Localtion: %this%: %~0 .................
if %debug%==1 echo ---arg0: %~0 
if %debug%==1 echo ---arg1: %~1 
if %debug%==1 echo ---arg2: %~2 
if %debug%==1 echo ---arg3: %~3 
if %debug%==1 echo ---arg4: %~4 
if %debug%==1 echo ---arg5: %~5
if %debug%==1 echo ---arg6: %~6 
if %debug%==1 echo ---arg7: %~7 
if %debug%==1 echo ---arg8: %~8
if %debug%==1 echo ---arg9: %~9
if %debug%==1 echo Localtion: %this%: %~0 .................

:: 调用日期时间函数
call :DateTime 
if %debug%==1 echo 当前日期时间：%datetime%
if %debug%==1 echo 当前周：%week%
if %debug%==1 echo 时间戳：%timestamp%


set yaml=%~dp0YAML

:: YAML临时文件存在则删除
if exist %yaml%.tmp  del %yaml%.tmp

:: 遍历特定的文件
for /f "usebackq tokens=*" %%a in (`dir /a/b/s %~1\*.md`) do (
	if %debug%==1 echo [file: %%a ][filename: %%~na ]
	
	
	REM 解析YAML格式中的变量
	REM 读取当前目录下的YAML文件的每行	
	for /f "tokens=*" %%i in (%yaml%) do (
		if %debug%==1 echo [YAML_line: %%i ]
		set "line=%%i"		
		REM -----------------变量解析---------------------::
		call :ReplaceStr  line  {{date}}  "%datetime%"
		call :ReplaceStr  line  {{title}}  "%%~na"
		call :ReplaceStr  line  {{dot}}  .
		REM -----------------变量解析---------------------::
		:: 输出YAML到临时文件
		echo !line!>>%yaml%.tmp
	)
	echo.>>%yaml%.tmp
	
	:: 文件合并
	REM copy /y YAML.tmp/a + "%%a"/a  "%%a.tmp"
	:: 因编码格式问题无法解决，更改为只输出，请手动复制
	copy /y %yaml%.tmp   %%a.YAML
	
	:: 文件重命名
	REM set "bakname=%%~nxa.%timestamp%.bak"
	REM ren  "%%a"   "!bakname!"
	REM ren  "%%a.tmp"   "%%~nxa"
	:: 删除YAML临时文件
	del %yaml%.tmp
	:: 提示信息
	REM echo  [ %%a ]文件已备份为[ !bakname! ]
	echo 输出文件 [ %%a.YAML ]
	echo.
)
GOTO:EOF



GOTO:EOF
:: ================================================== ::
:: 函数名称：ReplaceStr						  	 	  ::
:: 函数功能：字符串替换			 					  ::
:: 函数参数：arg1: 包含字符串的变量				 	  ::
::           arg2: 旧字符串 			  			  ::
::           arg3: 新字符串 			  			  ::
::           							 			  ::
:: 返回值：          							      ::
::        %~1  ： 更改arg1				   			  ::
:: ================================================== ::
:ReplaceStr
if %debug%==1 echo Localtion: %this%: %~0 .................
if %debug%==1 echo ---arg0: %~0 
if %debug%==1 echo ---arg1: %~1 
if %debug%==1 echo ---arg2: %~2 
if %debug%==1 echo ---arg3: %~3 
if %debug%==1 echo ---arg4: %~4 
if %debug%==1 echo ---arg5: %~5
if %debug%==1 echo ---arg6: %~6 
if %debug%==1 echo ---arg7: %~7 
if %debug%==1 echo ---arg8: %~8
if %debug%==1 echo ---arg9: %~9
if %debug%==1 echo Localtion: %this%: %~0 .................

set str=!%~1!
:: NEQ - 不等于 
if "%~1" NEQ "" (
	set "%~1=!str:%~2=%~3!"
)
::echo !%~1!
GOTO:EOF


GOTO:EOF
:: ================================================== ::
:: 函数名称：DateTime							  	  ::
:: 函数功能：简易日期时间和时间戳					  ::
:: 函数参数：arg1: 日期分隔符				 		  ::
::           							 			  ::
:: 返回值：          							      ::
::        %datetime%  ： 当前日期时间   			  ::
::        				 如 2018-12-10 21:43:58  	  ::
::            %week%  ： 当前周    					  ::
::           			 如 周一    				  ::
::       %timestamp%  ： 简易时间戳 				  ::
::           			 如 20181207180016    		  ::
:: ================================================== ::
:DateTime
if %debug%==1 echo Localtion: %this%: %~0 .................
if %debug%==1 echo ---arg0: %~0 
if %debug%==1 echo ---arg1: %~1 
if %debug%==1 echo ---arg2: %~2 
if %debug%==1 echo ---arg3: %~3 
if %debug%==1 echo ---arg4: %~4 
if %debug%==1 echo ---arg5: %~5
if %debug%==1 echo ---arg6: %~6 
if %debug%==1 echo ---arg7: %~7 
if %debug%==1 echo ---arg8: %~8
if %debug%==1 echo ---arg9: %~9
if %debug%==1 echo Localtion: %this%: %~0 .................

if %debug%==1 echo ------------------------ 简易日期时间和时间戳  ----------------------

:: EQU - 等于
if "%~1" EQU "" (
	set delim=-
) else (
	set delim=%~1
)

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
GOTO:EOF


