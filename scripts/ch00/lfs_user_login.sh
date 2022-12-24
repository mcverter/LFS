WHO=`whoami`

if [ $WHO != "lfs" ] ; then
    echo "Must be LFS user"
    echo "Trying to log in ..."
    su - lfs
fi

WHO=`whoami`

if [ $WHO != "lfs" ] ; then
    echo "Current user is not LFS"
    echo "Exiting ..."
    exit 1
fi

