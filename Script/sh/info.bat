:: ============================================================================= ::
:: �ֿ�������Ϣ
::
:: ���˽ű���ScriptĿ¼һ���Ƶ��Ӳֿ��Ŀ¼��
:: ע�� ͨ��������˽ű�������ϻ�ɾ������
::
:: ���Ŀ¼�� ./Script/sh 
:: ����Ŀ¼�� ./ 
:: 
:: ��shĿ¼���⣬����ɾ���ű�����
:: ============================================================================= ::

:: �رջ���
@echo off
:: ���������ӳ�
setlocal EnableDelayedExpansion

:: ������ģ���Ŀ¼
set SubModuleRoot=source_md

:: ����ת���ű�Ŀ¼
cd %~dp0

REM %~dp0 : K:\...\Script\sh\ 
:: ������(���Ŀ¼��./Script/sh)
:: NEQ - ������ (����%1�����ڿ�)
if "%1" NEQ "" (
	cd..
	cd..
	xcopy  %~dp0%0  %SubModuleRoot%\%1\  /Y	
	start  %SubModuleRoot%\%1\info.bat
	exit
)


:: ��ȡĿ¼��  EQU - ����
:: �����ǰ�ű�Ŀ¼��public����Ŀ¼��Ϊ�Զ���
:: �����ǰ�ű�Ŀ¼��sh(���Ŀ¼��./Script/sh)����2��cd��Ŀ¼��Ϊcd����
:: �����ǰ�ű�Ŀ¼����������Ŀ¼��Ϊ��ǰĿ¼
for %%a in ("%~dp0\.") do ( 
	REM ��ǰĿ¼=public
	if "%%~na" EQU "public" (
		REM ����Ŀ¼��Ϊ�Զ���
		set dirname=KumaNNN.github.io
		REM ����ɾ������
		set dd=1
	) else (
		REM ��ǰĿ¼=sh(���Ŀ¼��./Script/sh)
		if "%%~na" EQU "sh" (
			REM  2��cd
			cd..
			cd..
			REM ����Ŀ¼��Ϊcd����
			for %%i in ("!cd!\.") do (
			  set dirname=%%~ni
			)	
		) else (
			REM ��ǰĿ¼=����
			REM ����Ŀ¼��Ϊ��ǰĿ¼
			set dirname=%%~na
			REM ����ɾ������
			set dd=1
		)
	) 
)
echo Ŀ¼��: !dirname! 


if not exist .git (
	echo û��git���ݿ⣬�ű����˳�...
	pause
	GOTO:EOF
)


echo ------------------------ �ֿ�����  ------------------------ 

echo �����û���...
git config user.name "kuma8866"

echo ��������... 
git config user.email "kuma8866@163.com" 

echo �����ύ����...
git config http.postBuffer  524288000   

echo ���Զ�ֿ̲�...
git remote remove origin
git remote add origin https://github.com/KumaDocCenter/!dirname!.git


echo ------------------------ �ֿ�����  ------------------------ 

:: ɾ���ű�����
( if "!dd!" EQU "1"   del %~f0  )& exit || exit
