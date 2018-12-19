:: =================================================================== ::
:: 配置文件处理 
:: 
:: ReadAllSubDirRelativePathFile : 读取所有子目录下所有特定文件
:: ReadDirRelativePathFile  :  读取目录下相对路径文件
:: ReadAllSubDir  :  读取所有子目录
:: ReadDirFile  : 读取指定目录所有指定文件
:: ConfRead  :  读取配置项
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
set debug=0
:: 开启变量延迟
::setlocal EnableDelayedExpansion
:: 当前文件名
set this=%0
:: 是否为入口文件
set is_index=0
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
:::ReadAllSubDirRelativePathFile_test

::call :ReadAllSubDirRelativePathFile  "K:\FAQ\CMD\CMD知识\批处理路径相关\s\"   c.txt  cb04

::GOTO:EOF
:::cb04
::echo -----------cb04------------
::echo %~0_1: %~1
::echo %~0_2: %~2
::echo %~0_3: %~3
::echo %~0_4: %~4
::echo %~0_5: %~5
::echo %~0_6: %~6
::echo %~0_7: %~7
::echo %~0_8: %~8
::echo %~0_9: %~9
::echo -----------cb04------------
::GOTO:EOF


GOTO:EOF
:: ================================================== ::
:: 函数名称：ReadAllSubDirRelativePathFile			  ::
:: 函数功能：读取所有子目录下所有特定文件			  ::
:: 函数参数：arg1: 所有子目录的根目录 				  ::
::           	   如，K:\FAQ\CMD\s\ 				  ::
::           arg2: 文件名 						  	  ::
::            	   如，c.txt	 					  ::
::           arg3: 回调函数(最终回调) 				  ::
::                 格式： File:Label  或 Label 		  ::
::       [arg4-9]: 回调函数的参数					  ::
:: 返回值： 									 	  ::
:: 		%~1: 子目录绝对路径				 	 		  ::
::		     如，K:\FAQ\CMD\s\4\	  	  		 	  ::
:: 	  %~2-8: 回调函数的参数	[arg3-9]			 	  ::
:: ================================================== ::
:: 指定目录下的/所有子目录(*)/所有特定文件(c.txt)
:ReadAllSubDirRelativePathFile
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

:: 读取所有子目录
call :ReadAllSubDir %~1  ReadAllSubDirRelativePathFile_cb  %~2  %~3  %~4  %~5  %~6  %~7  %~8  %~9

GOTO:EOF
:ReadAllSubDirRelativePathFile_cb
if %debug%==1 echo %~0_1: %~1
if %debug%==1 echo %~0_2: %~2
if %debug%==1 echo %~0_3: %~3
if %debug%==1 echo %~0_4: %~4
if %debug%==1 echo %~0_5: %~5
if %debug%==1 echo %~0_6: %~6
if %debug%==1 echo %~0_7: %~7
if %debug%==1 echo %~0_8: %~8
if %debug%==1 echo %~0_9: %~9

:: 读取目录下所有指定文件
call :ReadDirFile  %~1  %~2  %~3 %~4  %~5  %~6  %~7  %~8  %~9
GOTO:EOF

GOTO:EOF
:: ==========[Function]================================================================== ::



:: ==========[Function]================================================================== ::
:::ReadDirRelativePathFile_test
:::::::: 调用示例 ::::::::
::call :ReadDirRelativePathFile "K:\FAQ\CMD\CMD知识\批处理路径相关\s"  "\c\c.txt"  0  cb03    参数05 参数06  参数07  参数08  参数09
::call :ReadDirRelativePathFile "K:\FAQ\CMD\CMD知识\批处理路径相关\s"  \c\c.txt  1  cb03    参数05 参数06  参数07  参数08  参数09
::GOTO:EOF
:::cb03
::echo -------------cb03-----------
::echo 文件绝对路径(arg1): %~1
::echo 参数(arg2): %~2
::echo 参数(arg3): %~3
::echo 参数(arg4): %~4
::echo 参数(arg5): %~5
::echo 参数(arg6): %~6
::echo 参数(arg7): %~7
::echo 参数(arg8): %~8
::echo 参数(arg9): %~9
::echo -------------cb03-----------
::GOTO:EOF


GOTO:EOF
:: ================================================== ::
:: 函数名称：ReadDirRelativePathFile				  ::
:: 函数功能：读取目录下相对路径文件			  		  ::
:: 函数参数：arg1: 根目录 				 			  ::
::            	   如，K:\FAQ\CMD\s 				  ::
::           arg2: 文件相对路径(包含文件名) 		  ::
::            	   如，\c\c.txt						  ::
::           arg3: (is_dirs)是否匹配目录下的一级子目录::
::                 值(0/1) 	默认 0					  ::
::           arg4: 回调函数							  ::
::                 格式： File:Label  或 Label 		  ::
::       [arg5-8]: 回调函数的参数					  ::
:: 返回值： 									 	  ::
:: 		%~1: 文件绝对路径(路径真实性已校验)			  ::
::		     如，K:\FAQ\CMD\s\4\c\c.txt	  	  		  ::
:: 	  	%~2: 文件索引			 	  				  ::
:: 	  		 每个文件计算1个索引			 	  	  ::
:: 	  	%~3: 文件计数			 	  				  ::
:: 	  %~4-9: 回调函数的参数	[arg5-8]			 	  ::
:: ================================================== ::
:: 指定目录下的/指定相对路径的特定文件(\c\c.txt)
:: 指定目录下的/所有子目录(*)/指定相对路径的特定文件(\c\c.txt)
:ReadDirRelativePathFile
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

:: 文件索引
set FileIndex=0

:: 文件计数
set FileCount=1

:: is_dirs 参数处理  EQU - 等于 
if "%~3" EQU "" (
	set is_dirs=0
) else (
	set is_dirs=%~3
)
if %debug%==1 echo is_dirs: %is_dirs%

:: 回调函数 参数处理     NEQ - 不等于
if  "%~4" NEQ ""  (
	:: 格式： File:Label  或 Label
	for /f "tokens=1,2  delims=:" %%a in ( "%~4" ) do (
		:: NEQ - 不等于
		if  "%%b" NEQ "" (
			set ReadDirRelativePathFile_callDestination=%%a
			set ReadDirRelativePathFile_callLabel=%%b
		) else (
			set ReadDirRelativePathFile_callDestination=
			set ReadDirRelativePathFile_callLabel=%%a
		)
	)
)
if %debug%==1 echo ReadDirRelativePathFile_callDestination: !ReadDirRelativePathFile_callDestination!
if %debug%==1 echo ReadDirRelativePathFile_callLabel: !ReadDirRelativePathFile_callLabel!


:: 指定目录下的/指定相对路径的特定文件(\c\c.txt)
if %is_dirs% == 0 (
	::设置全路径
	set fullpath=%~1%~2
	if %debug%==1 echo fullpath: !fullpath!
	
	:: 调用函数并传递参数 
	if exist !fullpath! (
		call CallX.bat  "source=%this%;destination=!ReadDirRelativePathFile_callDestination!;label=!ReadDirRelativePathFile_callLabel!"   !fullpath!   !FileIndex!  !FileCount!  %~5  %~6   %~7  %~8  %~9
		set /a  FileIndex+=1
		set /a  FileCount+=1
	)
)

:: ----------------------------------------------------------------
:: 【解释】
:: 示例数据: K:\FAQ\CMD\s  cb02
:: FOR /d %%b in ( %~1\* )  do (...) 
:: /d  配合 %~1\* 的通配符，可遍历目录下的所有子目录，一级子目录
:: 结果如，
:: K:\FAQ\CMD\s\1
:: K:\FAQ\CMD\s\2
:: K:\FAQ\CMD\s\3
:: 
:: 最后将结果传递给回调函数 
:: ----------------------------------------------------------------	
:: 指定目录下的/所有子目录(*)/指定相对路径的特定文件(\c\c.txt)
if %is_dirs% == 1 (
	for /d %%b in ( %~1\* ) do (
		if %debug%==1 echo [b: %%b ]
		if %debug%==1 echo ThisFileRoot: %%b 
		
		::设置全路径
		set fullpath=%%b%~2
		if %debug%==1 echo fullpath: !fullpath!

		:: 调用函数并传递参数 
		if exist !fullpath! (
			call CallX.bat  "source=%this%;destination=!ReadDirRelativePathFile_callDestination!;label=!ReadDirRelativePathFile_callLabel!"   !fullpath!    !FileIndex!  !FileCount! %~5  %~6   %~7  %~8  %~9	   
			set /a  FileIndex+=1
			set /a  FileCount+=1
		)
	)	
)
GOTO:EOF
:: ==========[Function]================================================================== ::




:: ==========[Function]================================================================== ::
:::ReadAllSubDir_test
:::::::: 调用示例 ::::::::
:: 目录后面有无斜杠无影响
::call :ReadAllSubDir "K:\FAQ\CMD\CMD知识\批处理路径相关\s\"   cb02  参数03  参数04  参数05 参数06  参数07  参数08  参数09
::GOTO:EOF
:::cb02
::echo -------------cb02-----------
::echo 子目录绝对路径(arg1): %~1
::echo 参数(arg2): %~2
::echo 参数(arg3): %~3
::echo 参数(arg4): %~4
::echo 参数(arg5): %~5
::echo 参数(arg6): %~6
::echo 参数(arg7): %~7
::echo 参数(arg8): %~8
::echo 参数(arg9): %~9
::echo -------------cb02-----------
::GOTO:EOF


GOTO:EOF
:: ================================================== ::
:: 函数名称：ReadAllSubDir							  ::
:: 函数功能：读取所有子目录			  				  ::
:: 函数参数：arg1: 所有子目录的根目录 				  ::
::           	   如，K:\FAQ\CMD\s\ 				  ::
::           arg2: 回调函数 						  ::
::                 格式： File:Label  或 Label 		  ::
::       [arg3-9]: 回调函数的参数					  ::
:: 返回值： 									 	  ::
:: 		%~1: 子目录绝对路径				 	 		  ::
::		     如，K:\FAQ\CMD\s\4\	  	  		 	  ::
:: 	  %~2-8: 回调函数的参数	[arg3-9]			 	  ::
:: ================================================== ::
:ReadAllSubDir
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

:: 回调函数 参数处理     NEQ - 不等于
if  "%~2" NEQ ""  (
	:: 格式： File:Label  或 Label
	for /f "tokens=1,2  delims=:" %%a in ( "%~2" ) do (
		:: NEQ - 不等于
		if  "%%b" NEQ "" (
			set ReadAllSubDir_callDestination=%%a
			set ReadAllSubDir_callLabel=%%b
		) else (
			set ReadAllSubDir_callDestination=
			set ReadAllSubDir_callLabel=%%a
		)
	)
)
if %debug%==1 echo ReadAllSubDir_callDestination: !ReadAllSubDir_callDestination!
if %debug%==1 echo ReadAllSubDir_callLabel: !ReadAllSubDir_callLabel!

:: ----------------------------------------------------------------
:: 【解释】
:: 示例数据: K:\FAQ\CMD\s\  cb02
:: for /d %%b in ( %~1* ) do (...)
:: /d  配合 %~1* 的通配符，可遍历目录下的所有子目录，一级子目录
:: 结果如，
:: K:\FAQ\CMD\s\1
:: K:\FAQ\CMD\s\2
:: K:\FAQ\CMD\s\3
:: 
:: 最后将结果传递给回调函数
:: ----------------------------------------------------------------
for /d %%b in ( %~1* ) do (
   if %debug%==1 echo [b: %%b ]
   if %debug%==1 echo ThisFileRoot: %%b 

   :: 调用函数并传递参数	
   call CallX.bat  "source=%this%;destination=!ReadAllSubDir_callDestination!;label=!ReadAllSubDir_callLabel!"  "%%b\"    %~3  %~4  %~5  %~6  %~7  %~8  %~9
)
GOTO:EOF
:: ==========[Function]================================================================== ::




:: ==========[Function]================================================================== ::
::ReadDirFile_test
:::::::: 调用示例 ::::::::
:: 目录后面有无斜杠无影响
::call :ReadDirFile "K:\FAQ\CMD\CMD知识\批处理路径相关\s\1\"  c.txt  cb01  参数04  参数05 参数06  参数07  参数08  参数09
::GOTO:EOF
:::cb01
::echo -------------cb01-----------
::echo 文件绝对路径(arg1): %~1
::echo 文件索引(arg2): %~2
::echo 文件计数(arg3): %~3
::echo 参数(arg4): %~4
::echo 参数(arg5): %~5
::echo 参数(arg6): %~6
::echo 参数(arg7): %~7
::echo 参数(arg8): %~8
::echo 参数(arg9): %~9
::echo -------------cb01-----------
::GOTO:EOF


GOTO:EOF
:: ================================================== ::
:: 函数名称：ReadDirFile							  ::
:: 函数功能：读取指定目录所有指定文件				  ::
:: 函数参数：arg1: 目录路径 						  ::
::                 如， K:\FAQ\CMD\s\4\				  ::
::           arg2: 文件名 						  	  ::
::                 如， c.txt						  ::
::           arg3: 回调函数 						  ::
::                 格式： File:Label  或 Label 		  ::
::       [arg4-9]: 回调函数的参数 					  ::
:: 返回值： 									 	  ::
:: 		%~1: 实际存在的文件的绝对路径				  ::
::		     如，K:\FAQ\CMD\s\4\c\c.txt	  	  		  ::
:: 		%~2: 文件索引				 	  		  	  ::
:: 		     每个文件计算1个索引				 	  ::
:: 		%~3: 文件计数				 	  		  	  ::
:: 	  %~4-9: 回调函数的参数				 	  		  ::
:: ================================================== ::
:: 指定目录下的/所有特定文件(c.txt) 
:ReadDirFile
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

:: 文件索引
set ReadDirFile.FileIndex=0

:: 文件计数
set ReadDirFile.FileCount=1

:: 回调函数 参数处理     NEQ - 不等于
if  "%~3" NEQ ""  (
	:: 格式： File:Label  或 Label
	for /f "tokens=1,2  delims=:" %%a in ( "%~3" ) do (
		:: NEQ - 不等于
		if  "%%b" NEQ "" (
			set ReadDirFile_callDestination=%%a
			set ReadDirFile_callLabel=%%b
		) else (
			set ReadDirFile_callDestination=
			set ReadDirFile_callLabel=%%a
		)
	)
)
if %debug%==1 echo ReadDirFile_callDestination: !ReadDirFile_callDestination!
if %debug%==1 echo ReadDirFile_callLabel: !ReadDirFile_callLabel!
:: ----------------------------------------------------------------
:: 【解释】
:: 示例数据:  K:\FAQ\CMD\s\4\  c.txt  cb01
:: FOR /R [[drive:]path] %variable IN (set) DO command [command-parameters]
:: 
:: 递归遍历指定文件(实际存在的文件)。 /r 后可指定路径
:: (set)中为具体文件名，不含通配符，则枚举该目录树（即列举该目录及其下面的所有子目录），
:: 而不管set中的指定文件是否存在。
:: 
:: 目录树包含(set)结尾，如，K:\FAQ\CMD\s\4\c\c.txt
:: 所以，需要 if exist %%i 判断文件是否存在
:: ----------------------------------------------------------------
for /r "%~1" %%i in (%~2) do if exist %%i  (
	if %debug%==1 echo ReadDirFile--- %%i  do anything  
	
	:: 调用函数并传递参数 
	call CallX.bat  "source=%this%;destination=!ReadDirFile_callDestination!;label=!ReadDirFile_callLabel!"   "%%i"  !ReadDirFile.FileIndex!  !ReadDirFile.FileCount!  %~4  %~5  %~6  %~7  %~8  %~9
	
	set /a  ReadDirFile.FileIndex+=1
	set /a  ReadDirFile.FileCount+=1
) 
GOTO:EOF
:: ==========[Function]================================================================== ::




:: ==========[Function]================================================================== ::
:::ConfRead_test
:::::::: 调用示例 ::::::::
:: 模拟读取多个文件
:: 注意
:: 自增量，在回调函数中处理，会无效果。应该在for中处理。
:: 

:: 正确的处理自增量
::set /a idx=0
::for /l %%i in (1,1,4) do (
::	::call :ConfRead "K:\FAQ\CMD\CMD知识\批处理路径相关\s\%%i\c\c.txt"  ccb  !idx!
::	call :ConfRead "K:\FAQ\CMD\CMD知识\批处理路径相关\s\%%i\c\c.txt"  ccb  
::	set /a idx+=1	
::)
::echo ---------查看所有设置的变量-------------
::set ConfReadArr
::echo ---------查看所有设置的变量-------------

::GOTO:EOF
:::ccb
::echo ------------ccb--------------
:: 错误的处理自增量
::set /a idx+=1
::echo idx: %idx%
::echo 自增量: %~1
::echo ------------ccb--------------
::GOTO:EOF



GOTO:EOF
:: ================================================== ::
:: 函数名称：ConfRead								  ::
:: 函数功能：读取配置项								  ::
:: 函数参数：arg1: 文件路径 						  ::
::           arg2: 回调函数 						  ::
::           	   格式： File:Label  或 Label 	 	  ::
::           arg3: 自增量 						  	  ::
::                 作为文件唯一性的索引 		  	  ::
::       [arg4-9]: 回调函数的参数 					  ::
:: 返回值： 									 	  ::
:: 		     直接在获取变量			 				  ::
:: 			 ConfReadArr[arg3].key=value			  ::
:: 			 key=value					  			  ::
::			 如，ConfReadArr[0].Value=Hello World	  ::
::			 或，Value=Hello World	  	  			  ::
:: 		%~1: 自增量			 				  		  ::
:: 		%~2: 文件路径		 				  		  ::
:: 	  %~3-9: 回调函数的参数[arg4-9]			 		  ::
:: ================================================== ::
:ConfRead
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

::SETLOCAL

:: 下标处理  NEQ - 不等于
if  "%~3" NEQ "" (
	:: 接收第三参数，作为文件唯一性的索引
	SET ConfRead.index=%~3
) else (
	:: 没有第三参数且时，初始化   EQU - 等于 <TODO: else 冗余>	
	if "%ConfRead.index%" EQU "" (
		:: 索引不存在时
		set /a ConfRead.index=0
	) else (
		:: 索引存在时 +1
		set /a ConfRead.index+=1
	) 	
)
if %debug%==1 echo 文件索引: !ConfRead.index!
if %debug%==1 echo filepath : %~1

:: 回调函数 参数处理     NEQ - 不等于
if  "%~2" NEQ ""  (
	:: 格式： File:Label  或 Label
	for /f "tokens=1,2  delims=:" %%a in ( "%~2" ) do (
		:: NEQ - 不等于
		if  "%%b" NEQ "" (
			set ConfRead_callDestination=%%a
			set ConfRead_callLabel=%%b
		) else (
			set ConfRead_callDestination=
			set ConfRead_callLabel=%%a
		)
	)
)
if %debug%==1 echo ConfRead_callDestination: !ConfRead_callDestination!
if %debug%==1 echo ConfRead_callLabel: !ConfRead_callLabel!
if %debug%==1 set v=0
:: ----------------------------------------------------------------
:: 【解释】
:: 示例文件(%~1)中的数据： name=ac1
::
:: for /f "usebackq tokens=1,2 delims==" %%i in ( "%~1" ) do (...)
:: 		delims==     ：分隔符为 =
:: 		tokens=1,2   : 将分隔后的第1个(name)和第2个数据(ac1)传递给for内置变量
:: 		%%i,%%j,%%k  ：for内置变量，分别接收第1，2，3个数据
:: 		usebackq     : 配合 "%~1" 中的引号，能处理包含空格的路径
::
:: 设置完所有变量后，调用回调函数，来获取这些变量
:: 
:: set ConfReadArr[%ConfRead.index%].%%i=%%j
:: 数据返回的格式： 
:: 		ConfReadArr[0].Name=Test1
::		ConfReadArr[0].Value=Hello World
:: ----------------------------------------------------------------
for /f "usebackq tokens=1,2 delims==" %%i in ( "%~1" ) do (
	if %debug%==1 echo -------ConfRead：!v! ---------	
	if %debug%==1 echo [i: %%i ][j: %%j  ] 
	
	:: 设置变量
	set %%i=%%j
	set ConfReadArr[!ConfRead.index!].%%i=%%j	
	
	if %debug%==1 set ConfReadArr[!ConfRead.index!].%%i
	if %debug%==1 echo -------ConfRead：!v! ---------
	if %debug%==1 set /a v+=1
)
:: 调用函数
call CallX.bat  "source=%this%;destination=!ConfRead_callDestination!;label=!ConfRead_callLabel!"  !ConfRead.index!  "%~1"  %~4  %~5  %~6  %~7  %~8  %~9
::ENDLOCAL
GOTO:EOF
:: ==========[Function]================================================================== ::




:: ================================================== ::
:: 函数名称：EOF  								      ::	
:: 函数功能：结束处理								  :: 
:: 函数参数： 						                  ::	
:: ================================================== ::
:EOF
if %debug%==1 echo EOF....%this%....EOF

