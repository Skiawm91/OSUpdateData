:(c) Sakura Inc. 版權所有，並保留一切權利
cls
@echo off
title OneOS
cd ..\..\etc
if NOT EXIST info.bat (goto setup) else (call sakosv3.bat)
cls
goto start

::=======================================================開機初始化

:setup
timeout /t 1 >nul 2>nul
color 17
title OneOS 設置模式
echo =============行程==============
echo *1.設定使用者
echo  2.設定root密碼
echo  3.設定OneOS主機名稱
echo  4.啟用
echo  5.重新啟動
echo ==============================
echo.
set /p user1=請設定使用者名稱: 
set /p passwd1=請設定%user1%的密碼: 
echo.
goto moresetup

:moresetup
cls
echo set user1=%user1% > info.bat
echo set passwd1=%passwd1% >> info.bat
cd ..
cd Users
md %user1%
cd %user1%
md Downloads
md Desktop
md Documents
md Musics
cd ..
cd ..
cd etc
goto moresetup2

:moresetup2
echo =============行程==============
echo  1.設定使用者
echo *2.設定root密碼
echo  3.設定OneOS主機名稱
echo  4.啟用
echo  5.重新啟動
echo ==============================
echo.
set /p rootpasswd=請設定root密碼: 
echo set root=%rootpasswd% >> info.bat
goto moresetup3

:moresetup3
cls
echo =============行程==============
echo  1.設定使用者
echo  2.設定root密碼
echo *3.設定OneOS主機名稱
echo  4.啟用
echo  5.重新啟動
echo ==============================
echo.
set /p name=請設定主機名稱: 
echo set home=%name% >> info.bat
goto activation

:activation
cls
echo =============行程==============
echo  1.設定使用者
echo  2.設定root密碼
echo  3.設定OneOS主機名稱
echo *4.啟用
echo  5.重新啟動
echo ==============================
echo.
call infokey.bat
set /p activation=產品金鑰(沒有請輸入skip): 
if %key% == %key1% goto activationedbasic
if %key% == %key2% goto activationedbasic
if %key% == %key3% goto activationedbasic
if %key% == %key4% goto activationedbasic
if %key% == %key5% goto activationedbasic
if %key% == %key6% goto activationedpro
if %key% == %key7% goto activationedpro
if %key% == %key8% goto activationedpro
if %key% == %key9% goto activationedpro
if %key% == %key10% goto activationedpro
if %activation% == skip goto skip
Start ActivationErr.vbs
goto activation

:skip
set /p v=選擇版本(Pro/Basic): 
echo set keys=未啟用OS，%v%版 >> info.bat
echo set copyorno=此產品不是正版 >> info.bat
goto reset

:activationedpro
echo set keys=已啟用OS，Pro版 >> info.bat
echo pro > pro.bat
echo set copyorno=此產品是正版 >> info.bat
Start ActivationDone.vbs
goto reset

:activationedbasic
echo set keys=已啟用OS，Basic版 >> info.bat
echo home > home.bat
echo set copyorno=此產品是正版 >> info.bat
Start ActivationDone.vbs
goto reset

:load
timeout /2 5 >nul 2>nul
call sakosv3.bat
goto start

:reset
cd ..\OneOS\System32
cd Drivers
echo set gpu=VGA基本繪圖卡 > GPU.bat
cd ..
start Kernel32.bat
exit

::=======================================================SETUPS

:start
color 0F
echo.   
echo   %logo%
echo.
echo.
echo.     
echo.
echo.
timeout /t 3 >nul 2>nul
cls
echo.   
echo   %logo%
echo.
echo.
echo     .
echo.
echo.
timeout /t 1 >nul 2>nul
cls
echo.   
echo   %logo%
echo.
echo.
echo     ..
echo.
echo.
timeout /t 1 >nul 2>nul
cls
echo.   
echo   %logo%
echo.
echo.
echo     ...
echo.
echo.
timeout /t 1 >nul 2>nul
cls
echo.   
echo   %logo%
echo.
echo.
echo     ....
echo.
echo.
timeout /t 1 >nul 2>nul
cls
echo.   
echo   %logo%
echo.
echo.
echo     .
echo.
echo.
timeout /t 1 >nul 2>nul
cls
echo.   
echo   %logo%
echo.
echo.
echo     ..
echo.
echo.
timeout /t 1 >nul 2>nul
cls
echo.   
echo   %logo%
echo.
echo.
echo     ...
echo.
echo.
timeout /t 1 >nul 2>nul
cls
echo.   
echo   %logo%
echo.
echo.
echo     ....
echo.
echo.
timeout /t 1 >nul 2>nul
cls
echo.   
echo   %logo%
echo.
echo.
echo     .
echo.
echo.
timeout /t 1 >nul 2>nul
cls
echo.   
echo   %logo%
echo.
echo.
echo     ..
echo.
echo.
timeout /t 1 >nul 2>nul
cls
echo.   
echo   %logo%
echo.
echo.
echo     ...
echo.
echo.
timeout /t 1 >nul 2>nul
cls
echo.   
echo   %logo%
echo.
echo.
echo     ....
echo.
echo.
timeout /t 1 >nul 2>nul
cls
echo.   
echo   %logo%
echo.
echo.
echo     .
echo.
echo.
timeout /t 1 >nul 2>nul
cls
echo.   
echo   %logo%
echo.
echo.
echo     ..
echo.
echo.
timeout /t 1 >nul 2>nul
cls
echo.   
echo   %logo%
echo.
echo.
echo     ...
echo.
echo.
timeout /t 1 >nul 2>nul
cls
timeout /t 3 >nul 2>nul
goto loginmenu

:loginmenu
color %themelod%
cls
echo.
echo.
echo 用戶[1] : %user1%
echo 用戶[2] : %user2%
echo 用戶[3] : %usradd1%
echo 用戶[4] : %usradd2%
echo 用戶[5] : %usradd3%
echo ===================
echo 公用用戶 : user
echo.
echo.
echo.
set /p usrnames=使用者名稱: 
if %usrnames% == user goto comandwc
if %usrnames% == %user1% goto usrpasswd
if %usrnames% == %user2% goto usrpasswd
if %usrnames% == %useradd1% goto usrpasswd
if %usrnames% == %useradd2% goto usrpasswd
if %usrnames% == %useradd3% goto usrpasswd
goto loginmenu

:usrpasswd
cls
echo.
echo.
echo 用戶[1] : %user1%
echo 用戶[2] : %user2%
echo 用戶[3] : %usradd1%
echo 用戶[4] : %usradd2%
echo 用戶[5] : %usradd3%
echo ===================
echo 公用用戶 : user
echo.
echo.
echo.
set /p tpasswd=密碼: 
if %tpasswd% == %passwd1% goto comandwc
if %tpasswd% == %passwd2% goto comandwc
if %tpaddws% == %passwdadd1% goto comandwc
if %tpasswd% == %passwdadd2% goto comandwc
if %tpasswd% == %passwdadd3% goto comandwc
echo error
goto usrpasswd

:comandwc
CD ..\OneOS\System32
if EXIST NowUpdate.tmp (goto installupdate)
if EXIST UpdateDone.tmp (goto delinstallfile)
start Wellcome.vbs
goto startmenugif

:installupdate
cls
cd SoftwareUpdate
call temp.bat
cd %rnd%
start Setup.bat
exit

:delinstallfile
del /F /Q SoftwareUpdate
rmdir SoftwareUpdate
md SoftwareUpdate
del /F /Q UpdateDone.tmp
goto powereset

:comand
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo. 
echo.
echo.
echo.
echo ========================================
echo.%taskbar%
set /p comand=
if %comand% == start goto startmenugif
if %comand% == help goto help 
if %comand% == logoutuser goto usrlogoff
if %comand% == time goto time
if %comand% == pcinfo goto thispc
if %comand% == time goto time
if %comand% == activation goto yactivation
if %comand% == userinfo goto usrinfo
if %comand% == useradd goto usradd
if %comand% == drivemgr goto drivemgr
if %comand% == unitro goto nitro
if %comand% == notepad goto notepad
if %comand% == sexplorer goto intexp
if %comand% == gpuboost goto gbmc
if %comand% == settings goto cp
if %comand% == calc goto calc
if %comand% == off goto poweroff
if %comand% == reset goto powereset
if %comand% == internet goto internet
echo.
echo 沒有這個指令！使用 [help]或者[start] 取得指令！
goto comand

:startmenugif
ehco.
cls
echo 開始===[off]=[reset]=[logoutuser]========
cls
echo 開始===[off]=[reset]=[logoutuser]========
echo.[1]    [2]      [3]    [4]       : help :
cls
echo 開始===[off]=[reset]=[logoutuser]========
echo.[1]    [2]      [3]    [4]       : help :
echo.[help] [pcinfo] [calc] [settings]:      :
cls
echo 開始===[off]=[reset]=[logoutuser]========
echo.[1]    [2]      [3]    [4]       : help :
echo.[help] [pcinfo] [calc] [settings]:      :
echo.                                 :輸入's:
cls
echo 開始===[off]=[reset]=[logoutuser]========
echo.[1]    [2]      [3]    [4]       : help :
echo.[help] [pcinfo] [calc] [settings]:      :
echo.                                 :輸入's:
echo.[5]        [6]         [7]       :tart',:
cls
echo 開始===[off]=[reset]=[logoutuser]========
echo.[1]    [2]      [3]    [4]       : help :
echo.[help] [pcinfo] [calc] [settings]:      :
echo.                                 :輸入's:
echo.[5]        [6]         [7]       :tart',:
echo.[desktop] [sexplorer] [gpuboost] :回到桌:
cls
echo 開始===[off]=[reset]=[logoutuser]========
echo.[1]    [2]      [3]    [4]       : help :
echo.[help] [pcinfo] [calc] [settings]:      :
echo.                                 :輸入's:
echo.[5]        [6]         [7]       :tart',:
echo.[desktop] [sexplorer] [gpuboost] :回到桌:
echo.                                 :面，或:
cls
echo 開始===[off]=[reset]=[logoutuser]========
echo.[1]    [2]      [3]    [4]       : help :
echo.[help] [pcinfo] [calc] [settings]:      :
echo.                                 :輸入's:
echo.[5]        [6]         [7]       :tart',:
echo.[desktop] [sexplorer] [gpuboost] :回到桌:
echo.                                 :面，或:
echo.                                 :者輸入: 
cls
echo.[1]    [2]      [3]    [4]       : help :
echo.[help] [pcinfo] [calc] [settings]:      :
echo.                                 :輸入's:
echo.[5]        [6]         [7]       :tart',:
echo.[desktop] [sexplorer] [gpuboost] :回到桌:
echo.                                 :面，或:
echo.                                 :者輸入: 
echo.                                 :'deskt:
cls
echo 開始===[off]=[reset]=[logoutuser]========
echo.[1]    [2]      [3]    [4]       : help :
echo.[help] [pcinfo] [calc] [settings]:      :
echo.                                 :輸入's:
echo.[5]        [6]         [7]       :tart',:
echo.[desktop] [sexplorer] [gpuboost] :回到桌:
echo.                                 :面，或:
echo.                                 :者輸入: 
echo.                                 :'deskt:
echo.                                 :op' 返:
cls
echo 開始===[off]=[reset]=[logoutuser]========
echo.[1]    [2]      [3]    [4]       : help :
echo.[help] [pcinfo] [calc] [settings]:      :
echo.                                 :輸入's:
echo.[5]        [6]         [7]       :tart',:
echo.[desktop] [sexplorer] [gpuboost] :回到桌:
echo.                                 :面，或:
echo.                                 :者輸入: 
echo.                                 :'deskt:
echo.                                 :op' 返:
echo.                                 :回桌面:
cls
echo 開始===[off]=[reset]=[logoutuser]========
echo.[1]    [2]      [3]    [4]       : help :
echo.[help] [pcinfo] [calc] [settings]:      :
echo.                                 :輸入's:
echo.[5]        [6]         [7]       :tart',:
echo.[desktop] [sexplorer] [gpuboost] :回到桌:
echo.                                 :面，或:
echo.                                 :者輸入: 
echo.                                 :'deskt:
echo.                                 :op' 返:
echo.                                 :回桌面:
echo.                          [down] :      : 
cls
echo 開始===[off]=[reset]=[logoutuser]========
echo.[1]    [2]      [3]    [4]       : help :
echo.[help] [pcinfo] [calc] [settings]:      :
echo.                                 :輸入's:
echo.[5]        [6]         [7]       :tart',:
echo.[desktop] [sexplorer] [gpuboost] :回到桌:
echo.                                 :面，或:
echo.                                 :者輸入: 
echo.                                 :'deskt:
echo.                                 :op' 返:
echo.                                 :回桌面:
echo.                          [down] :      : 
echo =========================================
set /p comand=
if %comand% == start goto comand
if %comand% == desktop goto comand
if %comand% == help goto help 
if %comand% == logoutuser goto usrlogoff
if %comand% == time goto time
if %comand% == pcinfo goto thispc
if %comand% == time goto time
if %comand% == activation goto yactivation
if %comand% == userinfo goto usrinfo
if %comand% == useradd goto usradd
if %comand% == drivemgr goto drivemgr
if %comand% == unitro goto nitro
if %comand% == notepad goto notepad
if %comand% == sexplorer goto intexp
if %comand% == gpuboost goto gbmc
if %comand% == settings goto cp
if %comand% == calc goto calc
if %comand% == off goto poweroff
if %comand% == reset goto powereset
if %comand% == internet goto internet
goto startmenu

:startmenu
cls
echo 開始===[off]=[reset]=[logoutuser]========
echo.[1]    [2]      [3]    [4]       : help :
echo.[help] [pcinfo] [calc] [settings]:      :
echo.                                 :輸入's:
echo.[5]        [6]         [7]       :tart',:
echo.[desktop] [sexplorer] [gpuboost] :回到桌:
echo.                                 :面，或:
echo.                                 :者輸入: 
echo.                                 :'deskt:
echo.                                 :op' 返:
echo.                                 :回桌面:
echo.                          [down] :      : 
echo =========================================
set /p comand=
if %comand% == start goto comand
if %comand% == desktop goto comand
if %comand% == help goto help 
if %comand% == logoutuser goto usrlogoff
if %comand% == time goto time
if %comand% == pcinfo goto thispc
if %comand% == time goto time
if %comand% == activation goto yactivation
if %comand% == userinfo goto usrinfo
if %comand% == useradd goto usradd
if %comand% == drivemgr goto drivemgr
if %comand% == unitro goto nitro
if %comand% == notepad goto notepad
if %comand% == sexplorer goto intexp
if %comand% == gpuboost goto gbmc
if %comand% == settings goto cp
if %comand% == calc goto calc
if %comand% == off goto poweroff
if %comand% == reset goto powereset
if %comand% == internet goto internet
goto startmenu

::=======================================================Systems

:osver
call osver.bat
CD ..\OneOS\System32
goto comand

:time
echo 現在日期是%date%；時間是%time%
pause
echo.
goto comand

:thisPC
call sysmgr.bat
ehco.
CD ..\OneOS\System32
goto comand

:update
call update.bat
cls
pause
CD C:\SakuraPC\Systems\GPT\OneOS\Storage\OneOS\System32\
start Kernel32.bat
exit
S
:help
cd Commands
start help.vbs
cd ..
goto comand

:yactivation
cls
call activation.bat
goto comand

:bsod
cd Commands 
call BSOD.bat

:usrlogoff
goto loginmenu

:usrinfo
echo User1: %user1%
echo User2: %user2%
echo user3: %usradd1%
echo user4: %usradd2%
echo user5: %usradd3%
Pause
echo.
goto comand

:drivemgr
call DrivesMGR.bat
Pause
echo.
goto comand

:notepad
start NotePad.bat
goto comand

:intexp
cd ..
cd ..
cd ProgramFiles
cd SExplorer
start seweb.bat
cd ..
cd ..
cd OneOS
cd System32
goto comand

:gbmc
title OneOS GPU Boost Max
echo 超頻需要Pro版，檢測中...
timeout /t 2 >nul 2>nul
cd ..\..\etc
if NOT EXIST pro.bat (goto nopro) else (goto gbm)

:gbm
cls
echo 目前顯示卡有著 %random%Mhz
echo.
echo 超頻可隨機超
set /p chogbm=繼續(Y/N)? 
if %chogbm% == Y goto gbm
if %chogbm% == N goto exit
cls
goto gbm

:nopro
echo 需要Pro版！
CD ..\OneOS\System32
title OneOS
echo.
pause
goto comand

:exit
CD ..\OneOS\System32
title OneOS
goto comand

:cp
call cp.bat
goto comand

:calc
call calc.bat
goto comand

:poweroff
cls
echo 關機中...
timeout 5 >nul 2>nul
exit

:powereset
cls
echo 正在重新啟動...
timeout 5 >nul 2>nul
cd ..\..\..\..\..\..\
start Open.bat
exit

:internet
echo OneOS正在連上伺服器...
timeout /t 3 >nul 2>nul
cd temp
if NOT EXIST ThisTemp.txt (goto ctemp) else (goto link)

:ctemp
md temp
cd temp
echo Thistemp > Tushistemp.txt
cd ..
goto comand

:link
echo set rnd=internet%random%%random% > rnd.bat
call rnd.bat
md %rnd%
cd %rnd%
git clone https://github.com/Swarmed2674/Server.git
cd server
if NOT EXIST server.bat (goto errinternet) else (call server.bat)
cls
echo 連線成功！
echo 狀態: %server%
cd ..
cd ..
cd ..
pause
goto comand

:errinternet
echo 連線失敗！
cd ..
cd ..
cd ..
pause
goto comand
::=======================================================System指令們

:usradd
cd Plugins
call useradd.bat
set /p sl=設定完畢！需要登出(y/n)? 
if %sl% == y goto usrlogoff
if %sl% == n goto comand
echo 你確定你打對了嗎(y/n)
goto bsod

:nitro
setlocal enabledelayedexpansion
cls
	set str=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789
		 for /l %%i in (1,1,16) do (
   		 set /a num=!random!%%62
   		 call set zf=%%str:~!num!,1%%
   		 set pw=!pw!!zf!
)
echo,&echo 您的未檢查隨機代碼為: https://discord.gift/!pw!
echo.
pause
goto comand

::=======================================================Plugin指令