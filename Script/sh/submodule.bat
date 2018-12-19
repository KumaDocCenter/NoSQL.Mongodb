:: =================================================================== ::
:: git子模块处理
:: 
::	submodule_s  	  ： 批量处理子模块
::	submodule_add     ： 添加子模块
::	submodule_init    ： 初始化子模块
::	submodule_update  ： 更新子模块
::	submodule_del  	  ： 删除子模块	
:: 
:: 
:: 存放目录： ./Script/sh 
:: 运行目录： ./ 
:: 
:: 只处理特定目录(source_md)下的子模块
:: =================================================================== ::

:::::::::::::::: 变量预处理 ::::::::::::::::
:: 关闭回显
@echo off
:: 调试开关
set debug=0
:: 开启变量延迟
::setlocal EnableDelayedExpansion
:: 当前文件名
set this=%0
:: 是否为入口文件
set is_index=0

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



:: ==========[Function]================================================================== ::
::submodule_s_test
:::::::: 调用示例 ::::::::
::set spath=.git\myconf\submodule\staged
::set dpath=.git\myconf\submodule\ok

::call CallX.bat  "source=%this%;destination=submodule.bat;label=submodule_s"  %spath%  %dpath%


GOTO:EOF
:: ================================================== ::
:: 函数名称：submodule_s							  ::
:: 函数功能：批量处理子模块							  ::
:: 函数参数：arg1: 文件源路径 						  ::
::           	   每行一个key=value	 			  ::
::  			   .add      添加子模块				  ::
::  			   .init	 初始化子模块			  ::
:: 				   .update	 更新子模块				  ::
::  			   .del		 删除子模块		 		  ::
::           arg2: 文件目标路径 					  ::
::           	   将源路径文件处理完后复制到此	 	  ::
:: 返回值： 									 	  ::
:: 		      						 				  ::
:: ================================================== ::
:submodule_s
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

if %debug%==1 echo spath: %cd%\%~1
if %debug%==1 echo dpath: %cd%\%~2

:: 目录不存在，则创建
IF NOT EXIST "%cd%\%~2" ( mkdir "%cd%\%~2" )

if %debug%==1 set f=0
:: ----------------------------------------------------------------
:: 【解释】
:: 示例数据：
:: 
:: 遍历指定目录下的文件 
:: for /f "usebackq tokens=* delims=" %%i in (`dir %cd%\%~1\*.*  /a-d/s/b`) do (...)
:: 		delims=      ：分隔符为默认，换行
:: 		tokens=*     : 将一整行作为参数
:: 		%%i			 ：for内置变量，分别接收第1个参数
:: 		usebackq     : 配合 in (``) 中的反引号，能运行反引号包裹的命令
::
:: dir %cd%\%~1\*.*  /a-d/s/b
:: 列出指定目录下所有文件，如
:: K:\Script\sh\a.txt
:: K:\Script\sh\b.txt
:: K:\Script\sh\c.txt
:: 
:: 
:: 读取每个文件中的配置：key=value
:: for /f "usebackq eol=# tokens=1,2 delims==" %%a in ( "%%i" ) do (...)
:: 		delims==     ：分隔符为 =
:: 		tokens=1,2   : 传递分隔后的数据给1，2个参数
:: 		%%a,%%b		 ：for内置变量，接收参数。%%a(key),%%b(value)
:: 		usebackq     : 配合 in ("") 中的反引号，双引号""代表文件名 
:: 		eol=#	     : 忽略#开头的行 
::
::	主要：读取每个文件中的配置，根据文件后缀调用不同的函数来处理
::   后缀   		作用
::  .add     	 添加子模块	
::  .init		 初始化子模块
::  .update		 更新子模块
::  .del		 删除子模块
:: ----------------------------------------------------------------
for /f "usebackq tokens=* delims=" %%i in (`dir %cd%\%~1\*.*  /a-d/s/b`) do (
	if %debug%==1 echo -------FileCount：!f! ----------------	
	if %debug%==1 echo [i: %%i ][prefx: %%~xi ]
	
	if %debug%==1 set v=0
	for /f "usebackq eol=# tokens=1,2 delims==" %%a in ( "%%i" ) do (
		if %debug%==1 echo -------VarCount：!v! ---------
		if %debug%==1 echo [a: %%a ][b: %%b  ]
		
		:: 设置变量
		set %%a=%%b
		if %debug%==1 set %%a
		
		if %debug%==1 echo -------VarCount：!v! ---------
		if %debug%==1 set /a v+=1
	)
	REM !sh! 从变量中读取，非参数传递	
	:: 删除子模块（调用函数并移动文件）    EQU - 等于
	if "%%~xi"  EQU ".del" (
		call :submodule_del  0  !name!  !sh!  !sh2!
		move /Y %%i  %cd%\%~2
	)
	
	:: 添加子模块（调用函数并移动文件）    EQU - 等于
	if "%%~xi"  EQU ".add" (
		call :submodule_add  !git!  !name! !branch!  !sh!  !sh2!
		move /Y %%i  %cd%\%~2
	)
	
	:: 初始化子模块（调用函数并移动文件）    EQU - 等于
	if "%%~xi"  EQU ".init" (
		call :submodule_init   !name!   !sh!  !sh2!
		move /Y %%i  %cd%\%~2
	)
	
	:: 更新子模块（调用函数并移动文件）    EQU - 等于
	if "%%~xi"  EQU ".update" (
		call :submodule_update  !name!   !sh!  !sh2!
		move /Y %%i  %cd%\%~2
	)
	
	if %debug%==1 echo -------FileCount：!f! ----------------
	if %debug%==1 set /a f+=1
)
GOTO:EOF
:: ==========[Function]================================================================== ::





:: ==========[Function]================================================================== ::
::submodule_add_test
:::::::: 调用示例 ::::::::
:: 设置文件夹名称
::set destpath=public

:: 设置远程仓库
::set gitref=https://github.com/KumaDocCenter/Ajax.git

:: 设置子模块分支
::set branch=master

::call CallX.bat  "source=%this%;destination=submodule.bat;label=submodule_add"  %gitref%  
::call CallX.bat  "source=%this%;destination=submodule.bat;label=submodule_add"  %gitref%  %destpath%  %branch%


GOTO:EOF
:: ================================================== ::
:: 函数名称：submodule_add							  ::
:: 函数功能：添加子模块								  ::
:: 函数参数：arg1: git地址 						  	  ::
::                 如，https://github.com/ter/Ajax.git::
::         [arg2]: 子模块名 						  ::
::                 子模块相对路径					  ::
::         [arg3]: 子模块分支 						  ::
::         [arg4]: 待执行脚本路径					  ::
::         [arg5]: 待执行脚本路径					  ::
:: 返回值： 									 	  ::
:: 													  ::
:: ================================================== ::
:submodule_add
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


:: 非强制
::git submodule add -b %branch%  %gitref%  %destpath%

:: 强制 -f   NEQ - 不等于
if  "%~3" NEQ ""  (
	echo 添加子模块[ %SubModuleRoot%/%~2 ]...
	git submodule add -b %~3 -f  %~1  %SubModuleRoot%/%~2
) else (
	echo 添加子模块[ %~1 ]...
	git submodule add  -f  %~1  %SubModuleRoot%/%~2
)
:: NEQ - 不等于 
if "%~4" NEQ "" (
	echo 执行脚本1...
	start %~4   %~2  %~1  %~3
)
:: NEQ - 不等于 
if "%~5" NEQ "" (
	echo 执行脚本2...
	start %~5   %~2  %~1  %~3
)
GOTO:EOF
:: ==========[Function]================================================================== ::



:: ==========[Function]================================================================== ::
::submodule_init_test
:::::::: 调用示例 ::::::::
:: 设置文件夹名称
::set destpath=public
::call CallX.bat  "source=%this%;destination=submodule.bat;label=submodule_init"  
::call CallX.bat  "source=%this%;destination=submodule.bat;label=submodule_init"  %destpath% 



GOTO:EOF
:: ================================================== ::
:: 函数名称：submodule_init							  ::
:: 函数功能：初始化子模块				  			  ::
:: 函数参数：[arg1]: 子模块名  						  ::
::                   子模块相对路径					  ::
::           [arg2]: 待执行脚本路径					  ::
::           [arg3]: 待执行脚本路径					  ::
:: 返回值： 									 	  ::
:: 													  ::
:: ================================================== ::
:submodule_init
:: 描述：初始化在.git/config中记录的子模块索引
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


:: --初始化单个子模块
::git submodule init  %destpath%

:: --初始化所有子模块
::git submodule init


:: NEQ - 不等于
if  "%~1" NEQ ""  (
	echo 初始化子模块[ %SubModuleRoot%/%~1 ]...
	git submodule init  %SubModuleRoot%/%~1
) else (
	echo 初始化所有子模块...
	git submodule init
)
:: NEQ - 不等于 
if "%~2" NEQ "" (
	echo 执行脚本1...
	start %~2  %~1
)
:: NEQ - 不等于 
if "%~3" NEQ "" (
	echo 执行脚本2...
	start %~3  %~1
)
GOTO:EOF
:: ==========[Function]================================================================== ::




:: ==========[Function]================================================================== ::
::submodule_update_test
:::::::: 调用示例 ::::::::
:: 设置文件夹名称
::set destpath=public
::call CallX.bat  "source=%this%;destination=submodule.bat;label=submodule_update"  
::call CallX.bat  "source=%this%;destination=submodule.bat;label=submodule_update"  %destpath% 



GOTO:EOF
:: ================================================== ::
:: 函数名称：submodule_update						  ::
:: 函数功能：更新子模块								  ::
:: 函数参数：[arg1]: 子模块名  						  ::
::                   子模块相对路径					  ::
::           [arg2]: 待执行脚本路径					  ::
::           [arg3]: 待执行脚本路径					  ::
:: 返回值： 									 	  ::
:: 													  ::
:: ================================================== ::
:submodule_update
:: 描述： 克隆缺失的子模块并更新子模块的工作树(检出默认分支master) 
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


:: --更新单个子模块
::git submodule update  %destpath%
::git submodule update --checkout    %destpath%

:: --更新所有子模块
::git submodule update

:: NEQ - 不等于
if  "%~1" NEQ ""  (
	echo 更新子模块[ %SubModuleRoot%/%~1 ]...
	git submodule update  %SubModuleRoot%/%~1
) else (
	echo 更新所有子模块...
	git submodule update
)
:: NEQ - 不等于 
if "%~2" NEQ "" (
	echo 执行脚本1...
	start %~2  %~1
)
:: NEQ - 不等于 
if "%~3" NEQ "" (
	echo 执行脚本2...
	start %~3  %~1
)
GOTO:EOF
:: ==========[Function]================================================================== ::



:: ==========[Function]================================================================== ::
::submodule_del_test
:::::::: 调用示例 ::::::::
:: 设置文件夹名称
::set destpath=public
::call CallX.bat  "source=%this%;destination=submodule.bat;label=submodule_del"  0  %destpath%
::call CallX.bat  "source=%this%;destination=submodule.bat;label=submodule_del"  1  


GOTO:EOF
:: ================================================== ::
:: 函数名称：submodule_del							  ::
:: 函数功能：删除子模块								  ::
:: 函数参数：arg1: 删除所有( 1 or 0) 			 	  ::
::                 1:删除所有；0:删除单个			  ::
::         [arg2]: 子模块名 						  ::
::                 子模块相对路径					  ::
::         [arg3]: 待执行脚本路径					  ::
::         [arg4]: 待执行脚本路径					  ::
:: 返回值： 									 	  ::
:: 													  ::
:: ================================================== ::
:submodule_del
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

:: ----------------------------------------------------------------
:: 【解释】
:: 删除所有子模块
:: git submodule status  ： 显示子模块的状态。
:: 根据 git submodule status 结果，变量其获取子模块名，然后再删除子模块。
::
:: ----------------------------------------------------------------
:: NEQ - 不等于  EQU - 等于
if  "%~1" EQU "1"  (
	echo 删除所有子模块...
	for /f "usebackq tokens=* delims=" %%a in (` git submodule status `) do (
		if %debug%==1 echo a: %%a
		for /f "usebackq tokens=1-3 delims= " %%i in ( '%%a' ) do (
			echo -----[子模块：%SubModuleRoot%/%%j ]--------------------------------------------------
			if %debug%==1 echo i: "%%i"
			if %debug%==1 echo j: "%%j"
			if %debug%==1 echo k: "%%k"
			
			echo 子模块记录从.git/config中删除并清除子模块目录下所有
			git  submodule deinit -f %SubModuleRoot%/%%j
			
			echo 子模块记录从.gitmodules中删除并清除子模块目录
			git rm -rf %SubModuleRoot%/%%j
			
			echo 删除子模块数据库
			rd /s/q  .git\modules\%SubModuleRoot%\%%j
			echo -----[子模块：%SubModuleRoot%/%%j ]--------------------------------------------------
		)
	)
) else (
	if  "%~2" NEQ ""  (		
		echo -----[子模块：%SubModuleRoot%/%~2 ]--------------------------------------------------
		echo 删除子模块[ %SubModuleRoot%/%~2 ]...
		echo 子模块记录从.git/config中删除并清除子模块目录下所有
		git  submodule deinit -f %SubModuleRoot%/%~2
		
		echo 子模块记录从.gitmodules中删除并清除子模块目录
		git rm -rf %SubModuleRoot%/%~2
		
		echo 删除子模块数据库
		rd /s/q  .git\modules\%SubModuleRoot%\%~2
		echo -----[子模块：%SubModuleRoot%/%~2 ]--------------------------------------------------
	) else (
		echo 缺少参数[ 子模块名 ]
	)
)
:: NEQ - 不等于 
if "%~3" NEQ "" (
	echo 执行脚本1...
	start %~3   %~2
)
:: NEQ - 不等于 
if "%~4" NEQ "" (
	echo 执行脚本2...
	start %~4   %~2
)
GOTO:EOF
:: ==========[Function]================================================================== ::




:: ================================================== ::
:: 函数名称：EOF  								      ::	
:: 函数功能：结束处理								  :: 
:: 函数参数： 						                  ::	
:: ================================================== ::
:EOF
if %debug%==1 echo EOF....%this%....EOF