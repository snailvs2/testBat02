echo off
::%YYYYmmdd%HH%hhmiss%
::����Ŀ¼�����ļ�
git --git-dir=%cd%\.git pull

::��һ��Ŀ¼
set wwwdir=%cd:sourse\=%
git --git-dir="%wwwdir%\.git" pull

::set result=%ERRORLEVEL%
::echo %result%
::if "%result%"=="0" (
::	echo "sucess"
::) else (
::	echo "fail"
::)

::1:�����ļ�
set /p option=[1.continue copy ]:
if "%option%"=="1" goto COPY
pause
exit


::��ʼ���Ƶ���ӦĿ¼
:COPY
echo copy and git.add.commit.push
echo "del %wwwdir%"
del /f/s/q %wwwdir%\app\* 1>nul 2>nul
del /f/s/q %wwwdir%\w\* 1>nul 2>nul
rd /s/q %wwwdir%\app\
rd /s/q %wwwdir%\w\

echo .git>exclude.txt
echo push-to-github.bat>>exclude.txt
echo push-to-github2.bat>>exclude.txt
echo exclude.txt>>exclude.txt

echo coyp...
xcopy /y/e/s/h/q . %wwwdir% /exclude:exclude.txt
del exclude.txt
echo "copy  finish %wwwdir%"

echo git add...
git --git-dir="%wwwdir%\.git" add -A
echo git commit...
git --git-dir="%wwwdir%\.git" commit -am"�ύ"
echo git push
git --git-dir="%wwwdir%\.git" push
echo git finish

pause
exit
