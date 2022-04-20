@echo off

set A_COMP_PATH=\\10.150.6.2\Common_stud\Borodina\A\

if not exist %A_COMP_PATH%Tovar\c goto ex
if exist S: net use S: /delete /y > nul
net use S: %A_COMP_PATH%Tovar\c >nul /y


:ex
pause
exit