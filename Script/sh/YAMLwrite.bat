:: =================================================================== ::
::  ���md�ļ���YAML�����
:: 
:: ���Ŀ¼�� ./Script/sh 
:: ����Ŀ¼�� ./  
:: 
:: =================================================================== ::

@echo off
:: ���Կ���
set debug=0

:: ���������ӳ�
setlocal enabledelayedexpansion

:: cd��ת����Ŀ¼(��Ϊ��ǰ���Ŀ¼��./Script/sh��������Ҫ����)
cd %~dp0
cd..
cd..
:: ���ø�Ŀ¼·��
set root=%cd%
:: ���õ�ǰ�ű�·��
set thispath=%~dp0



:: ����
call :YAML_write_in  doc\md
GOTO:EOF

GOTO:EOF
:: ================================================== ::
:: �������ƣ�YAML_write_in						  	  ::
:: �������ܣ�YAML��ʽд�뵽md�ļ� 					  ::
:: ����������arg1: ���·��						 	  ::
::           	   �������md�ļ�·��	  			  ::
::           	   �磬doc\md	  			  		  ::
::           							 			  ::
:: ����ֵ��          							      ::
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

:: ��������ʱ�亯��
call :DateTime 
if %debug%==1 echo ��ǰ����ʱ�䣺%datetime%
if %debug%==1 echo ��ǰ�ܣ�%week%
if %debug%==1 echo ʱ�����%timestamp%


set yaml=%~dp0YAML

:: YAML��ʱ�ļ�������ɾ��
if exist %yaml%.tmp  del %yaml%.tmp

:: �����ض����ļ�
for /f "usebackq tokens=*" %%a in (`dir /a/b/s %~1\*.md`) do (
	if %debug%==1 echo [file: %%a ][filename: %%~na ]
	
	
	REM ����YAML��ʽ�еı���
	REM ��ȡ��ǰĿ¼�µ�YAML�ļ���ÿ��	
	for /f "tokens=*" %%i in (%yaml%) do (
		if %debug%==1 echo [YAML_line: %%i ]
		set "line=%%i"		
		REM -----------------��������---------------------::
		call :ReplaceStr  line  {{date}}  "%datetime%"
		call :ReplaceStr  line  {{title}}  "%%~na"
		call :ReplaceStr  line  {{dot}}  .
		REM -----------------��������---------------------::
		:: ���YAML����ʱ�ļ�
		echo !line!>>%yaml%.tmp
	)
	echo.>>%yaml%.tmp
	
	:: �ļ��ϲ�
	REM copy /y YAML.tmp/a + "%%a"/a  "%%a.tmp"
	:: ������ʽ�����޷����������Ϊֻ��������ֶ�����
	copy /y %yaml%.tmp   %%a.YAML
	
	:: �ļ�������
	REM set "bakname=%%~nxa.%timestamp%.bak"
	REM ren  "%%a"   "!bakname!"
	REM ren  "%%a.tmp"   "%%~nxa"
	:: ɾ��YAML��ʱ�ļ�
	del %yaml%.tmp
	:: ��ʾ��Ϣ
	REM echo  [ %%a ]�ļ��ѱ���Ϊ[ !bakname! ]
	echo ����ļ� [ %%a.YAML ]
	echo.
)
GOTO:EOF



GOTO:EOF
:: ================================================== ::
:: �������ƣ�ReplaceStr						  	 	  ::
:: �������ܣ��ַ����滻			 					  ::
:: ����������arg1: �����ַ����ı���				 	  ::
::           arg2: ���ַ��� 			  			  ::
::           arg3: ���ַ��� 			  			  ::
::           							 			  ::
:: ����ֵ��          							      ::
::        %~1  �� ����arg1				   			  ::
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
:: NEQ - ������ 
if "%~1" NEQ "" (
	set "%~1=!str:%~2=%~3!"
)
::echo !%~1!
GOTO:EOF


GOTO:EOF
:: ================================================== ::
:: �������ƣ�DateTime							  	  ::
:: �������ܣ���������ʱ���ʱ���					  ::
:: ����������arg1: ���ڷָ���				 		  ::
::           							 			  ::
:: ����ֵ��          							      ::
::        %datetime%  �� ��ǰ����ʱ��   			  ::
::        				 �� 2018-12-10 21:43:58  	  ::
::            %week%  �� ��ǰ��    					  ::
::           			 �� ��һ    				  ::
::       %timestamp%  �� ����ʱ��� 				  ::
::           			 �� 20181207180016    		  ::
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

if %debug%==1 echo ------------------------ ��������ʱ���ʱ���  ----------------------

:: EQU - ����
if "%~1" EQU "" (
	set delim=-
) else (
	set delim=%~1
)

:: ���ڴ���( 2018-12-10 )
for /f "tokens=1-4  delims=/ " %%a in ("%date%") do (
	set _de=%%a%delim%%%b%delim%%%c
	set de=%%a%%b%%c
	set week=%%d
)
:: ʱ�䴦��( 21:43:58 )
for /f "tokens=1-4  delims=:." %%a in ("%time%") do (
	set _ti=%%a:%%b:%%c
	set ti=%%a%%b%%c
)

:: ��ǰ����ʱ��( 2018-12-10 21:43:58 )
set "datetime=%_de% %_ti%"
if %debug%==1 echo "%datetime%"

:: ����ʱ�� ��( 20181207180016 )
set deti=%de%%ti%
:::: ȥ�����пո�
set timestamp=%deti: =%
if %debug%==1 echo "%timestamp%"

if %debug%==1 echo ------------------------ ��������ʱ���ʱ���  ----------------------
GOTO:EOF


