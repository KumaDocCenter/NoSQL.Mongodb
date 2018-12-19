:: =================================================================== ::
:: git��ģ�鴦��
:: 
::	submodule_s  	  �� ����������ģ��
::	submodule_add     �� �����ģ��
::	submodule_init    �� ��ʼ����ģ��
::	submodule_update  �� ������ģ��
::	submodule_del  	  �� ɾ����ģ��	
:: 
:: 
:: ���Ŀ¼�� ./Script/sh 
:: ����Ŀ¼�� ./ 
:: 
:: ֻ�����ض�Ŀ¼(source_md)�µ���ģ��
:: =================================================================== ::

:::::::::::::::: ����Ԥ���� ::::::::::::::::
:: �رջ���
@echo off
:: ���Կ���
set debug=0
:: ���������ӳ�
::setlocal EnableDelayedExpansion
:: ��ǰ�ļ���
set this=%0
:: �Ƿ�Ϊ����ļ�
set is_index=0

:: cd��ת����Ŀ¼(��Ϊ��ǰ���Ŀ¼��./Script/sh��������Ҫ����)
cd %~dp0
cd..
cd..
:: ���ø�Ŀ¼·��
set root=%cd%
:: ���õ�ǰ�ű�·��
set thispath=%~dp0
:: ������ģ���Ŀ¼
set SubModuleRoot=source_md
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



:: ==========[Function]================================================================== ::
::submodule_s_test
:::::::: ����ʾ�� ::::::::
::set spath=.git\myconf\submodule\staged
::set dpath=.git\myconf\submodule\ok

::call CallX.bat  "source=%this%;destination=submodule.bat;label=submodule_s"  %spath%  %dpath%


GOTO:EOF
:: ================================================== ::
:: �������ƣ�submodule_s							  ::
:: �������ܣ�����������ģ��							  ::
:: ����������arg1: �ļ�Դ·�� 						  ::
::           	   ÿ��һ��key=value	 			  ::
::  			   .add      �����ģ��				  ::
::  			   .init	 ��ʼ����ģ��			  ::
:: 				   .update	 ������ģ��				  ::
::  			   .del		 ɾ����ģ��		 		  ::
::           arg2: �ļ�Ŀ��·�� 					  ::
::           	   ��Դ·���ļ���������Ƶ���	 	  ::
:: ����ֵ�� 									 	  ::
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

:: Ŀ¼�����ڣ��򴴽�
IF NOT EXIST "%cd%\%~2" ( mkdir "%cd%\%~2" )

if %debug%==1 set f=0
:: ----------------------------------------------------------------
:: �����͡�
:: ʾ�����ݣ�
:: 
:: ����ָ��Ŀ¼�µ��ļ� 
:: for /f "usebackq tokens=* delims=" %%i in (`dir %cd%\%~1\*.*  /a-d/s/b`) do (...)
:: 		delims=      ���ָ���ΪĬ�ϣ�����
:: 		tokens=*     : ��һ������Ϊ����
:: 		%%i			 ��for���ñ������ֱ���յ�1������
:: 		usebackq     : ��� in (``) �еķ����ţ������з����Ű���������
::
:: dir %cd%\%~1\*.*  /a-d/s/b
:: �г�ָ��Ŀ¼�������ļ�����
:: K:\Script\sh\a.txt
:: K:\Script\sh\b.txt
:: K:\Script\sh\c.txt
:: 
:: 
:: ��ȡÿ���ļ��е����ã�key=value
:: for /f "usebackq eol=# tokens=1,2 delims==" %%a in ( "%%i" ) do (...)
:: 		delims==     ���ָ���Ϊ =
:: 		tokens=1,2   : ���ݷָ�������ݸ�1��2������
:: 		%%a,%%b		 ��for���ñ��������ղ�����%%a(key),%%b(value)
:: 		usebackq     : ��� in ("") �еķ����ţ�˫����""�����ļ��� 
:: 		eol=#	     : ����#��ͷ���� 
::
::	��Ҫ����ȡÿ���ļ��е����ã������ļ���׺���ò�ͬ�ĺ���������
::   ��׺   		����
::  .add     	 �����ģ��	
::  .init		 ��ʼ����ģ��
::  .update		 ������ģ��
::  .del		 ɾ����ģ��
:: ----------------------------------------------------------------
for /f "usebackq tokens=* delims=" %%i in (`dir %cd%\%~1\*.*  /a-d/s/b`) do (
	if %debug%==1 echo -------FileCount��!f! ----------------	
	if %debug%==1 echo [i: %%i ][prefx: %%~xi ]
	
	if %debug%==1 set v=0
	for /f "usebackq eol=# tokens=1,2 delims==" %%a in ( "%%i" ) do (
		if %debug%==1 echo -------VarCount��!v! ---------
		if %debug%==1 echo [a: %%a ][b: %%b  ]
		
		:: ���ñ���
		set %%a=%%b
		if %debug%==1 set %%a
		
		if %debug%==1 echo -------VarCount��!v! ---------
		if %debug%==1 set /a v+=1
	)
	REM !sh! �ӱ����ж�ȡ���ǲ�������	
	:: ɾ����ģ�飨���ú������ƶ��ļ���    EQU - ����
	if "%%~xi"  EQU ".del" (
		call :submodule_del  0  !name!  !sh!  !sh2!
		move /Y %%i  %cd%\%~2
	)
	
	:: �����ģ�飨���ú������ƶ��ļ���    EQU - ����
	if "%%~xi"  EQU ".add" (
		call :submodule_add  !git!  !name! !branch!  !sh!  !sh2!
		move /Y %%i  %cd%\%~2
	)
	
	:: ��ʼ����ģ�飨���ú������ƶ��ļ���    EQU - ����
	if "%%~xi"  EQU ".init" (
		call :submodule_init   !name!   !sh!  !sh2!
		move /Y %%i  %cd%\%~2
	)
	
	:: ������ģ�飨���ú������ƶ��ļ���    EQU - ����
	if "%%~xi"  EQU ".update" (
		call :submodule_update  !name!   !sh!  !sh2!
		move /Y %%i  %cd%\%~2
	)
	
	if %debug%==1 echo -------FileCount��!f! ----------------
	if %debug%==1 set /a f+=1
)
GOTO:EOF
:: ==========[Function]================================================================== ::





:: ==========[Function]================================================================== ::
::submodule_add_test
:::::::: ����ʾ�� ::::::::
:: �����ļ�������
::set destpath=public

:: ����Զ�ֿ̲�
::set gitref=https://github.com/KumaDocCenter/Ajax.git

:: ������ģ���֧
::set branch=master

::call CallX.bat  "source=%this%;destination=submodule.bat;label=submodule_add"  %gitref%  
::call CallX.bat  "source=%this%;destination=submodule.bat;label=submodule_add"  %gitref%  %destpath%  %branch%


GOTO:EOF
:: ================================================== ::
:: �������ƣ�submodule_add							  ::
:: �������ܣ������ģ��								  ::
:: ����������arg1: git��ַ 						  	  ::
::                 �磬https://github.com/ter/Ajax.git::
::         [arg2]: ��ģ���� 						  ::
::                 ��ģ�����·��					  ::
::         [arg3]: ��ģ���֧ 						  ::
::         [arg4]: ��ִ�нű�·��					  ::
::         [arg5]: ��ִ�нű�·��					  ::
:: ����ֵ�� 									 	  ::
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


:: ��ǿ��
::git submodule add -b %branch%  %gitref%  %destpath%

:: ǿ�� -f   NEQ - ������
if  "%~3" NEQ ""  (
	echo �����ģ��[ %SubModuleRoot%/%~2 ]...
	git submodule add -b %~3 -f  %~1  %SubModuleRoot%/%~2
) else (
	echo �����ģ��[ %~1 ]...
	git submodule add  -f  %~1  %SubModuleRoot%/%~2
)
:: NEQ - ������ 
if "%~4" NEQ "" (
	echo ִ�нű�1...
	start %~4   %~2  %~1  %~3
)
:: NEQ - ������ 
if "%~5" NEQ "" (
	echo ִ�нű�2...
	start %~5   %~2  %~1  %~3
)
GOTO:EOF
:: ==========[Function]================================================================== ::



:: ==========[Function]================================================================== ::
::submodule_init_test
:::::::: ����ʾ�� ::::::::
:: �����ļ�������
::set destpath=public
::call CallX.bat  "source=%this%;destination=submodule.bat;label=submodule_init"  
::call CallX.bat  "source=%this%;destination=submodule.bat;label=submodule_init"  %destpath% 



GOTO:EOF
:: ================================================== ::
:: �������ƣ�submodule_init							  ::
:: �������ܣ���ʼ����ģ��				  			  ::
:: ����������[arg1]: ��ģ����  						  ::
::                   ��ģ�����·��					  ::
::           [arg2]: ��ִ�нű�·��					  ::
::           [arg3]: ��ִ�нű�·��					  ::
:: ����ֵ�� 									 	  ::
:: 													  ::
:: ================================================== ::
:submodule_init
:: ��������ʼ����.git/config�м�¼����ģ������
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


:: --��ʼ��������ģ��
::git submodule init  %destpath%

:: --��ʼ��������ģ��
::git submodule init


:: NEQ - ������
if  "%~1" NEQ ""  (
	echo ��ʼ����ģ��[ %SubModuleRoot%/%~1 ]...
	git submodule init  %SubModuleRoot%/%~1
) else (
	echo ��ʼ��������ģ��...
	git submodule init
)
:: NEQ - ������ 
if "%~2" NEQ "" (
	echo ִ�нű�1...
	start %~2  %~1
)
:: NEQ - ������ 
if "%~3" NEQ "" (
	echo ִ�нű�2...
	start %~3  %~1
)
GOTO:EOF
:: ==========[Function]================================================================== ::




:: ==========[Function]================================================================== ::
::submodule_update_test
:::::::: ����ʾ�� ::::::::
:: �����ļ�������
::set destpath=public
::call CallX.bat  "source=%this%;destination=submodule.bat;label=submodule_update"  
::call CallX.bat  "source=%this%;destination=submodule.bat;label=submodule_update"  %destpath% 



GOTO:EOF
:: ================================================== ::
:: �������ƣ�submodule_update						  ::
:: �������ܣ�������ģ��								  ::
:: ����������[arg1]: ��ģ����  						  ::
::                   ��ģ�����·��					  ::
::           [arg2]: ��ִ�нű�·��					  ::
::           [arg3]: ��ִ�нű�·��					  ::
:: ����ֵ�� 									 	  ::
:: 													  ::
:: ================================================== ::
:submodule_update
:: ������ ��¡ȱʧ����ģ�鲢������ģ��Ĺ�����(���Ĭ�Ϸ�֧master) 
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


:: --���µ�����ģ��
::git submodule update  %destpath%
::git submodule update --checkout    %destpath%

:: --����������ģ��
::git submodule update

:: NEQ - ������
if  "%~1" NEQ ""  (
	echo ������ģ��[ %SubModuleRoot%/%~1 ]...
	git submodule update  %SubModuleRoot%/%~1
) else (
	echo ����������ģ��...
	git submodule update
)
:: NEQ - ������ 
if "%~2" NEQ "" (
	echo ִ�нű�1...
	start %~2  %~1
)
:: NEQ - ������ 
if "%~3" NEQ "" (
	echo ִ�нű�2...
	start %~3  %~1
)
GOTO:EOF
:: ==========[Function]================================================================== ::



:: ==========[Function]================================================================== ::
::submodule_del_test
:::::::: ����ʾ�� ::::::::
:: �����ļ�������
::set destpath=public
::call CallX.bat  "source=%this%;destination=submodule.bat;label=submodule_del"  0  %destpath%
::call CallX.bat  "source=%this%;destination=submodule.bat;label=submodule_del"  1  


GOTO:EOF
:: ================================================== ::
:: �������ƣ�submodule_del							  ::
:: �������ܣ�ɾ����ģ��								  ::
:: ����������arg1: ɾ������( 1 or 0) 			 	  ::
::                 1:ɾ�����У�0:ɾ������			  ::
::         [arg2]: ��ģ���� 						  ::
::                 ��ģ�����·��					  ::
::         [arg3]: ��ִ�нű�·��					  ::
::         [arg4]: ��ִ�нű�·��					  ::
:: ����ֵ�� 									 	  ::
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
:: �����͡�
:: ɾ��������ģ��
:: git submodule status  �� ��ʾ��ģ���״̬��
:: ���� git submodule status ������������ȡ��ģ������Ȼ����ɾ����ģ�顣
::
:: ----------------------------------------------------------------
:: NEQ - ������  EQU - ����
if  "%~1" EQU "1"  (
	echo ɾ��������ģ��...
	for /f "usebackq tokens=* delims=" %%a in (` git submodule status `) do (
		if %debug%==1 echo a: %%a
		for /f "usebackq tokens=1-3 delims= " %%i in ( '%%a' ) do (
			echo -----[��ģ�飺%SubModuleRoot%/%%j ]--------------------------------------------------
			if %debug%==1 echo i: "%%i"
			if %debug%==1 echo j: "%%j"
			if %debug%==1 echo k: "%%k"
			
			echo ��ģ���¼��.git/config��ɾ���������ģ��Ŀ¼������
			git  submodule deinit -f %SubModuleRoot%/%%j
			
			echo ��ģ���¼��.gitmodules��ɾ���������ģ��Ŀ¼
			git rm -rf %SubModuleRoot%/%%j
			
			echo ɾ����ģ�����ݿ�
			rd /s/q  .git\modules\%SubModuleRoot%\%%j
			echo -----[��ģ�飺%SubModuleRoot%/%%j ]--------------------------------------------------
		)
	)
) else (
	if  "%~2" NEQ ""  (		
		echo -----[��ģ�飺%SubModuleRoot%/%~2 ]--------------------------------------------------
		echo ɾ����ģ��[ %SubModuleRoot%/%~2 ]...
		echo ��ģ���¼��.git/config��ɾ���������ģ��Ŀ¼������
		git  submodule deinit -f %SubModuleRoot%/%~2
		
		echo ��ģ���¼��.gitmodules��ɾ���������ģ��Ŀ¼
		git rm -rf %SubModuleRoot%/%~2
		
		echo ɾ����ģ�����ݿ�
		rd /s/q  .git\modules\%SubModuleRoot%\%~2
		echo -----[��ģ�飺%SubModuleRoot%/%~2 ]--------------------------------------------------
	) else (
		echo ȱ�ٲ���[ ��ģ���� ]
	)
)
:: NEQ - ������ 
if "%~3" NEQ "" (
	echo ִ�нű�1...
	start %~3   %~2
)
:: NEQ - ������ 
if "%~4" NEQ "" (
	echo ִ�нű�2...
	start %~4   %~2
)
GOTO:EOF
:: ==========[Function]================================================================== ::




:: ================================================== ::
:: �������ƣ�EOF  								      ::	
:: �������ܣ���������								  :: 
:: ���������� 						                  ::	
:: ================================================== ::
:EOF
if %debug%==1 echo EOF....%this%....EOF