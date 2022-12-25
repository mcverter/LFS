bash -xv $HOME/LFS/scripts/ch00/lfs_user_login.sh
cd $LFS_SOURCES_DIR || exit 1

tar xf gcc-12.2.0.tar.gz
cd gcc-12.2.0
tar -xf ../mpfr-4.1.1.tar.xz
mv -v mpfr-4.1.1 mpfr
tar -xf ../gmp-6.2.1.tar.xz
mv -v gmp-6.2.1 gmp
tar -xf ../mpc-1.2.1.tar.gz
mv -v mpc-1.2.1 mpc
case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
 ;;
esac

sed '/thread_header =/s/@.*/gthr-posix.h' -i libgcc/Makefile.in libstdc++-v3/include/Makefile.in

mkdir -v build
cd build



../configure --prefix=/usr --host=$LFS_TGT --build=$(../config.guess) LDFLAGS_FOR_TARGET=-L$PWD/$LFS_TGT/libgcc --target=$LFS_TGT --with-build-systroot=$LFS --enable-default-pie --enable-default-ssp --disable-nls --disable-multilib --disable-libatomic --disable-libgomp --disable-libquadmath --disable-libssp --disable-lbvtv --enable-languages=c,c++
make
make DESTDIR=$LFS install

ln -sv gcc $LFS/usr/bin/cc
