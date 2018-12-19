:: =================================================================== ::
::  生成用于子模块批处理的配置文件
::  
:: 
:: =================================================================== ::
@echo off

:: 文件名(不包含后缀)
set _filename=Template
:: git地址
set _git=https://xxx.com/xx/x.git
:: 子模块名
set _name=public
:: 子模块分支 
set _branch=master
:: 脚本路径
set _sh=none

call :outfile  %_filename%.add  %_git%  %_name%  %_branch%  %_sh%
call :outfile  %_filename%.init  %_git%   %_name%  %_branch%  %_sh%
call :outfile  %_filename%.update  %_git%   %_name%  %_branch%  %_sh%
call :outfile  %_filename%.del  %_git%   %_name%  %_branch%  %_sh%


GOTO:EOF
:: ================================================== ::
:: 函数名称：outfile							  	  ::
:: 函数功能：输出文件								  ::
:: 函数参数：arg1: 文件名 						  	  ::
:: 			 arg2: git地址 						  	  ::
::                 如，https://github.com/ter/Ajax.git::
::           arg3: 子模块名 						  ::
::                 子模块相对路径					  ::
::         [arg4]: 子模块分支 						  ::
::         [arg5]: 脚本路径 						  ::
:: 返回值： 									 	  ::
:: 													  ::
:: ================================================== ::
:outfile

set dn=%~1
set git=%~2
set name=%~3

:: EQU - 等于
if "%~4" EQU "" (
	set branch=master
) else (
	set branch=%~4
) 

:: EQU - 等于
if "%~5" EQU "" (
	set sh=none
) else (
	set sh=%~5
) 
echo ------------------------ 配置输出  ------------------------
echo ###################################################### >%dn%
echo #  子模块批处理配置文件 >>%dn%
echo #  后缀   		作用 >>%dn%
echo # .add        添加子模块 >>%dn%	
echo # .init	      初始化子模块 >>%dn%
echo # .update	  更新子模块 >>%dn%
echo # .del		  删除子模块 >>%dn%
echo #------------------------------------------------ >>%dn%
echo #  git     :  git 地址 >>%dn%
echo #  name    :  子模块名称 >>%dn%
echo #  branch  :  子模块分支 >>%dn%
echo #  sh  	   :  待执行的额外脚本路径  >>%dn%
echo ###################################################### >>%dn%
echo git=%git%>>%dn%
echo name=%name%>>%dn%
echo branch=%branch%>>%dn%
echo sh=%sh%>>%dn%

echo. 
echo 用于子模块的配置文件已生成，请尽快转移文件
echo [ %dn% ]
echo.
echo ------------------------ 配置输出  ------------------------
GOTO:EOF

