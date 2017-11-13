@if "%1"=="" (
    @echo SYNTAX: %~nx0 [path\dir]
    @rem set %1 "."
    exit /B
)
@echo "==== %~f0 %1 ==== "
@rem for /r %%i in (%1) do @echo %%~fi
@rem forfiles /S /P %1 /M src\*.hpp /C "cmd /c echo @path"

::delele astyle garbage
@del /S *~ >NUL 2>&1
@del /S *~~ >NUL 2>&1
@del /S *~~~ >NUL 2>&1

forfiles /S /P %1 /M *.cpp /C "cmd /C astyle.exe --style=gnu --mode=c --indent-namespaces --indent=spaces=2 -xT8 -xt4 --add-brackets --max-code-length=120 --align-pointer=name --indent-classes --pad-header --pad-first-paren-out --suffix=none @path"
forfiles /S /P %1 /M *.hpp /C "cmd /c astyle.exe --style=gnu --mode=c --indent-namespaces --indent=spaces=2 -xT8 -xt4 --add-brackets --max-code-length=120 --align-pointer=name --indent-classes --pad-header --pad-first-paren-out --suffix=none @path"

::delele astyle garbage
@del /S *~ >NUL 2>&1
@del /S *~~ >NUL 2>&1
@del /S *~~~ >NUL 2>&1
