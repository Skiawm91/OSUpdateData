@echo off
title OneOS 設定
goto cpmenu

:cphelp
goto commands
start cphelp.vbs
goto cp

:cpmenu
cls
echo ========================================
echo : 設定                               :x:
echo ========================================
echo :                設定                  :
echo :                                      :
echo :              [1] 系統                :
echo :              [2] 個人化              :
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
echo : 設定 - 系統                        :x:
echo ========================================
echo :[-]＜－                               :
echo :             設定 - 系統              :
echo :                                      :
echo :           [1] 設定BootMGR            :
echo :           [2] 設定GUI [BETA]         :
echo :           [3] OneOS更新              :
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
echo : 設定 - 個人化                      :x:
echo ========================================
echo :[-]＜－                               :
echo :             設定 - 個人化            :
echo :                                      :
echo :       [1] 設定明亮或黑暗模式         :
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
echo : 設定 - 個人化 - 設定明亮或黑暗模式 :x:
echo ========================================
echo :[-]＜－                               :
echo :             設定 - 個人化            :
echo :                                      :
echo :        [1] 明亮模式 LightMode        :
echo :        [2] 黑暗模式 DarkMode         :
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
echo : 設定 - 系統 - 悲傷的哀號           :x:
echo ========================================
echo :                                      :
echo :                                      :
echo :                                      :
echo :                                      :
echo :   現在此BETA功能以內置，無法再使用   :
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
echo : 設定 - 系統 - 設定BootMGR          :x:
echo ========================================
echo :[-]＜－                               :
echo :       設定 - 系統 - 設定BootMGR      :
echo :                                      :
echo :           [1] 移除所有資料           :
echo :           [2] 開啟預設開啟BootMGR    :
echo :           [3] 關閉預設開啟BootMGR    :
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
echo : 設定 - 系統 - 設定BootMGR          :x:
echo ========================================
echo :                                      :
echo :                                      :
echo :                                      :
echo :               操作成功！             :
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
echo : 設定 - 系統 - 設定BootMGR          :x:
echo ========================================
echo :                                      :
echo :                                      :
echo :                                      :
echo :               操作成功！             :
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
set /p setdboot=請設定預設開機系統: 
if %setdboot% == %load1% goto setdboot
if %setdboot% == %load2% goto setdboot
if %setdboot% == %load3% goto setdboot
if %setdboot% == %load4% goto setdboot
if %setdboot% == %load5% goto setdboot
goto setos

:setdboot
set /p setsys=排除版本號以外，請設定sys名稱(SakuraOS/OneOS)區分大小寫！ 
echo set dboot=%setdboot% >> autopen.bat
echo set dbootsys=%setsys% >> autopen.bat
echo 完成設定！ > info.bat
goto mgr

:update
md temp
cls
echo ========================================
echo : 設定 - 系統 - OneOS Update         :x:
echo ========================================
echo :                                      :
echo :                                      :
echo :                                      :
echo :             正在檢查更新             :
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
echo : 設定 - 系統 - OneOS Update         :x:
echo ========================================
echo :                                      :
echo :                                      :
echo :                                      :
echo :             正在檢查更新             :
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
echo : 設定 - 系統 - OneOS Update         :x:
echo ========================================
echo :                                      :
echo :                                      :
echo :                                      :
echo :             正在檢查更新             :
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
echo : 設定 - 系統 - OneOS Update         :x:
echo ========================================
echo :                                      :
echo :                                      :
echo :                                      :
echo :            沒有可用的更新！          :
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
echo : 設定 - 系統 - OneOS Update         :x:
echo ========================================
echo :                                      :
echo :                                      :
echo :                                      :
echo :              有新的更新！            :
echo :                                      :
echo :        是否立即安裝更新(Y/N)?        :
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
echo : 設定 - 系統 - OneOS Update         :x:
echo ========================================
echo :                                      :
echo :                                      :
echo :                                      :
echo :        OneOS正在下載更新資料         :
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
echo : 設定 - 系統 - OneOS Update         :x:
echo ========================================
echo :                                      :
echo :                                      :
echo :                                      :
echo :        OneOS將在10秒後快速重啟       :
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
echo : 設定 - 啟用錯誤                    :x:
echo ========================================
echo :                                      :
echo :                                      :
echo :                                      :
echo :       未啟用，您無權使用此功能       :
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