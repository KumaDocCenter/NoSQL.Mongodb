:: ============================================================================= ::
:: ��ģ��ϡ����
::
:: ���˽ű���ScriptĿ¼һ���Ƶ��Ӳֿ��Ŀ¼��
:: ע�� ��ǰ�ű�����Ŀ¼��Ҫ�� sparse-checkout �ļ�
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



REM ϡ����
REM  git config core.sparsecheckout true
REM  echo "path1/" >> .git/info/sparse-checkout
REM  echo "path2/" >> .git/info/sparse-checkout
REM  git checkout master

echo ------------------------ ���� sparse-checkout  ------------------------
:: %1 : ��ģ����      (Ajax)
:: ֻ��������ģ��
:: .git/modules/source_md/Ajax
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
:: �����ļ�����
set filename=sparse-checkout
:: �����򱸷�
if exist ".git\modules\%SubModuleRoot%\%1\info\%filename%"  (
 	ren .git\modules\%SubModuleRoot%\%1\info\%filename%   %filename%.%timestamp%
)
:: �����ļ�
REM %~dp0 : K:\...\Script\sh\ 
xcopy  %~dp0%filename%   .git\modules\%SubModuleRoot%\%1\info\  /Y
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

echo ------------------------ ���� sparse-checkout  ------------------------


echo ------------------------ ���� sparse-checkout �������֧ ------------------------

:: ��ת����ģ�鹤��Ŀ¼
cd %SubModuleRoot%\%1
echo cd: %cd%
:: ���� sparse-checkout 
git config core.sparsecheckout true
:: �����֧
git checkout master

echo ------------------------ ���� sparse-checkout �������֧ ------------------------

pause
GOTO:EOF
::exit
