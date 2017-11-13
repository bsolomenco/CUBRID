@if "%1"=="" (
    @echo SYNTAX: %~nx0 [path\dir]
    @rem set %1 "."
    exit /B
)
@echo "==== %~f0 %1 ==== "
@rem for /r %%i in (%1) do @echo %%~fi
@rem forfiles /S /P %1 /M src\*.hpp /C "cmd /c echo @path"

forfiles /S /P %1 /M *.h /C "cmd /C indent.exe -l120 -lc120 @path"
forfiles /S /P %1 /M *.c /C "cmd /C indent.exe -l120 -lc120 @path"
