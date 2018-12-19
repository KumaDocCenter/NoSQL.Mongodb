:: =================================================================== ::
::  跨文件调度器
::  
:: 
:: =================================================================== ::

:::::::::::::::: 变量预处理 ::::::::::::::::
:: 关闭回显
@echo off
:::::::::::::::: 变量预处理 ::::::::::::::::

::goto Debug_Point

:::::::: [固定标签调用]示例 ::::::::
:: Call  此文件名  参数1  参数2 ...
:: 参数1(%1)  参数2(%2) ,以此类推

:::::::: [无标签调用]示例 ::::::::
:: Call  此文件名    参数1  参数2 ...
:: 参数1(%1)  参数2(%2) ,以此类推
:: 参数1格式：source=value;destination=value;label=value

:::::::::::::::: 文件头 ::::::::::::::::
:: [固定标签调用]
::Call :Arr_Length %1 %2 

:: [无标签调用]
Call :main %1  %2 %3 %4 %5 %6 %7 %8 %9 
:::::::::::::::: 文件头 ::::::::::::::::


GOTO:EOF
:: ================================================== ::
:: 函数名称：main							  		  ::
:: 函数功能：外部调用主入口							  ::
:: 函数参数：arg1: (%~1)(%1)调用参数 				  ::
::           格式：source=value;destination=value;label=value
::           arg2: (%~2)(%2)函数参数1 				  ::
::           arg3: (%~3)(%3)函数参数2 				  ::
::           arg4: (%~4)(%4)函数参数3 				  ::
::           arg5: (%~5)(%5)函数参数4 				  ::
::           arg6: (%~6)(%6)函数参数5 				  ::
::           arg7: (%~7)(%7)函数参数6 				  ::
::           arg8: (%~8)(%8)函数参数7 				  ::
::           arg9: (%~9)(%9)函数参数8 				  ::
:: ================================================== ::
:main

:: 调试开关
set debug=0
:: 开启变量延迟
::setlocal EnableDelayedExpansion

if %debug%==1 echo CallX.bat----------------
if %debug%==1 echo main_1: %~1
if %debug%==1 echo main_2: %~2
if %debug%==1 echo main_3: %~3
if %debug%==1 echo main_4: %~4
if %debug%==1 echo main_5: %~5
if %debug%==1 echo main_6: %~6
if %debug%==1 echo main_7: %~7
if %debug%==1 echo main_8: %~8
if %debug%==1 echo main_9: %~9
if %debug%==1 echo CallX.bat----------------

:: 调用函数并传递参数
Call :Callx "%~1"  %~2  %~3  %~4  %~5  %~6  %~7  %~8  %~9
GOTO:EOF


GOTO:EOF
:: 调试点
:Debug_Point


:: ==========[Function]================================================================== ::

GOTO:EOF
:: ================================================== ::
:: 函数名称：Callx							  		  ::
:: 函数功能：调度函数							  	  ::
:: 函数参数：arg1: (%~1)(%1)调用参数 				  ::
::           格式：source=value;destination=value;label=value
::           arg2: (%~2)(%2)函数参数1 				  ::
::           arg3: (%~3)(%3)函数参数2 				  ::
::           arg4: (%~4)(%4)函数参数3 				  ::
::           arg5: (%~5)(%5)函数参数4 				  ::
::           arg6: (%~6)(%6)函数参数5 				  ::
::           arg7: (%~7)(%7)函数参数6 				  ::
::           arg8: (%~8)(%8)函数参数7 				  ::
::           arg9: (%~9)(%9)函数参数8 				  ::
:: ================================================== ::
:Callx
if %debug%==1 echo CallX.bat----------------
if %debug%==1 echo Callx_1: %~1
if %debug%==1 echo Callx_2: %~2
if %debug%==1 echo Callx_3: %~3
if %debug%==1 echo Callx_4: %~4
if %debug%==1 echo Callx_5: %~5
if %debug%==1 echo Callx_6: %~6
if %debug%==1 echo Callx_7: %~7
if %debug%==1 echo Callx_8: %~8
if %debug%==1 echo Callx_9: %~9
if %debug%==1 echo CallX.bat----------------

:: ----------------------------------------------------------------
:: 【解释】
:: 格式：
:: source=value;destination=value;label=value  args
::    %%a=%%b  ;        %%c=%%d  ;  %%e=%%f    args
:: 发起调用的文件;目标文件;标签  参数n
::
:: 处理分号 ;  ，然后直接设置变量(set key=value)，最后根据变量值进行Call调用
:: 参数n : %~2-9，只有8个
:: key=value : 最多9对
:: ----------------------------------------------------------------
for /f "tokens=1-9 delims=;" %%a in ( "%~1" ) do (
	if %debug%==1 echo [a: %%a ] [b: %%b ] [c: %%c ] [d: %%d ] [e: %%e ] 
	if %debug%==1 echo [f: %%f ] [g: %%g ] [h: %%h ] [i: %%i ]
	
	:: 设置变量
	if  "%%a" NEQ ""  set "%%a"
	if  "%%b" NEQ ""  set "%%b"
	if  "%%c" NEQ ""  set "%%c"
	if  "%%d" NEQ ""  set "%%d"
	if  "%%e" NEQ ""  set "%%e"
	if  "%%f" NEQ ""  set "%%f"
	if  "%%g" NEQ ""  set "%%g"
	if  "%%h" NEQ ""  set "%%h"
	if  "%%i" NEQ ""  set "%%i"
)
if %debug%==1 echo source: %source%
if %debug%==1 echo destination: %destination%
if %debug%==1 echo label: %label%

:: Call 调度   NEQ - 不等于
if  "%destination%" NEQ "" (		
	:: 调用 目标文件 的标签
	Call %destination%  %destination%:%label%  %~2  %~3  %~4  %~5  %~6  %~7  %~8  %~9
) else (		
	:: 调用 发起调用的文件 的标签.
	Call %source%  %source%:%label%  %~2  %~3  %~4  %~5  %~6  %~7  %~8  %~9
)
GOTO:EOF
:: ==========[Function]================================================================== ::

