@echo off

set A_COMP_PATH=\\10.150.6.2\Common_stud\Borodina\A\

if not exist %A_COMP_PATH%Bank\e goto tovar
if exist H: net use H: /delete /y >nul
net use H: %A_COMP_PATH%Bank\e >nul /y

:tovar
if not exist %A_COMP_PATH%Tovar\c goto ex
if exist T: net use T: /delete /y >nul
net use T: %A_COMP_PATH%Tovar\c >nul /y

:ex
pause
exit