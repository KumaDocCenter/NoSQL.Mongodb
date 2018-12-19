:: =================================================================== ::
::  根据配置文件批量处理子模块
::  
::  
:: 存放目录： ./Script/sh 
:: 运行目录： ./Script/sh  
:: 
:: =================================================================== ::

:::::::::::::::: 变量预处理 ::::::::::::::::
:: 关闭回显
@echo off
:: 调试开关
set debug=1
:: 开启变量延迟
setlocal EnableDelayedExpansion
:: 当前文件名
set this=%0
:: 是否为入口文件
set is_index=1
:::::::::::::::: 变量预处理 ::::::::::::::::
if %is_index%==1 (
	:: EQU - 等于
	if "%1" EQU "" (
		goto Debug_Point
	)
)
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



:::::::::::::::: [固定标签调用]示例 ::::::::::::::::
:: Call  此文件名  参数1  参数2 ...
:: 参数1(%1)  参数2(%2) ,以此类推

:::::::::::::::: [指定标签调用]示例 ::::::::::::::::
:: Call  此文件名  函数名  参数1  参数2 ...
:: 参数1(%2)  参数2(%3) ,以此类推

:::::::::::::::: [无标签调用]示例 ::::::::::::::::
:: Call  此文件名    参数1  参数2 ...
:: 参数1(%1)  参数2(%2) ,以此类推

:::::::::::::::: [CallX方式调用]示例 ::::::::::::::::
:: Call  此文件名    参数1  参数2 ...
:: 参数1(%1)  参数2(%2) ,以此类推
:: 参数1格式：File:Label 
:: 			如，b.bat:b_out
:: 参数1格式已在CallX.bat中定义，请通过CallX.bat文件来调用


:::::::::::::::::::::::: 文件头 ::::::::::::::::::::::::
:: [固定标签调用]
::Call :Arr_Length %1 %2 

:: [指定标签调用]
if %is_index%==1 Call :main %1  %2 %3 %4 %5 %6 %7 %8 %9 

:: [无标签调用]
::Call :main %1  %2 %3 %4 %5 %6 %7 %8 %9 

:: [CallX方式调用]
if %is_index%==0 Call :main %1  %2 %3 %4 %5 %6 %7 %8 %9 
:::::::::::::::::::::::: 文件头 ::::::::::::::::::::::::



GOTO:EOF
:: ================================================== ::
:: 函数名称：main							  		  ::
:: 函数功能：外部调用主入口							  ::
:: 函数参数：arg1: (%~1)(%1)函数名称/函数参数1 		  ::
::           arg2: (%~2)(%2)函数参数1/2 			  ::
::           arg3: (%~3)(%3)函数参数2/3 			  ::
::           arg4: (%~4)(%4)函数参数3/4 			  ::
::           arg5: (%~5)(%5)函数参数4/5 			  ::
::           arg6: (%~6)(%6)函数参数5/6 			  ::
::           arg7: (%~7)(%7)函数参数6/7 		      ::
::           arg8: (%~8)(%8)函数参数7/8 			  ::
::           arg9: (%~9)(%9)函数参数8/9 			  ::
:: ================================================== ::
:main
if %debug%==1 echo %~0 ------------------------
if %debug%==1 echo  %~0_0: %~0
if %debug%==1 echo  %~0_1: %~1
if %debug%==1 echo  %~0_2: %~2
if %debug%==1 echo  %~0_3: %~3
if %debug%==1 echo  %~0_4: %~4
if %debug%==1 echo  %~0_5: %~5
if %debug%==1 echo  %~0_6: %~6
if %debug%==1 echo  %~0_7: %~7
if %debug%==1 echo  %~0_8: %~8
if %debug%==1 echo  %~0_9: %~9
if %debug%==1 echo %~0 ------------------------

::::::::::::::: 调度解析 ::::::::::::::: 
:: NEQ - 不等于 (参数%1不等于空)
if "%1" NEQ "" (	
	for /f "tokens=1,2  delims=:" %%a in ( "%1" ) do (
		set calldest=%%a
		set calllabel=%%b
	)
	if %debug%==1 echo calldest : !calldest!
	if %debug%==1 echo calllabel : !calllabel!

	:: EQU - 等于  (调用目标==当前)
	if "!calldest!" EQU "%this%"  (
		Call :!calllabel!  %2 %3 %4 %5 %6 %7 %8 %9 
		GOTO:EOF
	) else (
		GOTO:EOF
	)
)
::::::::::::::: 调度解析 ::::::::::::::: 
GOTO:EOF

:Debug_Point
:: 此文件为入口文件
:: 通常需要 set this=%0
echo.
::echo 场景1：a.bat 调用 b.bat 中的标签 b_out
::call CallX.bat  "source=%this%;destination=b.bat;label=b_out"  参数1  参数2  参数3  参数4  参数5  参数6  参数7  参数8  
echo.
::echo 场景2：a.bat 调用 a.bat 中的标签 b_out
::call CallX.bat  "source=%this%;destination=a.bat;label=b_out"  参数1  参数2  参数3  参数4  参数5  参数6  参数7  参数8  
echo.
::echo 场景3：a.bat 调用  中的标签 b_out
::call CallX.bat  "source=%this%;destination=;label=b_out"  参数1  参数2  参数3  参数4  参数5  参数6  参数7  参数8  




:::::::::::: 根据配置文件批量处理子模块 ::::::::::::
set spath=.git\myconf\submodule\staged
set dpath=.git\myconf\submodule\ok

call CallX.bat  "source=%this%;destination=submodule.bat;label=submodule_s"  %spath%  %dpath%
cd %~dp0
GOTO:EOF
:::::::::::: 根据配置文件批量处理子模块 ::::::::::::



GOTO:EOF
:b_out
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
GOTO:EOF
