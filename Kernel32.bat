:(c) Sakura Inc. ���v�Ҧ��A�ëO�d�@���v�Q
cls
@echo off
title OneOS
cd ..\..\etc
if NOT EXIST info.bat (goto setup) else (call sakosv3.bat)
cls
goto start

::=======================================================�}����l��

:setup
timeout /t 1 >nul 2>nul
color 17
title OneOS �]�m�Ҧ�
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
echo �S���o�ӫ��O�I�ϥ� [help]�Ϊ�[start] ���o���O�I
goto comand

:startmenugif
ehco.
cls
echo �}�l===[off]=[reset]=[logoutuser]========
cls
echo �}�l===[off]=[reset]=[logoutuser]========
echo.[1]    [2]      [3]    [4]       : help :
cls
echo �}�l===[off]=[reset]=[logoutuser]========
echo.[1]    [2]      [3]    [4]       : help :
echo.[help] [pcinfo] [calc] [settings]:      :
cls
echo �}�l===[off]=[reset]=[logoutuser]========
echo.[1]    [2]      [3]    [4]       : help :
echo.[help] [pcinfo] [calc] [settings]:      :
echo.                                 :��J's:
cls
echo �}�l===[off]=[reset]=[logoutuser]========
echo.[1]    [2]      [3]    [4]       : help :
echo.[help] [pcinfo] [calc] [settings]:      :
echo.                                 :��J's:
echo.[5]        [6]         [7]       :tart',:
cls
echo �}�l===[off]=[reset]=[logoutuser]========
echo.[1]    [2]      [3]    [4]       : help :
echo.[help] [pcinfo] [calc] [settings]:      :
echo.                                 :��J's:
echo.[5]        [6]         [7]       :tart',:
echo.[desktop] [sexplorer] [gpuboost] :�^���:
cls
echo �}�l===[off]=[reset]=[logoutuser]========
echo.[1]    [2]      [3]    [4]       : help :
echo.[help] [pcinfo] [calc] [settings]:      :
echo.                                 :��J's:
echo.[5]        [6]         [7]       :tart',:
echo.[desktop] [sexplorer] [gpuboost] :�^���:
echo.                                 :���A��:
cls
echo �}�l===[off]=[reset]=[logoutuser]========
echo.[1]    [2]      [3]    [4]       : help :
echo.[help] [pcinfo] [calc] [settings]:      :
echo.                                 :��J's:
echo.[5]        [6]         [7]       :tart',:
echo.[desktop] [sexplorer] [gpuboost] :�^���:
echo.                                 :���A��:
echo.                                 :�̿�J: 
cls
echo.[1]    [2]      [3]    [4]       : help :
echo.[help] [pcinfo] [calc] [settings]:      :
echo.                                 :��J's:
echo.[5]        [6]         [7]       :tart',:
echo.[desktop] [sexplorer] [gpuboost] :�^���:
echo.                                 :���A��:
echo.                                 :�̿�J: 
echo.                                 :'deskt:
cls
echo �}�l===[off]=[reset]=[logoutuser]========
echo.[1]    [2]      [3]    [4]       : help :
echo.[help] [pcinfo] [calc] [settings]:      :
echo.                                 :��J's:
echo.[5]        [6]         [7]       :tart',:
echo.[desktop] [sexplorer] [gpuboost] :�^���:
echo.                                 :���A��:
echo.                                 :�̿�J: 
echo.                                 :'deskt:
echo.                                 :op' ��:
cls
echo �}�l===[off]=[reset]=[logoutuser]========
echo.[1]    [2]      [3]    [4]       : help :
echo.[help] [pcinfo] [calc] [settings]:      :
echo.                                 :��J's:
echo.[5]        [6]         [7]       :tart',:
echo.[desktop] [sexplorer] [gpuboost] :�^���:
echo.                                 :���A��:
echo.                                 :�̿�J: 
echo.                                 :'deskt:
echo.                                 :op' ��:
echo.                                 :�^�ୱ:
cls
echo �}�l===[off]=[reset]=[logoutuser]========
echo.[1]    [2]      [3]    [4]       : help :
echo.[help] [pcinfo] [calc] [settings]:      :
echo.                                 :��J's:
echo.[5]        [6]         [7]       :tart',:
echo.[desktop] [sexplorer] [gpuboost] :�^���:
echo.                                 :���A��:
echo.                                 :�̿�J: 
echo.                                 :'deskt:
echo.                                 :op' ��:
echo.                                 :�^�ୱ:
echo.                          [down] :      : 
cls
echo �}�l===[off]=[reset]=[logoutuser]========
echo.[1]    [2]      [3]    [4]       : help :
echo.[help] [pcinfo] [calc] [settings]:      :
echo.                                 :��J's:
echo.[5]        [6]         [7]       :tart',:
echo.[desktop] [sexplorer] [gpuboost] :�^���:
echo.                                 :���A��:
echo.                                 :�̿�J: 
echo.                                 :'deskt:
echo.                                 :op' ��:
echo.                                 :�^�ୱ:
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
echo �}�l===[off]=[reset]=[logoutuser]========
echo.[1]    [2]      [3]    [4]       : help :
echo.[help] [pcinfo] [calc] [settings]:      :
echo.                                 :��J's:
echo.[5]        [6]         [7]       :tart',:
echo.[desktop] [sexplorer] [gpuboost] :�^���:
echo.                                 :���A��:
echo.                                 :�̿�J: 
echo.                                 :'deskt:
echo.                                 :op' ��:
echo.                                 :�^�ୱ:
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
echo �{�b����O%date%�F�ɶ��O%time%
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
call calc.bat
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