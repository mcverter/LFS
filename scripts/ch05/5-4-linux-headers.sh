WHO=`whoami`

if [ $WHO != "lfs" ] ; then
    echo "Must be LFS user" 
    exit 1
fi

INSTALL_DIR=$LFS/sources
cd $INSTALL_DIR
tar xf linux-6.0.11.tar.xz
cd linux-6.0.11

make headers
find usr/include -type f ! -name '*.h' -delete
cp -rv usr/include $LFS/usr
