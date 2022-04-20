@echo off

set A_COMP_PATH=\\10.150.6.2\Common_stud\Borodina\A\

if not exist %A_COMP_PATH%Bank\e goto ex
if exist H: net use H: /delete /y >nul
net use H: %A_COMP_PATH%Bank\e >nul /y


:ex
pause
exit