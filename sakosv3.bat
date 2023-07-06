:check
if exist info.bat (goto ifexistinfo)
if exist infothemelod.bat (goto ifexistthemeinfo)
if exist sakosv3.bat (goto ifexistsakosv3) else (goto run)

:ifexistsakosv3
ren sakosv3.bat sakos.bat
goto check

:ifexistinfo
ren info.bat config.bat
goto check

:ifexistthemeinfo
ren infothemelod.bat themelod.bat
goto check

:run
call config.bat
call ver.bat
call oem.bat
call themelod.bat