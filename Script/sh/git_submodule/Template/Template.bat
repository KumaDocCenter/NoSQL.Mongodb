:: =================================================================== ::
::  ����������ģ��������������ļ�
::  
:: 
:: =================================================================== ::
@echo off

:: �ļ���(��������׺)
set _filename=Template
:: git��ַ
set _git=https://xxx.com/xx/x.git
:: ��ģ����
set _name=public
:: ��ģ���֧ 
set _branch=master
:: �ű�·��
set _sh=none

call :outfile  %_filename%.add  %_git%  %_name%  %_branch%  %_sh%
call :outfile  %_filename%.init  %_git%   %_name%  %_branch%  %_sh%
call :outfile  %_filename%.update  %_git%   %_name%  %_branch%  %_sh%
call :outfile  %_filename%.del  %_git%   %_name%  %_branch%  %_sh%


GOTO:EOF
:: ================================================== ::
:: �������ƣ�outfile							  	  ::
:: �������ܣ�����ļ�								  ::
:: ����������arg1: �ļ��� 						  	  ::
:: 			 arg2: git��ַ 						  	  ::
::                 �磬https://github.com/ter/Ajax.git::
::           arg3: ��ģ���� 						  ::
::                 ��ģ�����·��					  ::
::         [arg4]: ��ģ���֧ 						  ::
::         [arg5]: �ű�·�� 						  ::
:: ����ֵ�� 									 	  ::
:: 													  ::
:: ================================================== ::
:outfile

set dn=%~1
set git=%~2
set name=%~3

:: EQU - ����
if "%~4" EQU "" (
	set branch=master
) else (
	set branch=%~4
) 

:: EQU - ����
if "%~5" EQU "" (
	set sh=none
) else (
	set sh=%~5
) 
echo ------------------------ �������  ------------------------
echo ###################################################### >%dn%
echo #  ��ģ�������������ļ� >>%dn%
echo #  ��׺   		���� >>%dn%
echo # .add        �����ģ�� >>%dn%	
echo # .init	      ��ʼ����ģ�� >>%dn%
echo # .update	  ������ģ�� >>%dn%
echo # .del		  ɾ����ģ�� >>%dn%
echo #------------------------------------------------ >>%dn%
echo #  git     :  git ��ַ >>%dn%
echo #  name    :  ��ģ������ >>%dn%
echo #  branch  :  ��ģ���֧ >>%dn%
echo #  sh  	   :  ��ִ�еĶ���ű�·��  >>%dn%
echo ###################################################### >>%dn%
echo git=%git%>>%dn%
echo name=%name%>>%dn%
echo branch=%branch%>>%dn%
echo sh=%sh%>>%dn%

echo. 
echo ������ģ��������ļ������ɣ��뾡��ת���ļ�
echo [ %dn% ]
echo.
echo ------------------------ �������  ------------------------
GOTO:EOF

