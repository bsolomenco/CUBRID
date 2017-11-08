dt0=$(date +"%Y-%m-%d %H:%M:%S")
echo $dt0
pushd ../build
cmake --build .
popd
dt1=$(date +"%Y-%m-%d %H:%M:%S")
echo ----==== dt1-dt0 ====----
echo $dt0
echo $dt1
