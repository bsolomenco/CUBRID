if [ $# -lt 1 ]; then
    echo "SYNTAX: ctp sql , ctp medium"
    exit -1
fi
dt0=$(date +"%Y-%m-%d %H:%M:%S")
echo $dt0
pushd ../testtools/CTP
cmd="bin/ctp.sh sql -c ./conf/$1.conf >ctp.txt 2>&1"
echo $cmd; $cmd
popd
dt1=$(date +"%Y-%m-%d %H:%M:%S")
echo ----==== dt1-dt0 ====----
echo $dt0
echo $dt1
