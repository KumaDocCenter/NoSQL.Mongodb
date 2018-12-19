:: =================================================================== ::
:: �����ļ����� 
:: 
:: ReadAllSubDirRelativePathFile : ��ȡ������Ŀ¼�������ض��ļ�
:: ReadDirRelativePathFile  :  ��ȡĿ¼�����·���ļ�
:: ReadAllSubDir  :  ��ȡ������Ŀ¼
:: ReadDirFile  : ��ȡָ��Ŀ¼����ָ���ļ�
:: ConfRead  :  ��ȡ������
:: 
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
::setlocal EnableDelayedExpansion
:: ��ǰ�ļ���
set this=%0
:: �Ƿ�Ϊ����ļ�
set is_index=0
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
:::ReadAllSubDirRelativePathFile_test

::call :ReadAllSubDirRelativePathFile  "K:\FAQ\CMD\CMD֪ʶ\������·�����\s\"   c.txt  cb04

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
:: �������ƣ�ReadAllSubDirRelativePathFile			  ::
:: �������ܣ���ȡ������Ŀ¼�������ض��ļ�			  ::
:: ����������arg1: ������Ŀ¼�ĸ�Ŀ¼ 				  ::
::           	   �磬K:\FAQ\CMD\s\ 				  ::
::           arg2: �ļ��� 						  	  ::
::            	   �磬c.txt	 					  ::
::           arg3: �ص�����(���ջص�) 				  ::
::                 ��ʽ�� File:Label  �� Label 		  ::
::       [arg4-9]: �ص������Ĳ���					  ::
:: ����ֵ�� 									 	  ::
:: 		%~1: ��Ŀ¼����·��				 	 		  ::
::		     �磬K:\FAQ\CMD\s\4\	  	  		 	  ::
:: 	  %~2-8: �ص������Ĳ���	[arg3-9]			 	  ::
:: ================================================== ::
:: ָ��Ŀ¼�µ�/������Ŀ¼(*)/�����ض��ļ�(c.txt)
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

:: ��ȡ������Ŀ¼
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

:: ��ȡĿ¼������ָ���ļ�
call :ReadDirFile  %~1  %~2  %~3 %~4  %~5  %~6  %~7  %~8  %~9
GOTO:EOF

GOTO:EOF
:: ==========[Function]================================================================== ::



:: ==========[Function]================================================================== ::
:::ReadDirRelativePathFile_test
:::::::: ����ʾ�� ::::::::
::call :ReadDirRelativePathFile "K:\FAQ\CMD\CMD֪ʶ\������·�����\s"  "\c\c.txt"  0  cb03    ����05 ����06  ����07  ����08  ����09
::call :ReadDirRelativePathFile "K:\FAQ\CMD\CMD֪ʶ\������·�����\s"  \c\c.txt  1  cb03    ����05 ����06  ����07  ����08  ����09
::GOTO:EOF
:::cb03
::echo -------------cb03-----------
::echo �ļ�����·��(arg1): %~1
::echo ����(arg2): %~2
::echo ����(arg3): %~3
::echo ����(arg4): %~4
::echo ����(arg5): %~5
::echo ����(arg6): %~6
::echo ����(arg7): %~7
::echo ����(arg8): %~8
::echo ����(arg9): %~9
::echo -------------cb03-----------
::GOTO:EOF


GOTO:EOF
:: ================================================== ::
:: �������ƣ�ReadDirRelativePathFile				  ::
:: �������ܣ���ȡĿ¼�����·���ļ�			  		  ::
:: ����������arg1: ��Ŀ¼ 				 			  ::
::            	   �磬K:\FAQ\CMD\s 				  ::
::           arg2: �ļ����·��(�����ļ���) 		  ::
::            	   �磬\c\c.txt						  ::
::           arg3: (is_dirs)�Ƿ�ƥ��Ŀ¼�µ�һ����Ŀ¼::
::                 ֵ(0/1) 	Ĭ�� 0					  ::
::           arg4: �ص�����							  ::
::                 ��ʽ�� File:Label  �� Label 		  ::
::       [arg5-8]: �ص������Ĳ���					  ::
:: ����ֵ�� 									 	  ::
:: 		%~1: �ļ�����·��(·����ʵ����У��)			  ::
::		     �磬K:\FAQ\CMD\s\4\c\c.txt	  	  		  ::
:: 	  	%~2: �ļ�����			 	  				  ::
:: 	  		 ÿ���ļ�����1������			 	  	  ::
:: 	  	%~3: �ļ�����			 	  				  ::
:: 	  %~4-9: �ص������Ĳ���	[arg5-8]			 	  ::
:: ================================================== ::
:: ָ��Ŀ¼�µ�/ָ�����·�����ض��ļ�(\c\c.txt)
:: ָ��Ŀ¼�µ�/������Ŀ¼(*)/ָ�����·�����ض��ļ�(\c\c.txt)
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

:: �ļ�����
set FileIndex=0

:: �ļ�����
set FileCount=1

:: is_dirs ��������  EQU - ���� 
if "%~3" EQU "" (
	set is_dirs=0
) else (
	set is_dirs=%~3
)
if %debug%==1 echo is_dirs: %is_dirs%

:: �ص����� ��������     NEQ - ������
if  "%~4" NEQ ""  (
	:: ��ʽ�� File:Label  �� Label
	for /f "tokens=1,2  delims=:" %%a in ( "%~4" ) do (
		:: NEQ - ������
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


:: ָ��Ŀ¼�µ�/ָ�����·�����ض��ļ�(\c\c.txt)
if %is_dirs% == 0 (
	::����ȫ·��
	set fullpath=%~1%~2
	if %debug%==1 echo fullpath: !fullpath!
	
	:: ���ú��������ݲ��� 
	if exist !fullpath! (
		call CallX.bat  "source=%this%;destination=!ReadDirRelativePathFile_callDestination!;label=!ReadDirRelativePathFile_callLabel!"   !fullpath!   !FileIndex!  !FileCount!  %~5  %~6   %~7  %~8  %~9
		set /a  FileIndex+=1
		set /a  FileCount+=1
	)
)

:: ----------------------------------------------------------------
:: �����͡�
:: ʾ������: K:\FAQ\CMD\s  cb02
:: FOR /d %%b in ( %~1\* )  do (...) 
:: /d  ��� %~1\* ��ͨ������ɱ���Ŀ¼�µ�������Ŀ¼��һ����Ŀ¼
:: ����磬
:: K:\FAQ\CMD\s\1
:: K:\FAQ\CMD\s\2
:: K:\FAQ\CMD\s\3
:: 
:: ��󽫽�����ݸ��ص����� 
:: ----------------------------------------------------------------	
:: ָ��Ŀ¼�µ�/������Ŀ¼(*)/ָ�����·�����ض��ļ�(\c\c.txt)
if %is_dirs% == 1 (
	for /d %%b in ( %~1\* ) do (
		if %debug%==1 echo [b: %%b ]
		if %debug%==1 echo ThisFileRoot: %%b 
		
		::����ȫ·��
		set fullpath=%%b%~2
		if %debug%==1 echo fullpath: !fullpath!

		:: ���ú��������ݲ��� 
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
:::::::: ����ʾ�� ::::::::
:: Ŀ¼��������б����Ӱ��
::call :ReadAllSubDir "K:\FAQ\CMD\CMD֪ʶ\������·�����\s\"   cb02  ����03  ����04  ����05 ����06  ����07  ����08  ����09
::GOTO:EOF
:::cb02
::echo -------------cb02-----------
::echo ��Ŀ¼����·��(arg1): %~1
::echo ����(arg2): %~2
::echo ����(arg3): %~3
::echo ����(arg4): %~4
::echo ����(arg5): %~5
::echo ����(arg6): %~6
::echo ����(arg7): %~7
::echo ����(arg8): %~8
::echo ����(arg9): %~9
::echo -------------cb02-----------
::GOTO:EOF


GOTO:EOF
:: ================================================== ::
:: �������ƣ�ReadAllSubDir							  ::
:: �������ܣ���ȡ������Ŀ¼			  				  ::
:: ����������arg1: ������Ŀ¼�ĸ�Ŀ¼ 				  ::
::           	   �磬K:\FAQ\CMD\s\ 				  ::
::           arg2: �ص����� 						  ::
::                 ��ʽ�� File:Label  �� Label 		  ::
::       [arg3-9]: �ص������Ĳ���					  ::
:: ����ֵ�� 									 	  ::
:: 		%~1: ��Ŀ¼����·��				 	 		  ::
::		     �磬K:\FAQ\CMD\s\4\	  	  		 	  ::
:: 	  %~2-8: �ص������Ĳ���	[arg3-9]			 	  ::
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

:: �ص����� ��������     NEQ - ������
if  "%~2" NEQ ""  (
	:: ��ʽ�� File:Label  �� Label
	for /f "tokens=1,2  delims=:" %%a in ( "%~2" ) do (
		:: NEQ - ������
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
:: �����͡�
:: ʾ������: K:\FAQ\CMD\s\  cb02
:: for /d %%b in ( %~1* ) do (...)
:: /d  ��� %~1* ��ͨ������ɱ���Ŀ¼�µ�������Ŀ¼��һ����Ŀ¼
:: ����磬
:: K:\FAQ\CMD\s\1
:: K:\FAQ\CMD\s\2
:: K:\FAQ\CMD\s\3
:: 
:: ��󽫽�����ݸ��ص�����
:: ----------------------------------------------------------------
for /d %%b in ( %~1* ) do (
   if %debug%==1 echo [b: %%b ]
   if %debug%==1 echo ThisFileRoot: %%b 

   :: ���ú��������ݲ���	
   call CallX.bat  "source=%this%;destination=!ReadAllSubDir_callDestination!;label=!ReadAllSubDir_callLabel!"  "%%b\"    %~3  %~4  %~5  %~6  %~7  %~8  %~9
)
GOTO:EOF
:: ==========[Function]================================================================== ::




:: ==========[Function]================================================================== ::
::ReadDirFile_test
:::::::: ����ʾ�� ::::::::
:: Ŀ¼��������б����Ӱ��
::call :ReadDirFile "K:\FAQ\CMD\CMD֪ʶ\������·�����\s\1\"  c.txt  cb01  ����04  ����05 ����06  ����07  ����08  ����09
::GOTO:EOF
:::cb01
::echo -------------cb01-----------
::echo �ļ�����·��(arg1): %~1
::echo �ļ�����(arg2): %~2
::echo �ļ�����(arg3): %~3
::echo ����(arg4): %~4
::echo ����(arg5): %~5
::echo ����(arg6): %~6
::echo ����(arg7): %~7
::echo ����(arg8): %~8
::echo ����(arg9): %~9
::echo -------------cb01-----------
::GOTO:EOF


GOTO:EOF
:: ================================================== ::
:: �������ƣ�ReadDirFile							  ::
:: �������ܣ���ȡָ��Ŀ¼����ָ���ļ�				  ::
:: ����������arg1: Ŀ¼·�� 						  ::
::                 �磬 K:\FAQ\CMD\s\4\				  ::
::           arg2: �ļ��� 						  	  ::
::                 �磬 c.txt						  ::
::           arg3: �ص����� 						  ::
::                 ��ʽ�� File:Label  �� Label 		  ::
::       [arg4-9]: �ص������Ĳ��� 					  ::
:: ����ֵ�� 									 	  ::
:: 		%~1: ʵ�ʴ��ڵ��ļ��ľ���·��				  ::
::		     �磬K:\FAQ\CMD\s\4\c\c.txt	  	  		  ::
:: 		%~2: �ļ�����				 	  		  	  ::
:: 		     ÿ���ļ�����1������				 	  ::
:: 		%~3: �ļ�����				 	  		  	  ::
:: 	  %~4-9: �ص������Ĳ���				 	  		  ::
:: ================================================== ::
:: ָ��Ŀ¼�µ�/�����ض��ļ�(c.txt) 
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

:: �ļ�����
set ReadDirFile.FileIndex=0

:: �ļ�����
set ReadDirFile.FileCount=1

:: �ص����� ��������     NEQ - ������
if  "%~3" NEQ ""  (
	:: ��ʽ�� File:Label  �� Label
	for /f "tokens=1,2  delims=:" %%a in ( "%~3" ) do (
		:: NEQ - ������
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
:: �����͡�
:: ʾ������:  K:\FAQ\CMD\s\4\  c.txt  cb01
:: FOR /R [[drive:]path] %variable IN (set) DO command [command-parameters]
:: 
:: �ݹ����ָ���ļ�(ʵ�ʴ��ڵ��ļ�)�� /r ���ָ��·��
:: (set)��Ϊ�����ļ���������ͨ�������ö�ٸ�Ŀ¼�������оٸ�Ŀ¼���������������Ŀ¼����
:: ������set�е�ָ���ļ��Ƿ���ڡ�
:: 
:: Ŀ¼������(set)��β���磬K:\FAQ\CMD\s\4\c\c.txt
:: ���ԣ���Ҫ if exist %%i �ж��ļ��Ƿ����
:: ----------------------------------------------------------------
for /r "%~1" %%i in (%~2) do if exist %%i  (
	if %debug%==1 echo ReadDirFile--- %%i  do anything  
	
	:: ���ú��������ݲ��� 
	call CallX.bat  "source=%this%;destination=!ReadDirFile_callDestination!;label=!ReadDirFile_callLabel!"   "%%i"  !ReadDirFile.FileIndex!  !ReadDirFile.FileCount!  %~4  %~5  %~6  %~7  %~8  %~9
	
	set /a  ReadDirFile.FileIndex+=1
	set /a  ReadDirFile.FileCount+=1
) 
GOTO:EOF
:: ==========[Function]================================================================== ::




:: ==========[Function]================================================================== ::
:::ConfRead_test
:::::::: ����ʾ�� ::::::::
:: ģ���ȡ����ļ�
:: ע��
:: ���������ڻص������д�������Ч����Ӧ����for�д���
:: 

:: ��ȷ�Ĵ���������
::set /a idx=0
::for /l %%i in (1,1,4) do (
::	::call :ConfRead "K:\FAQ\CMD\CMD֪ʶ\������·�����\s\%%i\c\c.txt"  ccb  !idx!
::	call :ConfRead "K:\FAQ\CMD\CMD֪ʶ\������·�����\s\%%i\c\c.txt"  ccb  
::	set /a idx+=1	
::)
::echo ---------�鿴�������õı���-------------
::set ConfReadArr
::echo ---------�鿴�������õı���-------------

::GOTO:EOF
:::ccb
::echo ------------ccb--------------
:: ����Ĵ���������
::set /a idx+=1
::echo idx: %idx%
::echo ������: %~1
::echo ------------ccb--------------
::GOTO:EOF



GOTO:EOF
:: ================================================== ::
:: �������ƣ�ConfRead								  ::
:: �������ܣ���ȡ������								  ::
:: ����������arg1: �ļ�·�� 						  ::
::           arg2: �ص����� 						  ::
::           	   ��ʽ�� File:Label  �� Label 	 	  ::
::           arg3: ������ 						  	  ::
::                 ��Ϊ�ļ�Ψһ�Ե����� 		  	  ::
::       [arg4-9]: �ص������Ĳ��� 					  ::
:: ����ֵ�� 									 	  ::
:: 		     ֱ���ڻ�ȡ����			 				  ::
:: 			 ConfReadArr[arg3].key=value			  ::
:: 			 key=value					  			  ::
::			 �磬ConfReadArr[0].Value=Hello World	  ::
::			 ��Value=Hello World	  	  			  ::
:: 		%~1: ������			 				  		  ::
:: 		%~2: �ļ�·��		 				  		  ::
:: 	  %~3-9: �ص������Ĳ���[arg4-9]			 		  ::
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

:: �±괦��  NEQ - ������
if  "%~3" NEQ "" (
	:: ���յ�����������Ϊ�ļ�Ψһ�Ե�����
	SET ConfRead.index=%~3
) else (
	:: û�е���������ʱ����ʼ��   EQU - ���� <TODO: else ����>	
	if "%ConfRead.index%" EQU "" (
		:: ����������ʱ
		set /a ConfRead.index=0
	) else (
		:: ��������ʱ +1
		set /a ConfRead.index+=1
	) 	
)
if %debug%==1 echo �ļ�����: !ConfRead.index!
if %debug%==1 echo filepath : %~1

:: �ص����� ��������     NEQ - ������
if  "%~2" NEQ ""  (
	:: ��ʽ�� File:Label  �� Label
	for /f "tokens=1,2  delims=:" %%a in ( "%~2" ) do (
		:: NEQ - ������
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
:: �����͡�
:: ʾ���ļ�(%~1)�е����ݣ� name=ac1
::
:: for /f "usebackq tokens=1,2 delims==" %%i in ( "%~1" ) do (...)
:: 		delims==     ���ָ���Ϊ =
:: 		tokens=1,2   : ���ָ���ĵ�1��(name)�͵�2������(ac1)���ݸ�for���ñ���
:: 		%%i,%%j,%%k  ��for���ñ������ֱ���յ�1��2��3������
:: 		usebackq     : ��� "%~1" �е����ţ��ܴ�������ո��·��
::
:: ���������б����󣬵��ûص�����������ȡ��Щ����
:: 
:: set ConfReadArr[%ConfRead.index%].%%i=%%j
:: ���ݷ��صĸ�ʽ�� 
:: 		ConfReadArr[0].Name=Test1
::		ConfReadArr[0].Value=Hello World
:: ----------------------------------------------------------------
for /f "usebackq tokens=1,2 delims==" %%i in ( "%~1" ) do (
	if %debug%==1 echo -------ConfRead��!v! ---------	
	if %debug%==1 echo [i: %%i ][j: %%j  ] 
	
	:: ���ñ���
	set %%i=%%j
	set ConfReadArr[!ConfRead.index!].%%i=%%j	
	
	if %debug%==1 set ConfReadArr[!ConfRead.index!].%%i
	if %debug%==1 echo -------ConfRead��!v! ---------
	if %debug%==1 set /a v+=1
)
:: ���ú���
call CallX.bat  "source=%this%;destination=!ConfRead_callDestination!;label=!ConfRead_callLabel!"  !ConfRead.index!  "%~1"  %~4  %~5  %~6  %~7  %~8  %~9
::ENDLOCAL
GOTO:EOF
:: ==========[Function]================================================================== ::




:: ================================================== ::
:: �������ƣ�EOF  								      ::	
:: �������ܣ���������								  :: 
:: ���������� 						                  ::	
:: ================================================== ::
:EOF
if %debug%==1 echo EOF....%this%....EOF

