@echo off
echo Updateing...
echo.
cls
echo Starting Update...
copy /Y *.* C:\SakuraPC\Systems\GPT\OneOS\Storage\OneOS\System32\
copy /Y ver.bat C:\SakuraPC\Systems\GPT\OneOS\Storage\etc\
copy /Y sakosv3.bat C:\SakuraPC\Systems\GPT\OneOS\Storage\etc\
copy /Y seweb.bat C:\SakuraPC\Systems\GPT\OneOS\Storage\ProgramFiles\SExplorer\
cd ..
cd ..
del NowUpdate.tmp
echo temp > UpdateDone.tmp
echo.
timeout /t 3 /NOBREAK >nul
del ver.bat
del setup.bat
del seweb.bat
del sakosv3.bat
start Kernel32.bat
cd ..
cd ..
cd etc
if exist sakos.bat (del sakosv3.bat)
exit

