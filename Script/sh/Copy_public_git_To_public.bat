:: =================================================================== ::
::  ���public���ݿⲢ���Ƶ��ֿ��Ŀ¼public��
:: 
:: ���Ŀ¼�� ./Script/sh 
:: ����Ŀ¼�� ./
::
:: =================================================================== ::
@echo off

:: �����ļ�������
set DestDirName=public

:: ����Զ�ֿ̲�
set git=https://github.com/KumaNNN/KumaNNN.github.io.git

:: cd��ת����Ŀ¼
cd %~dp0
cd..
cd..

:: ���ø�Ŀ¼·��
set root=%cd%


:: Ŀ¼�������򴴽�
if not exist ".git/temp"  mkdir ".git/temp"
cd .git/temp
::::::::::::::::::::�ֿ⴦��::::::::::::::::::::::::::::::::::::::
if not exist "%DestDirName%/.git" (
	echo ��¡Զ�ֿ̲�...
	git clone %git%  %DestDirName%
	
	echo ���� .git Ŀ¼... 
	xcopy "%DestDirName%/.git"  "%DestDirName%_temp/.git"  /Y/I/E
	
	echo ɾ��ԭ Ŀ���ļ���
	::/s:ɾ���ļ��м���������Ŀ¼���ļ���/q:����ģʽ
	rd /s/q %DestDirName%	
	
	echo ������Ŀ¼...
	ren %DestDirName%_temp  %DestDirName%
	echo.
) else (
	cd %DestDirName%
	
	echo ץȡԶ�ֿ̲���Ϣ...
	git fetch %git% 
)
::::::::::::::::::::�ֿ⴦��::::::::::::::::::::::::::::::::::::::

:: cd �ظ�Ŀ¼
cd %root%

:: ���� .git Ŀ¼��ָ��Ŀ¼(�ֿ��Ŀ¼/ͬ��Ŀ¼/.git)
xcopy ".git/temp/%DestDirName%/.git"  "%DestDirName%/.git"  /Y/I/E

cd  public

:: ����Զ����ļ�
git checkout .gitignore
git checkout README.md
git checkout CNAME

GOTO:EOF
