WHO=`whoami`

if [ $WHO != "lfs" ] ; then
    echo "Must be LFS user" 
    exit 1
fi
INSTALL_DIR=$LFS/sources
cd $INSTALL_DIR

tar xf gcc-12.2.0.tar.gz
cd gcc-12.2.0
mkdir -v build
cd build

../libstdc++-v3/configure --host=$LFS_TGT --build=$(../config.guess) --prefix=/usr --disable-multilib --disable-nls --disable-libstdcxx-pch --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/12.2.0

#../libstdc++-v3/configure --host=$LFS_TGT --build=$(../config.guess) --prefix=/usr --disable-multilib --disable-nls --disable-libstdcxx-pch --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/12.2.0

make
make  install

rm -v $LFS/usr/lib/lib{stdc++,stdc++fs,supc++}.la
