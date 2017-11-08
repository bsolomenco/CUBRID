dt0=$(date +"%Y-%m-%d %H:%M:%S")
echo $dt0
rm -rf ../build
mkdir ../build
pushd ../build
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=../inst -DUNIT_TESTS=ON ../repo
popd
dt1=$(date +"%Y-%m-%d %H:%M:%S")
echo ----==== dt1-dt0 ====----
echo $dt0
echo $dt1
