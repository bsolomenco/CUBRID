#================================================================
scriptDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
printf "DBG scriptDir = $scriptDir \n"

#================================================================
runCmd () {
    #echo "TR0 $@"; eval "$@"; local rc=$?
    echo "TR0 $@"
    eval "$@"
    local rc=$?
    
    #if [ $rc -ne 0 ]; then echo "ERR $rc $@";exit $rc; fi
    if [ $rc -ne 0 ]
    then
        echo "ERR $rc $@"
        exit $rc
    fi
}

#================================================================
cloneFunc () {
    runCmd "rm -rf $scriptDir/repo"
    runCmd "git clone https://github.com/bsolomenco/cubrid $scriptDir/repo"
    runCmd "pushd $scriptDir/repo"
    runCmd "git remote add upstream https://github.com/CUBRID/cubrid"
    runCmd "git remote -v"
    runCmd "git fetch"
    runCmd "git fetch upstream"
    runCmd "git merge upstream/develop"
    runCmd "popd"
}

#================================================================
generateFunc () {
    runCmd "rm -rf $scriptDir/build"
    runCmd "mkdir $scriptDir/build"
    runCmd "pushd $scriptDir/build"
    local generator='"Unix Makefiles"'
    runCmd "cmake -G $generator -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=../inst -DUNIT_TESTS=ON $scriptDir/repo"
    runCmd "popd"
}

#================================================================
buildFunc () {
    runCmd "pushd $scriptDir/build"
    runCmd "cmake --build ."
    runCmd "popd"
}

#================================================================
installFunc () {
    runCmd "pushd $scriptDir/build"
    runCmd "cmake --build . --target install"
    runCmd "popd"
}

#================================================================
dt_0=$(date +"%Y-%m-%d %H:%M:%S")
for arg in "$@"; do
    echo "================================================================ $arg"

    dt0=$(date +"%Y-%m-%d %H:%M:%S")
    printf "TIM %s\n" "$dt0"

    eval "$arg""Func"

#    case "$arg" in
#
#        'clone')
#            cloneFunc
#            ;;
#
#        'generate')
#            generateFunc
#            ;;
#
#        'build')
#            buildFunc
#            ;;
#
#        'install')
#            installFunc
#            ;;
#
#        *)
#            echo "WRN unknown command"
#            ;;
#    esac

    dt1=$(date +"%Y-%m-%d %H:%M:%S")
    printf "TIM %s\nTIM %s\n" "$dt0" "$dt1"
done
printf "================================================================ SUMMARY\n"
printf "DBG scriptDir = $scriptDir \n"
dt_1=$(date +"%Y-%m-%d %H:%M:%S")
printf "TIM %s\nTIM %s\n" "$dt_0" "$dt_1"