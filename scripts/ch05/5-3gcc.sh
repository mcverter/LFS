SOURCES_DIR=$LFS/sources
who=`whoami`
echo $who
if [ "$who" != "lfs" ] ; then
    echo "must be user lfs"
    exit 1
fi
echo "what"

# gcc
cd $SOURCES_DIR
tar -xf gcc-12.2.0.tar.xz
cd gcc-12.20
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

mkdir -v build
cd build
../configure --prefix=$LFS/tools --with-sysroot=$LFS --with-glibc-version=2.36 --target=$LFS_TGT --with-newlib  --without-headers --enable-default-pie --enable-default-ssp --disable-nls  --disable-shared --disable-multilib disable-threads disable-libatomic --disable-libgomp --disable-libquadmath --disable-libssp --disable-libvtv  --disable-libstdcxx --enable-languages=c,c++
make
make install
