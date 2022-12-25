WHO=`whoami`

if [ $WHO != "lfs" ] ; then
    echo "Current user is not LFS"
    echo "Exiting ..."
    exit 1
fi

if [ -z $LFS ]; then 
    echo "LFS variable is not set"
    echo "Exiting ..."
    exit 1

fi 

if [ -z $LFS_SOURCES_DIR ]; then 
    echo "LFS_SOURCES_DIR variable is not set"
    echo "Exiting ..."
    exit 1
fi 