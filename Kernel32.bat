:(c) Sakura Inc. 版權所有，並保留一切權利
cls
@echo off
title OneOS
cd ..\..\etc
if NOT EXIST info.bat (goto setup) else (call sakosv3.bat)
set button=C:\SakuraPC\Systems\GPT\OneOS\Storage\OneOS\System32\button.bat
set getbutton=C:\SakuraPC\Systems\GPT\OneOS\Storage\OneOS\System32\GetInput.exe
cls
if EXIST dev (goto fastboot) else (goto boot)

:fastboot
cd ..\OneOS\System32
goto startmenu1
::=======================================================開機初始化

:setup
call ver.bat
echo  OneOS V%ver% 安裝程式
echo.
echo.
cd ..\OneOS\System32
call Button 5 5 F0 "install Now" X _Var_Box _Var_Hover
GetInput /M %_Var_Box% /H %_Var_Hover%
timeout /t 1 >nul
cls
echo 安裝程式正在開啟...
timeout /t 3 >Nul
cls
echo 合約條款 (更新於2023年3月2日)
echo =============================
echo 本系統未完成，此系統供嘗鮮
echo 若您想體驗完整功能，
echo 需要購買金鑰！
echo =============================
call Button 2 7 F0 "I Accpet" 16 7 F0 "I Reject" X _Var_Box _Var_Hover
GetInput /M %_Var_Box% /H %_Var_Hover%
goto rule%errorlevel%

:rule1
cls
echo 正在安裝OneOS...
timeout /t 1 >nul
echo sget Command@1.0
timeout /t 1 >nul
echo Geting Command@1.0
echo Download ing (1%)
echo Download ing (35%)
echo Download ing (40%)
echo Download ing (60%)
echo Download ing (73%)
echo Download ing (88%)
echo Download ing (96%)
echo Download ing (100%)
timeout /t 1 >nul
echo done
timeout /t 1 >nul
echo install ing
timeout /t 3 >nul
echo done
echo sget GUI@1.0
timeout /t 1 >nul
echo Geting GUI@1.0
echo Download ing (1%)
echo Download ing (35%)
echo Download ing (40%)
echo Download ing (60%)
echo Download ing (73%)
echo Download ing (88%)
echo Download ing (96%)
echo Download ing (100%)
timeout /t 1 >nul
echo done
timeout /t 1 >nul
echo install ing
timeout /t 3 >nul
echo done
echo oobe /timeout 30
echo sget oneosaddons
echo Geting oneosaddons
echo Download ing (1%)
echo Download ing (35%)
echo Download ing (40%)
echo Download ing (60%)
echo Download ing (73%)
echo Download ing (88%)
echo Download ing (96%)
echo Download ing (100%)
timeout /t 1 >nul
echo done
timeout /t 1 >nul
echo install ing
timeout /t 3 >nul
echo done
echo set oobe /l chinese
timeout /t 30 >nul
goto oobe

:rule2
cls
cd ..\..\etc
goto setup

:oobe
cd ..\..\etc
cls
timeout /t 1 >nul 2>nul
title OneOS OOBE
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
if %activation% == %key1% goto activationedbasic
if %activation% == %key2% goto activationedbasic
if %activation% == %key3% goto activationedbasic
if %activation% == %key4% goto activationedbasic
if %activation% == %key5% goto activationedbasic
if %activation% == %key6% goto activationedpro
if %activation% == %key7% goto activationedpro
if %activation% == %key8% goto activationedpro
if %activation% == %key9% goto activationedpro
if %activation% == %key10% goto activationedpro
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

:boot
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
goto login

:login
cls
call Button 5 5 F0 "Login" 15 5 F0 "Close" X _Var_Box _Var_Hover
GetInput /M %_Var_Box% /H %_Var_Hover%
echo.
echo.
echo.
echo.
goto startmenu%errorlevel%

:installupdate
cls
cd SoftwareUpdate
cd UpdateData
start Setup.bat
exit

:delinstallfile
rmdir /S /Q SoftwareUpdate
md SoftwareUpdate
del /F /Q UpdateDone.tmp
goto loginmenu

:comand
color %themelod%
cls
echo.
echo.
echo.
echo.
echo.
echo.       如果指令輸錯，請按Enter繼續
echo.
echo. 
echo.
echo.                     通道: %osdata%
echo.                     OneOS版本: %ver2%
echo ========================================
echo :start:                 %date%:
set /p comand=
if %comand% == start goto startmenu1
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
if %comand% == cmd goto command
echo.
echo 沒有這個指令！使用 [help]或者[start] 取得指令！
pause >nul
goto comand

:startmenu2
goto loginmenu

:startmenu1
cls
title OneOS
color %themelod%
echo 開始======================================
echo.                                         :
echo.                                         :
echo.                                         :
echo.                                         :
echo.                                         :
echo.                                         :
echo.                                         : 
echo.                                         :
echo.                                         :
echo.                                         :
echo.                                         : 
echo.                                         :
echo ==========================================
call %button% 0 2 F0 "Help" 9 2 F0 "PCinfo" 20 2 F0 "Calc" 29 2 F0 "Settings" 0 6 F0 "Desktop" 12 6 F0 "SExplorer" 26 6 F0 "SGPUBoost-X" 0 10 F0 "Command Mode" 18 10 F0 "Timer" 29 10 F0 "MenuDown" X _Var_Box _Var_Hover
%getbutton% /M %_Var_Box% /H %_Var_Hover%
goto start%errorlevel%

:startmenuii
cls
color %themelod%
echo 開始======================================
echo.                                         :
echo.                                         :
echo.                                         :
echo.                                         :
echo.                                         :
echo.                                         :
echo.                                         : 
echo.                                         :
echo.                                         :
echo.                                         :
echo.                                         : 
echo.                                         :
echo ==========================================
call %button% 31 10 F0 "MenuUp" X _Var_Box _Var_Hover
%getbutton% /M %_Var_Box% /H %_Var_Hover%
goto startii%errorlevel%

:start1
goto help

:start2
goto thispc

:start3
goto calc

:start4
goto cp

:start5
goto comand

:start6
goto intexp

:start7
goto gbmc

:start8
goto command

:start9
goto time

:start10
goto startmenuii

:startii1
goto startmenu1

:command
color 0a
cls
title OneOS (Command Mode)
echo 輸入 [help] 取得幫助
echo.
set /p comand=OneOS= 
if %comand% == exit goto startmenugif
if %comand% == help goto help 
if %comand% == logoutuser goto usrlogoff
if %comand% == time goto time
if %comand% == pcinfo goto thispc
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
goto command

::=======================================================Systems

:osver
cls
call osver.bat
CD ..\OneOS\System32
goto comand

:time
cls
echo 現在日期是%date%；時間是%time%
pause
echo.
goto comand

:thisPC
call sysmgr.bat
ehco.
CD ..\OneOS\System32
goto comand

:help
cd Commands
start help.vbs
cd ..
goto command

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
start calc.PY
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