SOURCES_DIR=$LFS/sources
who=`whoami`
echo $who
if [ "$who" != "lfs" ] ; then
    echo "must be user lfs"
    exit 1
fi
echo "what"

#binutils
cd $SOURCES_DIR
tar xf binutils-2.39.tar.xz
cd binutils-2.39
if [ ! -d build ]; then 
    mkdir -v build
fi
cd build

echo PWS `pwd`
../configure --prefix=$LFS/tools --with-sysroot=$LFS --target=$LFS_TGT --disable-nls --enable-gprofng=no --disable-werror

make
make install

