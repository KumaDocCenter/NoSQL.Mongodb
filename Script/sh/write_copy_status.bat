:: =================================================================== ::
::  д��״̬���ݵ��ض��ļ�
:: 
:: ���Ŀ¼�� ./Script/sh 
:: ����Ŀ¼�� ./
::
:: [ע��]
:: �����git���ӵ��ô˽ű����乤��Ŀ¼���ǲֿ��Ŀ¼��
:: ���ԣ�����Ҫ cd �ı�Ŀ¼��
::
:: ��git�����п���ͨ�����·�ʽ���˽ű����Ƶ���Ŀ¼ִ��
:: [�����]
:: # ���ƽű�
:: cp ./Script/sh/write_copy_status.bat  ./write_copy_status.bat
:: 
:: # �������
:: echo   >>./write_copy_status.bat
:: echo :: ɾ���ű�����>>./write_copy_status.bat
:: echo "del %0">>./write_copy_status.bat
:: 
:: # ִ�нű�
:: ./write_copy_status.bat  $@
:: [/�����]
:: =================================================================== ::

:: �رջ���
@echo off
:: ���������ӳ�
setlocal enabledelayedexpansion
:: ���Կ���
set debug=1

:: �ƶ�����Ŀ¼ 
::cd ..

::[git���ݿ�·���� " ../../.git/modules/source_md/Ajax" ]
::[ȥ����λ��ֵ��"../../.git/modules/source_md/Ajax" ]
REM ��ȡ .git �ļ�����ȡ��ģ��git���ݿ�·��
for /f "usebackq tokens=1-2 delims=" %%a in (".git") do (
	REM ����������
	for /f "usebackq tokens=1-2 delims=:" %%i in ('%%a') do (
		if %debug%==1 echo [git���ݿ�·���� "%%j" ]
		REM ȥ����λ��ֵ
		set gitdir=%%j
		set gitdir=!gitdir:~1!
		if %debug%==1 echo [ȥ����λ��ֵ��"!gitdir!" ]
	)
)


::����ļ��в����ڣ������ļ���
if not exist "!gitdir!/myconf/"  mkdir "!gitdir!/myconf"

::д��״̬����
for %%i in ("%~dp0\.") do (
  ::echo ��������ĸ��ļ�����: %%~ni  
  echo status=^1>!gitdir!/myconf/copy.conf
  echo dirname=^%%~ni>>!gitdir!/myconf/copy.conf
)


