:: ============================================================================= ::
:: ������ģ�鹳��
::
:: ���˽ű���ScriptĿ¼һ���Ƶ��Ӳֿ��Ŀ¼��
:: ע�� ͨ��������˽ű�������ϻ�ɾ������
::
:: ���Ŀ¼�� ./Script/sh 
:: ����Ŀ¼�� ./
:: 
:: ��������� 
:: %1 : ��ģ����      (Ajax)
:: ============================================================================= ::

:: �رջ���
@echo off
:: ���������ӳ�
setlocal enabledelayedexpansion
:: ���Կ���
set debug=0

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
if %debug%==1 echo "%datetime%"

:: ����ʱ�� ��( 20181207180016 )
set deti=%de%%ti%
:::: ȥ�����пո�
set timestamp=%deti: =%
if %debug%==1 echo "%timestamp%"

if %debug%==1 echo ------------------------ ��������ʱ���ʱ���  ----------------------




echo ------------------------ ���ƹ���  ------------------------
:: %1 : ��ģ����      (Ajax)
:: ֻ��������ģ�飬�Ӳֿⲻ��Ҫ�˹���
:: .git/modules/source_md/Ajax
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
:: ���ù�������
set hookname=post-commit
:: �����򱸷�
if exist ".git\modules\%SubModuleRoot%\%1\hooks\%hookname%"  (
 	ren .git\modules\%SubModuleRoot%\%1\hooks\%hookname%   %hookname%.%timestamp%  
)
:: ���ƹ���
xcopy  Script\hook\SubModule\%hookname%   .git\modules\%SubModuleRoot%\%1\hooks\  /Y
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

echo ------------------------ ���ƹ���  ------------------------

exit
