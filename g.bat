@echo %DATE% %TIME%
@echo "----==== remove & recreate "../build" ====----"
rmdir /S /Q ..\build  &  mkdir ..\build
pushd ..\build
@echo "----==== start build ====----"
cmake -G "Visual Studio 15 2017 Win64" -DUNIT_TESTS=ON ..\repo
popd
@echo %DATE% %TIME%