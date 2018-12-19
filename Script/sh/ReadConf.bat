:: =================================================================== ::
::  读取配置 
::  根据文件中的配置项进行目录和文件的复制(不包含隐藏文件夹)
::  具体配置前往如下 [变量配置] 块
::
::  作用范围：按需复制
::  		  源根目录-->目标根目录，并保持目录结构
::  依赖文件：conf.bat  CallX.bat 
::
:: 存放目录： ./Script/sh 
:: 运行目录： ./Script/sh
::
:: =================================================================== ::

:::::::::::::::: 变量预处理 ::::::::::::::::
:: 关闭回显
@echo off
:: 调试开关
set debug=0
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




::::::::::::::::::::::变量配置:::::::::::::::::::::::::
:: cd跳转到当前脚本目录
cd %~dp0

:: 工作根目录
set root=%~dp0
:: 路径处理：Script\sh\替换为空
set root=%root:Script\sh\=%

:: 源根目录 
::set source_dir=%root%s
set source_dir=%root%source_md

:: 源末端目录 (%source_dir%\*\%source_mo%)
::set source_mo=c
set source_mo=doc\md

:: 目标根目录 
::set dest_dir=%root%s1
set dest_dir=%root%source\_posts\Dev

:: 设置子模块配置根目录
set SubModuleConfRoot=%root%.git\modules\source_md
::::::::::::::::::::::变量配置:::::::::::::::::::::::::
if %debug%==1 echo shellpath: %~dp0
if %debug%==1 echo root: %root%
if %debug%==1 echo source_dir : %source_dir%
if %debug%==1 echo dest_dir : %dest_dir%



:: 指定目录下的/所有子目录(*)/指定相对路径的特定文件(\c\c.txt)
call CallX.bat  "source=%this%;destination=conf.bat;label=ReadDirRelativePathFile"  "%SubModuleConfRoot%"  "\myconf\copy.conf"  1  %this%:cb03    参数05  参数06  参数07  参数08  参数09

GOTO:EOF
:cb03
if %debug%==1 echo -------------cb03-----------
if %debug%==1 echo 文件绝对路径(arg1): %~1
if %debug%==1 echo 参数(arg2): %~2
if %debug%==1 echo 参数(arg3): %~3
if %debug%==1 echo 参数(arg4): %~4
if %debug%==1 echo 参数(arg5): %~5
if %debug%==1 echo 参数(arg6): %~6
if %debug%==1 echo 参数(arg7): %~7
if %debug%==1 echo 参数(arg8): %~8
if %debug%==1 echo 参数(arg9): %~9
if %debug%==1 echo -------------cb03-----------
if %debug%==1 echo 文件索引: %~2
if %debug%==1 echo 文件计数: %~3

:: 调用函数读取配置项
call CallX.bat "source=%this%;destination=conf.bat;label=ConfRead"  "%~1"  %this%:ccb  %~2
		
GOTO:EOF


GOTO:EOF
:ccb
if %debug%==1 echo ------------ccb--------------
if %debug%==1 echo status : !status!
if %debug%==1 echo dirname : %dirname%
if %debug%==1 echo 自增量: %~1
if %debug%==1 echo 文件路径: %~2
if %debug%==1 echo source_dir : %source_dir%
if %debug%==1 echo dest_dir : %dest_dir%


::EQU - 等于
if "%status%" EQU "1" (
	if %debug%==1 echo ----source: !source_dir!\%dirname% 
	if %debug%==1 echo ------dest: !dest_dir!\%dirname%
	:: 复制目录及其文件  并修改配置信息
	xcopy !source_dir!\%dirname%\%source_mo%  !dest_dir!\%dirname%  /E/Y/I  && (
		echo 源目录 [ %dirname% ] 复制成功
		echo.
		echo status=^0>%~2
		echo dirname=^%dirname%>>%~2
	)
)
if %debug%==1 echo ------------ccb--------------
GOTO:EOF


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
