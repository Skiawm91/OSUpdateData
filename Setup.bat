@echo off
echo 系統正在更新，請稍後...
echo.
echo 啟動更新...
copy /Y C:\SakuraPC\System\GPT\OneOS\Storage\OneOS\System32\
cd ..
cd ..
del NowUpdate.tmp
echo 按任意鍵繼續
pause >nul
start Kernel32.bat

