@echo off
echo �t�Υ��b��s�A�еy��...
echo.
echo �Ұʧ�s...
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

