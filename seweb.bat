@echo off
title OneOS Internet Browser
goto 1

:1
cls
set /p web=https://
if %web% == sakurainc.com/news goto news
if %web% == sakurainc.com/store goto store
start https://%web%
goto 1

:news
cd cookie
set rnd=news%random%%random%
md %rnd%
cd %rnd%
git clone https://github.com/Skiawm91/OneNews.git
cd OneNews
cls
call News.bat
echo.
pause
cd ..
cd ..
goto 1

:store
cd cookie
set rnd=store%random%%random%
md %rnd%
cd %rnd%
git clone https://github.com/Swarmed2674/S.git
cd OneStore
cls
echo.
pause
cd ..
cd ..
goto 1