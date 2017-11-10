@set dt0=%DATE% %TIME%
@echo %dt0%
pushd ..\build
cmake --build .
popd
@set dt1=%DATE% %TIME%
@echo ----==== dt1-dt0 ====----
@echo %dt0%
@echo %dt1%