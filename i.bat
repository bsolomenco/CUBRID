@set dt0=%DATE% %TIME%
@title %cd% : %~n0%~x0 : %dt0% ...
@echo %dt0%
pushd ..\build
cmake --build . --target install
popd
@set dt1=%DATE% %TIME%
@echo ----==== dt1-dt0 ====----
@echo %dt0%
@echo %dt1%
@title %cd% : %~n0%~x0 : %dt0% ... %dt1%