@echo off
:: ���������ӳ�
setlocal enabledelayedexpansion
:: ���Կ���
set debug=0

cd %~dp0

if %debug%==1 echo ------------------------ ��������ʱ���ʱ���  ----------------------

:: ���ڷָ���
set delim=-

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
echo ����ʱ�䣺"%datetime%"

:: ����ʱ�� ��( 20181207180016 )
set deti=%de%%ti%
:::: ȥ�����пո�
set timestamp=%deti: =%
echo ʱ�����"%timestamp%"

if %debug%==1 echo ------------------------ ��������ʱ���ʱ���  ----------------------


:: �жϽű�����·����Script\sh\��ֿ��Ŀ¼
if exist init.bat (
	REM ��ת���ֿ��Ŀ¼(��ǰ�ű�·��Ϊ Script\sh\)
	cd.. 
	cd..  

	REM ���ø�Ŀ¼·��
	set root=!cd!
	REM ���õ�ǰ�ű�·��
	set thispath=%~dp0

	REM ��ת���ϼ�Ŀ¼
	cd..
	REM ����Ŀ¼
	xcopy !root!\*  !root!.bak\  /eiy

	REM ɾ���ļ�
	rd  /s/q !root!.bak\Script
	del /f/s/q !root!.bak\start.bat
	
	REM ���������Ϣ
	echo ����Ŀ¼��!root! >!root!.bak\back.log
	echo ����ʱ�䣺%datetime% >>!root!.bak\back.log
	echo ------------------------------------------------------------ >>!root!.bak\back.log
	echo.  >>!root!.bak\back.log
	tree /f  !root!.bak  >>!root!.bak\back.log
	
	REM ��ת����ǰ�ű�·��
	cd !thispath!

	REM ���ýű�	
	start init.bat
	
	REM �˳��ű�
	exit
) else (
	REM ���ø�Ŀ¼·��
	set root=!cd!
	REM ���õ�ǰ�ű�·��
	set thispath=%~dp0

	REM ��ת���ϼ�Ŀ¼
	cd..
	REM ����Ŀ¼
	xcopy !thispath!*  !root!.bak\  /eiy

	REM ɾ���ļ�
	rd  /s/q !root!.bak\Script
	del /f/s/q !root!.bak\start.bat
	
	REM ���������Ϣ
	echo ����Ŀ¼��!root! >!root!.bak\back.log
	echo ����ʱ�䣺%datetime% >>!root!.bak\back.log
	echo ------------------------------------------------------------ >>!root!.bak\back.log
	echo.  >>!root!.bak\back.log
	tree /f  !root!.bak  >>!root!.bak\back.log
	
	REM ��ת����ǰ�ű�·��
	cd !thispath!
		
	REM ���ýű�
	start Script\sh\init.bat
	
	REM ɾ�����ű����˳�
	del %0
	exit
)

