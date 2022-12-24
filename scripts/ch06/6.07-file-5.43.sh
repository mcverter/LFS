bash -xv $HOME/scripts/ch00/lfs_sources_dir.sh || exit 1

tar xf file-5.43.tar.gz
cd file-5.43
mkdir build
pushd build
  ../configure --disable-bzlib --disable-libseccomp --disable-xzlib --disable-zlib
  make
popd

./configure --prefix=/usr --host=$LFS_TGT  --build$(./config.guess)
make FILE_COMPILE=$(pwd)/build/src/file
make DESTDIR=$LFS install

rm -v $LFS/usr/lib/libmagic.la
