@set dt0=%DATE% %TIME%
@title %cd% : %~n0%~x0 : %dt0% ...
@echo %dt0%
rmdir /S /Q ..\build  &  mkdir ..\build & pushd ..\build
cmake -G "Visual Studio 15 2017 Win64" -DUNIT_TESTS=ON ..\repo
popd
@set dt1=%DATE% %TIME%
@echo ----==== dt1-dt0 ====----
@echo %dt0%
@echo %dt1%
@title %cd% : %~n0%~x0 : %dt0% ... %dt1%