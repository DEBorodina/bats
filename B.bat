@echo off
@chcp 65001
setlocal enabledelayedexpansion

set B_COMP_PATH=C:\Users\USER\Downloads\B\
set k1=%B_COMP_PATH%k1
set k2=%B_COMP_PATH%k2
set k3=%B_COMP_PATH%k3

if exist %k1%\k2New (
	if exist %k3%\k2Old rd %k3%\k2Old /q /s > nul
	move %k1%\k2New %k3%\k2Old > nul
)
if exist %k3%\k1New (
	if exist %k2%\k1Old rd %k2%\k1Old /q /s > nul
	move %k3%\k1New %k2%\k1Old > nul
)
if exist %k1%\k3New (
	if exist %k2%\k3Old rd %k2%\k3Old /q /s > nul
	move %k1%\k3New %k2%\k3Old >nul
)

call :copyDir %k1%\d\lectures %k3%\k1New
call :copyDir %k1%\d\Заказчики %k3%\k1New
call :copyDir %k1%\d\Заказчики\БНТУ %k3%\k1New
call :copyDirAndSubDir %k1%\d\Заказчики\БГУ %k3%\k1New
call :copyDirAndSubDir %k2%\d\texts %k1%\k2New
call :copyDir %k2%\e %k1%\k2New
call :copyDir %k3%\data\Документация %k1%\k3New

goto ex

:copyDirAndSubDir
	call :copyDir %1 %2 
	for /f "tokens=\*" %%i in ('dir ""%1"\*" /ad /S /B') do (
		echo go
		set f=%%i
		set f=!f:%1=%2!
		for %%j in ("%%i\*") do (
			xcopy "%%j" "!f!\" /y /q /i > nul
		)
	)
	exit /b

:copyDir
	if not exist %2 md %2

	for %%i in (""%1"\*") do (
		xcopy "%%i" "%2" /y /q /i > nul
	)
	exit /b


:ex
echo finished
pause
exit