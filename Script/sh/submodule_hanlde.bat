:: ============================================================================= ::
:: ��ģ�鴦�� �ű�������
::
:: ���˽ű���ScriptĿ¼һ���Ƶ��Ӳֿ��Ŀ¼��
:: ע�� ʹ�� start ��ʽ���������ű�
::
:: ���Ŀ¼�� ./Script/sh 
:: ����Ŀ¼�� ./Script/sh
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

:: cd��ת��ǰ�ű�Ŀ¼
cd %~dp0

:: ���ø�Ŀ¼·��
set root=%cd%
:: ���õ�ǰ�ű�·��
set thispath=%~dp0
:: ������ģ���Ŀ¼
set SubModuleRoot=source_md

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


echo ------------------------ ���ýű�  ------------------------
:: %1 : ��ģ����      (Ajax)
:: /source_md/Ajax
:: ֻ��������ģ��
:: ע�� ʹ�� start ��ʽ���������ű�
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

echo ���ø��ƹ��ӽű�...
start Copy_hook_submodule.bat   %1  %2  %3  %4  %5  %6  %7  %8  %9
echo ���û�����Ϣ�ű�...
start info.bat   %1  %2  %3  %4  %5  %6  %7  %8  %9
echo ������ģ��ϡ�����ű�...
start submodule_sparse_checkout.bat   %1  %2  %3  %4  %5  %6  %7  %8  %9

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 

echo ------------------------ ���ýű�  ------------------------



pause
GOTO:EOF
::exit
