:: =================================================================== ::
::  ���ļ�������
::  
:: 
:: =================================================================== ::

:::::::::::::::: ����Ԥ���� ::::::::::::::::
:: �رջ���
@echo off
:::::::::::::::: ����Ԥ���� ::::::::::::::::

::goto Debug_Point

:::::::: [�̶���ǩ����]ʾ�� ::::::::
:: Call  ���ļ���  ����1  ����2 ...
:: ����1(%1)  ����2(%2) ,�Դ�����

:::::::: [�ޱ�ǩ����]ʾ�� ::::::::
:: Call  ���ļ���    ����1  ����2 ...
:: ����1(%1)  ����2(%2) ,�Դ�����
:: ����1��ʽ��source=value;destination=value;label=value

:::::::::::::::: �ļ�ͷ ::::::::::::::::
:: [�̶���ǩ����]
::Call :Arr_Length %1 %2 

:: [�ޱ�ǩ����]
Call :main %1  %2 %3 %4 %5 %6 %7 %8 %9 
:::::::::::::::: �ļ�ͷ ::::::::::::::::


GOTO:EOF
:: ================================================== ::
:: �������ƣ�main							  		  ::
:: �������ܣ��ⲿ���������							  ::
:: ����������arg1: (%~1)(%1)���ò��� 				  ::
::           ��ʽ��source=value;destination=value;label=value
::           arg2: (%~2)(%2)��������1 				  ::
::           arg3: (%~3)(%3)��������2 				  ::
::           arg4: (%~4)(%4)��������3 				  ::
::           arg5: (%~5)(%5)��������4 				  ::
::           arg6: (%~6)(%6)��������5 				  ::
::           arg7: (%~7)(%7)��������6 				  ::
::           arg8: (%~8)(%8)��������7 				  ::
::           arg9: (%~9)(%9)��������8 				  ::
:: ================================================== ::
:main

:: ���Կ���
set debug=0
:: ���������ӳ�
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

:: ���ú��������ݲ���
Call :Callx "%~1"  %~2  %~3  %~4  %~5  %~6  %~7  %~8  %~9
GOTO:EOF


GOTO:EOF
:: ���Ե�
:Debug_Point


:: ==========[Function]================================================================== ::

GOTO:EOF
:: ================================================== ::
:: �������ƣ�Callx							  		  ::
:: �������ܣ����Ⱥ���							  	  ::
:: ����������arg1: (%~1)(%1)���ò��� 				  ::
::           ��ʽ��source=value;destination=value;label=value
::           arg2: (%~2)(%2)��������1 				  ::
::           arg3: (%~3)(%3)��������2 				  ::
::           arg4: (%~4)(%4)��������3 				  ::
::           arg5: (%~5)(%5)��������4 				  ::
::           arg6: (%~6)(%6)��������5 				  ::
::           arg7: (%~7)(%7)��������6 				  ::
::           arg8: (%~8)(%8)��������7 				  ::
::           arg9: (%~9)(%9)��������8 				  ::
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
:: �����͡�
:: ��ʽ��
:: source=value;destination=value;label=value  args
::    %%a=%%b  ;        %%c=%%d  ;  %%e=%%f    args
:: ������õ��ļ�;Ŀ���ļ�;��ǩ  ����n
::
:: ����ֺ� ;  ��Ȼ��ֱ�����ñ���(set key=value)�������ݱ���ֵ����Call����
:: ����n : %~2-9��ֻ��8��
:: key=value : ���9��
:: ----------------------------------------------------------------
for /f "tokens=1-9 delims=;" %%a in ( "%~1" ) do (
	if %debug%==1 echo [a: %%a ] [b: %%b ] [c: %%c ] [d: %%d ] [e: %%e ] 
	if %debug%==1 echo [f: %%f ] [g: %%g ] [h: %%h ] [i: %%i ]
	
	:: ���ñ���
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

:: Call ����   NEQ - ������
if  "%destination%" NEQ "" (		
	:: ���� Ŀ���ļ� �ı�ǩ
	Call %destination%  %destination%:%label%  %~2  %~3  %~4  %~5  %~6  %~7  %~8  %~9
) else (		
	:: ���� ������õ��ļ� �ı�ǩ.
	Call %source%  %source%:%label%  %~2  %~3  %~4  %~5  %~6  %~7  %~8  %~9
)
GOTO:EOF
:: ==========[Function]================================================================== ::

