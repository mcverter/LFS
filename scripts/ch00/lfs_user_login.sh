WHO=`whoami`

if [ $WHO != "lfs" ] ; then
    echo "Current user is not LFS"
    echo "Exiting ..."
    exit 1
fi

