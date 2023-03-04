:(c) Sakura Inc. ���v�Ҧ��A�ëO�d�@���v�Q
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
::=======================================================�}����l��

:setup
call ver.bat
echo  OneOS V%ver% �w�˵{��
echo.
echo.
cd ..\OneOS\System32
call Button 5 5 F0 "install Now" X _Var_Box _Var_Hover
GetInput /M %_Var_Box% /H %_Var_Hover%
timeout /t 1 >nul
cls
echo �w�˵{�����b�}��...
timeout /t 3 >Nul
cls
echo �X������ (��s��2023�~3��2��)
echo =============================
echo ���t�Υ������A���t�Ψѹ��A
echo �Y�z�Q���秹��\��A
echo �ݭn�ʶR���_�I
echo =============================
call Button 2 7 F0 "I Accpet" 16 7 F0 "I Reject" X _Var_Box _Var_Hover
GetInput /M %_Var_Box% /H %_Var_Hover%
goto rule%errorlevel%

:rule1
cls
echo ���b�w��OneOS...
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
echo =============��{==============
echo *1.�]�w�ϥΪ�
echo  2.�]�wroot�K�X
echo  3.�]�wOneOS�D���W��
echo  4.�ҥ�
echo  5.���s�Ұ�
echo ==============================
echo.
set /p user1=�г]�w�ϥΪ̦W��: 
set /p passwd1=�г]�w%user1%���K�X: 
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
echo =============��{==============
echo  1.�]�w�ϥΪ�
echo *2.�]�wroot�K�X
echo  3.�]�wOneOS�D���W��
echo  4.�ҥ�
echo  5.���s�Ұ�
echo ==============================
echo.
set /p rootpasswd=�г]�wroot�K�X: 
echo set root=%rootpasswd% >> info.bat
goto moresetup3

:moresetup3
cls
echo =============��{==============
echo  1.�]�w�ϥΪ�
echo  2.�]�wroot�K�X
echo *3.�]�wOneOS�D���W��
echo  4.�ҥ�
echo  5.���s�Ұ�
echo ==============================
echo.
set /p name=�г]�w�D���W��: 
echo set home=%name% >> info.bat
goto activation

:activation
cls
echo =============��{==============
echo  1.�]�w�ϥΪ�
echo  2.�]�wroot�K�X
echo  3.�]�wOneOS�D���W��
echo *4.�ҥ�
echo  5.���s�Ұ�
echo ==============================
echo.
call infokey.bat
set /p activation=���~���_(�S���п�Jskip): 
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
set /p v=��ܪ���(Pro/Basic): 
echo set keys=���ҥ�OS�A%v%�� >> info.bat
echo set copyorno=�����~���O���� >> info.bat
goto reset

:activationedpro
echo set keys=�w�ҥ�OS�APro�� >> info.bat
echo pro > pro.bat
echo set copyorno=�����~�O���� >> info.bat
Start ActivationDone.vbs
goto reset

:activationedbasic
echo set keys=�w�ҥ�OS�ABasic�� >> info.bat
echo home > home.bat
echo set copyorno=�����~�O���� >> info.bat
Start ActivationDone.vbs
goto reset

:load
timeout /2 5 >nul 2>nul
call sakosv3.bat
goto start

:reset
cd ..\OneOS\System32
cd Drivers
echo set gpu=VGA��ø�ϥd > GPU.bat
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
echo �Τ�[1] : %user1%
echo �Τ�[2] : %user2%
echo �Τ�[3] : %usradd1%
echo �Τ�[4] : %usradd2%
echo �Τ�[5] : %usradd3%
echo ===================
echo ���ΥΤ� : user
echo.
echo.
echo.
set /p usrnames=�ϥΪ̦W��: 
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
echo �Τ�[1] : %user1%
echo �Τ�[2] : %user2%
echo �Τ�[3] : %usradd1%
echo �Τ�[4] : %usradd2%
echo �Τ�[5] : %usradd3%
echo ===================
echo ���ΥΤ� : user
echo.
echo.
echo.
set /p tpasswd=�K�X: 
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
echo.       �p�G���O����A�Ы�Enter�~��
echo.
echo. 
echo.
echo.                     �q�D: %osdata%
echo.                     OneOS����: %ver2%
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
echo �S���o�ӫ��O�I�ϥ� [help]�Ϊ�[start] ���o���O�I
pause >nul
goto comand

:startmenu2
goto loginmenu

:startmenu1
cls
title OneOS
color %themelod%
echo �}�l======================================
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
echo �}�l======================================
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
echo ��J [help] ���o���U
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
echo �{�b����O%date%�F�ɶ��O%time%
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
echo �W�W�ݭnPro���A�˴���...
timeout /t 2 >nul 2>nul
cd ..\..\etc
if NOT EXIST pro.bat (goto nopro) else (goto gbm)

:gbm
cls
echo �ثe��ܥd���� %random%Mhz
echo.
echo �W�W�i�H���W
set /p chogbm=�~��(Y/N)? 
if %chogbm% == Y goto gbm
if %chogbm% == N goto exit
cls
goto gbm

:nopro
echo �ݭnPro���I
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
echo ������...
timeout 5 >nul 2>nul
exit

:powereset
cls
echo ���b���s�Ұ�...
timeout 5 >nul 2>nul
cd ..\..\..\..\..\..\
start Open.bat
exit

:internet
echo OneOS���b�s�W���A��...
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
echo �s�u���\�I
echo ���A: %server%
cd ..
cd ..
cd ..
pause
goto comand

:errinternet
echo �s�u���ѡI
cd ..
cd ..
cd ..
pause
goto comand
::=======================================================System���O��

:usradd
cd Plugins
call useradd.bat
set /p sl=�]�w�����I�ݭn�n�X(y/n)? 
if %sl% == y goto usrlogoff
if %sl% == n goto comand
echo �A�T�w�A����F��(y/n)
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
echo,&echo �z�����ˬd�H���N�X��: https://discord.gift/!pw!
echo.
pause
goto comand

::=======================================================Plugin���O