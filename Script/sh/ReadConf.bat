:: =================================================================== ::
::  ��ȡ���� 
::  �����ļ��е����������Ŀ¼���ļ��ĸ���(�����������ļ���)
::  ��������ǰ������ [��������] ��
::
::  ���÷�Χ�����踴��
::  		  Դ��Ŀ¼-->Ŀ���Ŀ¼��������Ŀ¼�ṹ
::  �����ļ���conf.bat  CallX.bat 
::
:: ���Ŀ¼�� ./Script/sh 
:: ����Ŀ¼�� ./Script/sh
::
:: =================================================================== ::

:::::::::::::::: ����Ԥ���� ::::::::::::::::
:: �رջ���
@echo off
:: ���Կ���
set debug=0
:: ���������ӳ�
setlocal EnableDelayedExpansion
:: ��ǰ�ļ���
set this=%0
:: �Ƿ�Ϊ����ļ�
set is_index=1
:::::::::::::::: ����Ԥ���� ::::::::::::::::
if %is_index%==1 (
	:: EQU - ����
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



:::::::::::::::: [�̶���ǩ����]ʾ�� ::::::::::::::::
:: Call  ���ļ���  ����1  ����2 ...
:: ����1(%1)  ����2(%2) ,�Դ�����

:::::::::::::::: [ָ����ǩ����]ʾ�� ::::::::::::::::
:: Call  ���ļ���  ������  ����1  ����2 ...
:: ����1(%2)  ����2(%3) ,�Դ�����

:::::::::::::::: [�ޱ�ǩ����]ʾ�� ::::::::::::::::
:: Call  ���ļ���    ����1  ����2 ...
:: ����1(%1)  ����2(%2) ,�Դ�����

:::::::::::::::: [CallX��ʽ����]ʾ�� ::::::::::::::::
:: Call  ���ļ���    ����1  ����2 ...
:: ����1(%1)  ����2(%2) ,�Դ�����
:: ����1��ʽ��File:Label 
:: 			�磬b.bat:b_out
:: ����1��ʽ����CallX.bat�ж��壬��ͨ��CallX.bat�ļ�������


:::::::::::::::::::::::: �ļ�ͷ ::::::::::::::::::::::::
:: [�̶���ǩ����]
::Call :Arr_Length %1 %2 

:: [ָ����ǩ����]
if %is_index%==1 Call :main %1  %2 %3 %4 %5 %6 %7 %8 %9 

:: [�ޱ�ǩ����]
::Call :main %1  %2 %3 %4 %5 %6 %7 %8 %9 

:: [CallX��ʽ����]
if %is_index%==0 Call :main %1  %2 %3 %4 %5 %6 %7 %8 %9 
:::::::::::::::::::::::: �ļ�ͷ ::::::::::::::::::::::::



GOTO:EOF
:: ================================================== ::
:: �������ƣ�main							  		  ::
:: �������ܣ��ⲿ���������							  ::
:: ����������arg1: (%~1)(%1)��������/��������1 		  ::
::           arg2: (%~2)(%2)��������1/2 			  ::
::           arg3: (%~3)(%3)��������2/3 			  ::
::           arg4: (%~4)(%4)��������3/4 			  ::
::           arg5: (%~5)(%5)��������4/5 			  ::
::           arg6: (%~6)(%6)��������5/6 			  ::
::           arg7: (%~7)(%7)��������6/7 		      ::
::           arg8: (%~8)(%8)��������7/8 			  ::
::           arg9: (%~9)(%9)��������8/9 			  ::
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

::::::::::::::: ���Ƚ��� ::::::::::::::: 
:: NEQ - ������ (����%1�����ڿ�)
if "%1" NEQ "" (	
	for /f "tokens=1,2  delims=:" %%a in ( "%1" ) do (
		set calldest=%%a
		set calllabel=%%b
	)
	if %debug%==1 echo calldest : !calldest!
	if %debug%==1 echo calllabel : !calllabel!

	:: EQU - ����  (����Ŀ��==��ǰ)
	if "!calldest!" EQU "%this%"  (
		Call :!calllabel!  %2 %3 %4 %5 %6 %7 %8 %9 
		GOTO:EOF
	) else (
		GOTO:EOF
	)
)
::::::::::::::: ���Ƚ��� ::::::::::::::: 
GOTO:EOF

:Debug_Point
:: ���ļ�Ϊ����ļ�
:: ͨ����Ҫ set this=%0
echo.
::echo ����1��a.bat ���� b.bat �еı�ǩ b_out
::call CallX.bat  "source=%this%;destination=b.bat;label=b_out"  ����1  ����2  ����3  ����4  ����5  ����6  ����7  ����8  
echo.
::echo ����2��a.bat ���� a.bat �еı�ǩ b_out
::call CallX.bat  "source=%this%;destination=a.bat;label=b_out"  ����1  ����2  ����3  ����4  ����5  ����6  ����7  ����8  
echo.
::echo ����3��a.bat ����  �еı�ǩ b_out
::call CallX.bat  "source=%this%;destination=;label=b_out"  ����1  ����2  ����3  ����4  ����5  ����6  ����7  ����8  




::::::::::::::::::::::��������:::::::::::::::::::::::::
:: cd��ת����ǰ�ű�Ŀ¼
cd %~dp0

:: ������Ŀ¼
set root=%~dp0
:: ·������Script\sh\�滻Ϊ��
set root=%root:Script\sh\=%

:: Դ��Ŀ¼ 
::set source_dir=%root%s
set source_dir=%root%source_md

:: Դĩ��Ŀ¼ (%source_dir%\*\%source_mo%)
::set source_mo=c
set source_mo=doc\md

:: Ŀ���Ŀ¼ 
::set dest_dir=%root%s1
set dest_dir=%root%source\_posts\Dev

:: ������ģ�����ø�Ŀ¼
set SubModuleConfRoot=%root%.git\modules\source_md
::::::::::::::::::::::��������:::::::::::::::::::::::::
if %debug%==1 echo shellpath: %~dp0
if %debug%==1 echo root: %root%
if %debug%==1 echo source_dir : %source_dir%
if %debug%==1 echo dest_dir : %dest_dir%



:: ָ��Ŀ¼�µ�/������Ŀ¼(*)/ָ�����·�����ض��ļ�(\c\c.txt)
call CallX.bat  "source=%this%;destination=conf.bat;label=ReadDirRelativePathFile"  "%SubModuleConfRoot%"  "\myconf\copy.conf"  1  %this%:cb03    ����05  ����06  ����07  ����08  ����09

GOTO:EOF
:cb03
if %debug%==1 echo -------------cb03-----------
if %debug%==1 echo �ļ�����·��(arg1): %~1
if %debug%==1 echo ����(arg2): %~2
if %debug%==1 echo ����(arg3): %~3
if %debug%==1 echo ����(arg4): %~4
if %debug%==1 echo ����(arg5): %~5
if %debug%==1 echo ����(arg6): %~6
if %debug%==1 echo ����(arg7): %~7
if %debug%==1 echo ����(arg8): %~8
if %debug%==1 echo ����(arg9): %~9
if %debug%==1 echo -------------cb03-----------
if %debug%==1 echo �ļ�����: %~2
if %debug%==1 echo �ļ�����: %~3

:: ���ú�����ȡ������
call CallX.bat "source=%this%;destination=conf.bat;label=ConfRead"  "%~1"  %this%:ccb  %~2
		
GOTO:EOF


GOTO:EOF
:ccb
if %debug%==1 echo ------------ccb--------------
if %debug%==1 echo status : !status!
if %debug%==1 echo dirname : %dirname%
if %debug%==1 echo ������: %~1
if %debug%==1 echo �ļ�·��: %~2
if %debug%==1 echo source_dir : %source_dir%
if %debug%==1 echo dest_dir : %dest_dir%


::EQU - ����
if "%status%" EQU "1" (
	if %debug%==1 echo ----source: !source_dir!\%dirname% 
	if %debug%==1 echo ------dest: !dest_dir!\%dirname%
	:: ����Ŀ¼�����ļ�  ���޸�������Ϣ
	xcopy !source_dir!\%dirname%\%source_mo%  !dest_dir!\%dirname%  /E/Y/I  && (
		echo ԴĿ¼ [ %dirname% ] ���Ƴɹ�
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
