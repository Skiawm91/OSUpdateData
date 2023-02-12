@echo off
echo 系統正在更新，請稍後...
echo.
echo 啟動更新...
copy /Y *.* C:\SakuraPC\Systems\GPT\OneOS\Storage\OneOS\System32\
copy /Y ver.bat C:\SakuraPC\Systems\GPT\OneOS\Storage\etc
cd ..
cd ..
del NowUpdate.tmp
echo.
pause >nul
del ver.bat
start Kernel32.bat
exit

