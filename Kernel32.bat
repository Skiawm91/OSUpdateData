::(c) Sakura Inc. 版權所有，並保留一切權利::

::開發者說明(你不是開發者也能看)::

::(棄用) 不代表消除，您仍可在經典模式使用::
::(未使用) 也不代表消除，但很有可能會再次加入，好消息是您也可在經典模式使用::
::(無法使用) 代表組件已經丟失，無法再使用，除非您可以找回丟失的組件::
::如果您想要對特定地方執行編輯，您可以使用  Ctrl + F 來搜尋組件::

::來自開發著Skiawm91的評論::

::距離正式開發完成的3.00.1011已經非常久了，所以我TM把代碼全忘光了::
::所以之後的3.00版本中不會再有大變動 (主要是我怕我一改系統就出錯)::
::你要改也不是不行，反正我開放二創了，要改就改，不要的話另一位開發者Thoy037也會負責提供新版本的::
::總之，我最後開發的3.00版本是3.00.1259，之後的版本均為二創，或者由Thoy037開發的官方版本::
::感謝你看到這裡，4.00版本將會是一個很大的變動，基本上跟Kepre架構...... 還是有點關係 lol::

::https://skiawm91.github.io/Sakura_Inc/Files/SakuraPC_V2.zip:: ::改SakuraPC後放到 C: 下::
::https://skiawm91.github.io/Sakura_Inc/Files/Full_4.00.zip:: ::改FS1~10後放到 C:\SakuraPC\Systems\GPT 下::

::Sakura Inc. - Skiawm91::

::你從命令行開？好喔::

@echo off
title DEBUG
cls
if "%~1" == "-fastboot" (goto fastboot)
if "%~1" == "-v" (goto sidevariable)
if "%~1" == "-echoon" (@echo on) 
if "%~1" == "-setup" (goto presetup)
if "%~1" == "-help" (goto prehelp)
goto oneos

:presetup
cd ..\..\etc
goto setup

:prehelp
echo -fastboot
echo -v
echo -echoon
echo -setup
echo -help
echo.
cmd
exit

::全部給你設定(但是不可以刪)::

:oneos
set user1=Admin
set user2=No
set passwd1=admin
set passwd2=No
set root=root123
set home="No Set Name"
set keys=未啟用OS
set copyorno=此系統沒有完成OOBE
set channel=Official
set oscp= 
set oscpyu=false

::系統初始階段，啟動過程::

title OneOS
::載入所有組件前先檢查是否正在進行更新::
if exist NowUpdate.tmp (goto installupdate)
::無更新，接著載入組件::
set button=C:\SakuraPC\Systems\GPT\OneOS\Storage\OneOS\System32\button.bat
set getbutton=C:\SakuraPC\Systems\GPT\OneOS\Storage\OneOS\System32\GetInput.exe
set 7za=C:\SakuraPC\Systems\GPT\OneOS\Storage\OneOS\System32\7za.exe
set wget=C:\SakuraPC\Systems\GPT\OneOS\Storage\OneOS\System32\wget.exe
cd ..\..\etc
if NOT EXIST config.bat (goto oldinfobat) else (call sakos.bat)
cls
if EXIST dev (goto fastboot) else (goto boot)

:oldinfobat
if not exist info.bat (goto setup) else (call sakosv3.bat)

:fastboot
goto loginmenu

:sidevariable
set user1=Admin
set user2=No
set passwd1=admin
set passwd2=No
set root=root123
set home="No Set Name"
set keys=未啟用OS
set copyorno=此系統沒有完成OOBE
set channel=1
echo %user1%
echo %user2%
echo %passwd1%
echo %passwd2%
echo %root%
echo %home%
echo %keys%
echo %copyorno%
echo OS%channel%UpdateInfo
pause >nul
goto oneos

::安裝程式::

:setup
call ver.bat
echo  OneOS %ver% 安裝程式
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
echo 合約條款 (更新於2024年5月5日)
echo =======================================
echo 該系統由Skiawm91打造，現由Thoy037維護
echo 請閱讀以下系統要求
echo.
echo Sakura OneOS系統要求
echo 1. Windows XP及更高版本
echo 2. SakuraPC第一代
echo =======================================
call Button 14 9 F0 "I Accpet" 27 9 F0 "I Reject" X _Var_Box _Var_Hover
GetInput /M %_Var_Box% /H %_Var_Hover%
goto rule%errorlevel%

:rule1
if %OS% == Windows_NT (goto ruleok) else (goto errorrule)

:errorrule
echo This System Not Supported Your Computer
pause >nul
exit

:ruleok
cls
echo Installing OneOS...
timeout /t 1 /nobreak >nul
echo sget Command@1.0
timeout /t 1 /nobreak >nul
echo Geting Command@1.0
echo Download ing (1%)
echo Download ing (35%)
echo Download ing (40%)
echo Download ing (60%)
echo Download ing (73%)
echo Download ing (88%)
echo Download ing (96%)
echo Download ing (100%)
timeout /t 1 /nobreak >nul
echo done
timeout /t 1 /nobreak >nul
echo install ing
timeout /t 3 /nobreak >nul
echo done
echo sget GUI@1.0
timeout /t 1 /nobreak >nul
echo Geting GUI@1.0
echo Download ing (1%)
echo Download ing (35%)
echo Download ing (40%)
echo Download ing (60%)
echo Download ing (73%)
echo Download ing (88%)
echo Download ing (96%)
echo Download ing (100%)
timeout /t 1 /nobreak >nul
echo done
timeout /t 1 /nobreak >nul
echo install ing
timeout /t 3 /nobreak >nul
echo done
echo oobe /timeout 10
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
timeout /t 1 /nobreak >nul
echo done
timeout /t 1 /nobreak >nul
echo install ing
timeout /t 3 /nobreak >nul
echo done
echo set oobe /l chinese
timeout /t ! /nobreak >nul
goto oobe

:rule2
cls
cd ..\..\etc
goto setup

::OOBE階段::

:oobe
cls
cd ..\OneOS\System32
echo              Set User else Skip
call Button 10 5 F0 "Create User" 26 5 F0 "Skip" X _Var_Box _Var_Hover
GetInput /M %_Var_Box% /H %_Var_Hover%
goto oobe%errorlevel%

:oobe2
cls
goto moresetup2

:oobe1
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
echo set user1=%user1% > config.bat
echo set passwd1=%passwd1% >> config.bat
call config.bat
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
echo set root=%rootpasswd% >> config.bat
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
echo set home=%name% >> config.bat
goto activation

:activation
cls
echo =============行程==============
echo  1.設定使用者
echo  2.設定root密碼
echo  3.設定OneOS主機名稱
echo *4.啟用
echo  6.選擇更新通道
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
echo set keys=未啟用OS，%v%版 >> config.bat
echo set copyorno=此產品不是正版 >> config.bat
goto reset

:activationedpro
echo set keys=已啟用OS，Pro版 >> config.bat
echo pro > pro.bat
echo set copyorno=此產品是正版 >> config.bat
Start ActivationDone.vbs
goto reset

:activationedbasic
echo set keys=已啟用OS，Basic版 >> config.bat
echo home > home.bat
echo set copyorno=此產品是正版 >> config.bat
Start ActivationDone.vbs
goto reset

:load
timeout /2 5 >nul 2>nul
call sakos.bat
goto start

:reset
cd ..\OneOS\System32
cd Drivers
echo set gpu=SkHol Graphics > GPU.bat
cd ..
start Kernel32.bat
exit

::Boot引導::

:boot
color 0F
echo.   
echo.    %logo%
echo.    %logoii%
echo.
echo.
echo.     
echo.
echo.
timeout /t 3 >nul 2>nul
cls
echo.   
echo.    %logo%
echo.    %logoii%
echo.
echo.
echo     .
echo.
echo.
timeout /t 1 >nul 2>nul
cls
echo.   
echo.    %logo%
echo.    %logoii%
echo.
echo.
echo     ..
echo.
echo.
timeout /t 1 >nul 2>nul
cls
echo.   
echo.    %logo%
echo.    %logoii%
echo.
echo.
echo     ...
echo.
echo.
timeout /t 1 >nul 2>nul
cls
echo.   
echo.    %logo%
echo.    %logoii%
echo.
echo.
echo     ....
echo.
echo.
timeout /t 1 >nul 2>nul
cls
echo.   
echo.    %logo%
echo.    %logoii%
echo.
echo.
echo     .
echo.
echo.
timeout /t 1 >nul 2>nul
cls
echo.   
echo.    %logo%
echo.    %logoii%
echo.
echo.
echo     ..
echo.
echo.
timeout /t 1 >nul 2>nul
cls
echo.   
echo.    %logo%
echo.    %logoii%
echo.
echo.
echo     ...
echo.
echo.
timeout /t 1 >nul 2>nul
cls
echo.   
echo.    %logo%
echo.    %logoii%
echo.
echo.
echo     ....
echo.
echo.
timeout /t 1 >nul 2>nul
cls
echo.   
echo.    %logo%
echo.    %logoii%
echo.
echo.
echo     .
echo.
echo.
timeout /t 1 >nul 2>nul
cls
echo.   
echo.    %logo%
echo.    %logoii%
echo.
echo.
echo     ..
echo.
echo.
timeout /t 1 >nul 2>nul
cls
echo.   
echo.    %logo%
echo.    %logoii%
echo.
echo.
echo     ...
echo.
echo.
timeout /t 1 >nul 2>nul
cls
echo.   
echo.    %logo%
echo.    %logoii%
echo.
echo.
echo     ....
echo.
echo.
timeout /t 1 >nul 2>nul
cls
echo.   
echo.    %logo%
echo.    %logoii%
echo.
echo.
echo     .
echo.
echo.
timeout /t 1 >nul 2>nul
cls
echo.   
echo.    %logo%
echo.    %logoii%
echo.
echo.
echo     ..
echo.
echo.
timeout /t 1 >nul 2>nul
cls
echo.   
echo.    %logo%
echo.    %logoii%
echo.
echo.
echo     ...
echo.
echo.
timeout /t 1 >nul 2>nul
cls
timeout /t 3 >nul 2>nul
goto loginmenu

::登入畫面::

:loginmenu
cd ..\OneOS\System32
if %themelod% == 07 (set buttonc=70) else (set buttonc=07)
color %themelod%
cls
echo.
echo.
echo.        選擇使用者
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
call %button% 7 5 %buttonc% "%user1%" 9 9 %buttonc% "User" X _Var_Box _Var_Hover
%getbutton% /M %_Var_Box% /H %_Var_Hover%
goto login%errorlevel%

:login1
set lusr=%user1%
goto usrpasswd

:login2
set lusr=User
goto comandwc

:usrpasswd
cls
echo.
echo.
echo.
echo.
echo.       輸入 %lusr%的密碼
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p tpasswd=
if %tpasswd% == %passwd1% goto comandwc
goto usrpasswd2

:usrpasswd2
cls
echo.
echo.
echo.
echo.
echo.       輸入 %lusr%的密碼
echo.
echo.       [請核對密碼是否正確]
echo.
echo.
echo.
echo.
echo.
set /p tpasswd=
if %tpasswd% == %passwd1% goto comandwc
goto usrpasswd2

:comandwc
if EXIST UpdateDone.tmp (goto delinstallfile)
goto login

:login
cls
echo.
echo.
echo.       Welcome %lusr%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
call %button% 5 5 F0 "Login" 15 5 F0 "Close" X _Var_Box _Var_Hover
%getbutton% /M %_Var_Box% /H %_Var_Hover%
goto startmenu%errorlevel%

:startmenu2
goto loginmenu

::更新組件::

:installupdate
cd ..\..\etc
call info.bat
cd ..\OneOS\System32
cls
cd SoftwareUpdate
cd OSUpdateData
start Setup.bat
exit

:delinstallfile
rmdir /S /Q SoftwareUpdate
md SoftwareUpdate
del /F /Q UpdateDone.tmp
goto startmenu1

::桌面::

:comand
if %themelod% == 07 (set buttonc=70) else (set buttonc=07)
color %themelod%
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
echo.                           通道: %osdata%
echo.                           OneOS版本: %ver2%
echo ===========================================
echo :        :                                :
echo :        :                %date% :
echo :        :                                :
call Button 1 14 %buttonc% "Menu" 1 1 %buttonc% "Logout" 1 5 %buttonc% "Restart" 1 9 %buttonc% "PowerOFF"  X _Var_Box _Var_Hover
%getbutton% /M %_Var_Box% /H %_Var_Hover%
goto desktop%errorlevel%

:desktop1
goto startmenu1

:desktop2
goto loginmenu

:desktop3
goto powereset

:desktop4
goto poweroff

::程式集::

:startmenu1
cls
title OneOS
if %themelod% == 07 (set buttonc=70) else (set buttonc=07)
color %themelod%
echo =================程式集 [1]================
echo :                                         :
echo :                                         :
echo :                                         :
echo :                                         :
echo :                                         :
echo :                                         :
echo :                                         :
echo :                                         :
echo :                                         :
echo :                                         :
echo :                                         :
echo :                                         :
echo ===========================================
call %button% 1 2 %buttonc% "Help" 10 2 %buttonc% "PCinfo" 21 2 %buttonc% "Calc" 30 2 %buttonc% "Settings" 1 6 %buttonc% "Desktop" 13 6 %buttonc% "SExplorer" 27 6 %buttonc% "SGPUBoost-X" 1 10 %buttonc% "Command Mode" 18 10 %buttonc% " Time " 29 10 %buttonc% "Menu Down" X _Var_Box _Var_Hover
%getbutton% /M %_Var_Box% /H %_Var_Hover%
goto start%errorlevel%

::程式集II::

:startmenuii
cls
color %themelod%
echo =================程式集 [2]================
echo :                                         :
echo :                                         :
echo :                                         :
echo :                                         :
echo :                                         :
echo :                                         :
echo :                                         :
echo :                                         :
echo :                                         :
echo :                                         :
echo :                                         :
echo :                                         :
echo ===========================================
call %button% 1 2 %buttonc% "NotePad" 32 10 %buttonc% "MenuUp" X _Var_Box _Var_Hover
%getbutton% /M %_Var_Box% /H %_Var_Hover%
goto startii%errorlevel%

::程式集操作::

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
goto notepad

:startii2
goto startmenu1

::OneOS經典模式::

:command
color 0a
cls
title OneOS (Classic Mode)
echo 輸入 [help] 取得幫助
echo.
set comand=Baohau
set /p comand=OneOS= 
if %comand% == exit goto startmenu1
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
if %comand% == cmd cmd
goto command

::=======================================================Systems

::系統版本(棄用)::

:osver
cls
call osver.bat
CD ..\OneOS\System32
goto command

::時間(棄用)::

:time
cls
echo 現在日期是%date%；時間是%time%
pause
echo.
goto command

::關於系統::

:thisPC
cls
call sysmgr.bat
goto sysmgr%errorlevel%

:sysmgr1
goto startmenu1

:sysmgr2
goto comand

::幫助中心(棄用)::

:help
cd Commands
start help.vbs
cd ..
goto command

::啟用電腦(棄用)::

:yactivation
cls
call activation.bat
goto command

::藍屏(棄用)::

:bsod
cd Commands 
call BSOD.bat

::登出(未使用)::

:usrlogoff
goto loginmenu

::關於用戶(棄用)::

:usrinfo
echo User1: %user1%
echo User2: %user2%
echo user3: %usradd1%
echo user4: %usradd2%
echo user5: %usradd3%
Pause
echo.
goto command

::裝置管理員(棄用)::

:drivemgr
call DrivesMGR.bat
Pause
echo.
goto command

::記事本::

:notepad
start NotePad.bat
goto comand

::內建網路瀏覽器::

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

::虛擬超頻::

:gbmc
cls
title OneOS GPU Boost Max
echo 超頻需要Pro版，檢測中...
timeout /t 2 >nul 2>nul
cd ..\..\etc
if NOT EXIST pro.bat (goto nopro) else (goto gbm)

:gbm
cls
echo 目前顯示卡有著 %random%Mhz
echo.
echo        超頻可隨機超
echo
set /p chogbm=繼續(Y/N)? 
if %chogbm% == Y goto gbm
if %chogbm% == N goto exit
cls
goto gbm

::沒有專業版::

:nopro
echo 需要Pro版！
CD ..\OneOS\System32
title OneOS
echo.
pause
goto comand

::離開(棄用)::

:exit
CD ..\OneOS\System32
title OneOS
goto comand

::設定::

:cp
call cp.bat
if %oscp% == startmenu (goto startmenu1)
if %oscp% == desktop (goto comand)

::計算機(無法使用)::

:calc
start calc.bat
goto comand

::關機::

:poweroff
cls
echo 關機中...
timeout 5 >nul 2>nul
exit

::重啟::

:powereset
cls
echo 正在重新啟動...
timeout 5 >nul 2>nul
cd ..\..\..\..\..\..\
start Open.bat
exit

::網路測試(棄用)::

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
goto command

:link
echo set rnd=internet%random%%random% > rnd.bat
call rnd.bat
md %rnd%
cd %rnd%
git clone https://github.com/Skiawm91/IntTest.git
cd server
if NOT EXIST server.bat (goto errinternet) else (call server.bat)
cls
echo 連線成功！
echo 狀態: %server%
cd ..
cd ..
cd ..
pause
goto command

:errinternet
echo 連線失敗！
cd ..
cd ..
cd ..
pause
goto command

::System指令們::

::增加用戶(無法使用)::

:usradd
cd Plugins
call useradd.bat
set /p sl=設定完畢！需要登出(y/n)? 
if %sl% == y goto usrlogoff
if %sl% == n goto comand
echo 你確定你打對了嗎(y/n)
goto bsod

::取得隨機但不見得能用Nitro(未使用)::

:nitro
set pw=
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
goto command

::Plugin指令::