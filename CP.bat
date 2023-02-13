@echo off
title OneOS �]�w
goto cpmenu

:cphelp
goto commands
start cphelp.vbs
goto cp

:cpmenu
cls
echo ========================================
echo : �]�w                               :x:
echo ========================================
echo :                �]�w                  :
echo :                                      :
echo :              [1] �t��                :
echo :              [2] �ӤH��              :
echo :                                      :
echo :                                      :
echo :                                      :
echo :                                      :
echo ========================================
echo :start:                 %date%:
set /p comand= 
IF %comand% == 1 goto system
IF %comand% == 2 goto theme
IF %comand% == x goto cpexit
goto cpmenu

:system
cls
echo ========================================
echo : �]�w - �t��                        :x:
echo ========================================
echo :[-]�ա�                               :
echo :             �]�w - �t��              :
echo :                                      :
echo :           [1] �]�wBootMGR            :
echo :           [2] �]�wGUI [BETA]         :
echo :           [3] OneOS��s              :
echo :                                      :
echo :                                      :
echo :                                      :
echo ========================================
echo :start:                 %date%:
set /p comand=
if %comand% == 1 goto bootmgr
if %comand% == 2 goto setgui
if %comand% == 3 goto update
if %comand% == - goto cpmenu
IF %comand% == x goto cpexit
goto system

:theme
cls
echo ========================================
echo : �]�w - �ӤH��                      :x:
echo ========================================
echo :[-]�ա�                               :
echo :             �]�w - �ӤH��            :
echo :                                      :
echo :       [1] �]�w���G�ζ·t�Ҧ�         :
echo :                                      :
echo :                                      :
echo :                                      :
echo :                                      :
echo :                                      :
echo ========================================
echo :start:                 %date%:
set /p comand=
if %comand% == 1 goto verlod
if %comand% == - goto cpmenu
IF %comand% == x goto cpexit
goto system

:verlod
cd ..\..\etc
if EXIST basic.bat (goto lod2) else (goto verlod2)

:verlod2
if EXIST pro.bat (goto lod2) else (goto cantuse)

:lod2
cls
echo ========================================
echo : �]�w - �ӤH�� - �]�w���G�ζ·t�Ҧ� :x:
echo ========================================
echo :[-]�ա�                               :
echo :             �]�w - �ӤH��            :
echo :                                      :
echo :        [1] ���G�Ҧ� LightMode        :
echo :        [2] �·t�Ҧ� DarkMode         :
echo :                                      :
echo :                                      :
echo :                                      :
echo :                                      :
echo ========================================
echo :start:                 %date%:
set /p lod=
if %lod% == 1 goto light
if %lod% == 2 goto dark
if %lod% == - goto theme
if %lod% == x goto cpexit
goto lod

:light
cd ..\..\etc
echo set themelod=F0 > infothemelod.bat
timeout /t 1 >nul 2 >nul
call infothemelod.bat
cd ..\OneOS\System32
color %themelod%
goto lod2

:dark
cd ..\..\etc
echo set themelod=0F > infothemelod.bat 
timeout /t 1 >nul 2 >nul
call infothemelod.bat
cd ..\OneOS\System32
color %themelod%
goto lod2

:bootmgr
cd ..\..\..\..\EFIStorage\profile
goto mgr

:setgui
cls
echo ========================================
echo : �]�w - �t�� - �d�˪��s��           :x:
echo ========================================
echo :                                      :
echo :                                      :
echo :                                      :
echo :                                      :
echo :   �{�b��BETA�\��H���m�A�L�k�A�ϥ�   :
echo :                                      :
echo :                                      :
echo :                                      :
echo :                                      :
echo ========================================
echo :start:                 %date%:
pause > nul
goto system

:setguif
cd ..\..\etc
del GUI.bat
cd ..\OneOS\System32
timeout /t 1 >nul 2 >nul
goto setgui

:mgr
cls
echo ========================================
echo : �]�w - �t�� - �]�wBootMGR          :x:
echo ========================================
echo :[-]�ա�                               :
echo :       �]�w - �t�� - �]�wBootMGR      :
echo :                                      :
echo :           [1] �����Ҧ����           :
echo :           [2] �}�ҹw�]�}��BootMGR    :
echo :           [3] �����w�]�}��BootMGR    :
echo :                                      :
echo :                                      :
echo ========================================
echo :start:                 %date%:
if %comand% == 1 goto delall
if %comand% == 2 goto delauto
if %comand% == 3 goto setos
if %comand% == - goto bmexit
if %comand% == x goto cpexit
goto mgr

:delall
del autopen.bat
cls
del info.bat
cls
echo ========================================
echo : �]�w - �t�� - �]�wBootMGR          :x:
echo ========================================
echo :                                      :
echo :                                      :
echo :                                      :
echo :               �ާ@���\�I             :
echo :                                      :
echo :                                      :
echo :                                      :
echo :                                      :
echo ========================================
echo :start:                 %date%:
timeout /t 2 >nul
goto mgr

:delauto
del autopen.bat
cls
echo ========================================
echo : �]�w - �t�� - �]�wBootMGR          :x:
echo ========================================
echo :                                      :
echo :                                      :
echo :                                      :
echo :               �ާ@���\�I             :
echo :                                      :
echo :                                      :
echo :                                      :
echo :                                      :
echo ========================================
echo :start:                 %date%:
timeout /t 2 >nul
goto mgr

:setos
call bootlist.bat
cls
echo BootMGR Mode
echo.
echo.      %load1%
echo.      %load2%
echo.      %load3%
echo.      %load4%
echo.      %load5%
echo.
set /p setdboot=�г]�w�w�]�}���t��: 
if %setdboot% == %load1% goto setdboot
if %setdboot% == %load2% goto setdboot
if %setdboot% == %load3% goto setdboot
if %setdboot% == %load4% goto setdboot
if %setdboot% == %load5% goto setdboot
goto setos

:setdboot
set /p setsys=�ư��������H�~�A�г]�wsys�W��(SakuraOS/OneOS)�Ϥ��j�p�g�I 
echo set dboot=%setdboot% >> autopen.bat
echo set dbootsys=%setsys% >> autopen.bat
echo �����]�w�I > info.bat
goto mgr

:update
md temp
cls
echo ========================================
echo : �]�w - �t�� - OneOS Update         :x:
echo ========================================
echo :                                      :
echo :                                      :
echo :                                      :
echo :             ���b�ˬd��s             :
echo :                                      :
echo :                                      :
echo :                                      :
echo :                                      :
echo ========================================
echo :start:                 %date%:
if EXIST logindev (goto updated) else (goto bcheck)

:bcheck
cls
echo ========================================
echo : �]�w - �t�� - OneOS Update         :x:
echo ========================================
echo :                                      :
echo :                                      :
echo :                                      :
echo :             ���b�ˬd��s             :
echo :                                      :
echo :                                      :
echo :                                      :
echo :                                      :
echo ========================================
echo :start:                 %date%:
if EXIST loginbeta (goto updateb) else (goto pvcheck)

:pvcheck
cls
echo ========================================
echo : �]�w - �t�� - OneOS Update         :x:
echo ========================================
echo :                                      :
echo :                                      :
echo :                                      :
echo :             ���b�ˬd��s             :
echo :                                      :
echo :                                      :
echo :                                      :
echo :                                      :
echo ========================================
echo :start:                 %date%:
if EXIST loginpv (goto updatepv) else (goto updates)

:updates
timeout /t 4 >nul 2>nul
cd temp
echo set rnd=update%random%%random% > rnd.bat
call rnd.bat
cls
md %rnd%
cd %rnd%
git clone https://github.com/Swarmed2674/UpdateInfo.git
cd UpdateInfo
if EXIST %ver% (goto noupdate) else (goto scupdate)

:updatepv
timeout /t 4 >nul 2>nul
cd temp
echo set rnd=updatepv%random%%random% > rnd.bat
call rnd.bat
cls
md %rnd%
cd %rnd%
git clone https://github.com/Swarmed2674/PVUpdateInfo.git
cd UpdateInfo
if EXIST %ver% (goto noupdate) else (goto cupdatepv)

:updated
timeout /t 4 >nul 2>nul
cd temp
echo set rnd=updated%random%%random% > rnd.bat
call rnd.bat
cls
md %rnd%
cd %rnd%
git clone https://github.com/Swarmed2674/DUpdateInfo.git
cd UpdateInfo
if EXIST %ver% (goto noupdate) else (goto cupdate)

:noupdate
cls
echo ========================================
echo : �]�w - �t�� - OneOS Update         :x:
echo ========================================
echo :                                      :
echo :                                      :
echo :                                      :
echo :            �S���i�Ϊ���s�I          :
echo :                                      :
echo :                                      :
echo :                                      :
echo :                                      :
echo ========================================
echo :start:                 %date%:
pause >nul
goto system

:scupdate
cls
echo ========================================
echo : �]�w - �t�� - OneOS Update         :x:
echo ========================================
echo :                                      :
echo :                                      :
echo :                                      :
echo :              ���s����s�I            :
echo :                                      :
echo :        �O�_�ߧY�w�˧�s(Y/N)?        :
echo :                                      :
echo :                                      :
echo ========================================
echo :start:                 %date%:
set /p uw=
if %uw% == Y goto installnew
if %uw% == N goto noupdate
if %uw% == x goto cpexit
goto update

:installnew
cls
echo ========================================
echo : �]�w - �t�� - OneOS Update         :x:
echo ========================================
echo :                                      :
echo :                                      :
echo :                                      :
echo :        OneOS���b�U����s���         :
echo :                                      :
echo :                                      :
echo :                                      :
echo :                                      :
echo ========================================
echo :start:                 %date%:
timeout /t 5 >nul 2>nul
cd ..
cd ..
cd ..
echo Temp > NowUpdate.tmp
cd SoftwareUpdate
git clone https://github.com/Swarmed2674/UpdateData.git
cd UpdateData
cls
echo ========================================
echo : �]�w - �t�� - OneOS Update         :x:
echo ========================================
echo :                                      :
echo :                                      :
echo :                                      :
echo :        OneOS�N�b10���ֳt����       :
echo :                                      :
echo :                                      :
echo :                                      :
echo :                                      :
echo ========================================
echo :start:                 %date%:
timeout /t 10 >nul 2>nul
cd ..
cd ..
start Kernel32.bat
exit

:cantuse
echo ========================================
echo : �]�w - �ҥο��~                    :x:
echo ========================================
echo :                                      :
echo :                                      :
echo :                                      :
echo :       ���ҥΡA�z�L�v�ϥΦ��\��       :
echo :                                      :
echo :                                      :
echo :                                      :
echo :                                      :
echo ========================================
echo :start:                 %date%:echo.
pause
goto theme

:bmexit
cd ..\OneOS\Storage\OneOS\System32
goto cpmenu

:cpexit
title OneOS
goto comand