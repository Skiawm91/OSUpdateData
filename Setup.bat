@echo off
echo Updateing...
echo.
cls
echo Starting Update...
copy /Y *.* C:\SakuraPC\Systems\GPT\OneOS\Storage\OneOS\System32\
copy /Y ver.bat C:\SakuraPC\Systems\GPT\OneOS\Storage\etc
copy /Y infokey.bat C:\SakuraPC\Systems\GPT\OneOS\Storage\etc
cd ..
cd ..
del NowUpdate.tmp
echo.
pause >nul
del ver.bat
del infokey.bat
start Kernel32.bat
exit

