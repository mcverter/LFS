WHO=`whoami`

if [ $WHO != "lfs" ] ; then
    echo "Must be LFS user" 
    exit 1
fi

INSTALL_DIR=$LFS/sources
cd INSTALL_DIR
tar xf linux-5.19.2.tar.xz
cd linux-5.19.2

make headers
find usr/include -type f ! -name '*.h' -delete
cp -rv usr/include $LSF/usr
