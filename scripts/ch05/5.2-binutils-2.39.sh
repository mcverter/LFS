if [ ! -d build ]; then 
    mkdir -v build
fi
cd build

echo PWS `pwd`
../configure --prefix=$LFS/tools --with-sysroot=$LFS --target=$LFS_TGT --disable-nls --enable-gprofng=no --disable-werror

make
make install
