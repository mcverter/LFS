bash -xv $HOME/scripts/ch00/lfs_sources_dir.sh || exit 1

tar -xv xz-5.2.9.tar.gz
cd xz-5.2.9

./configure --prefix=/usr --host=$LFS_TGT --build=$(build-aux/config.guess) --disable-static --docdir=/usr/share/doc/xz-5.2.9
make
make DESTDIR=$LFS install

rm -v $LFS/usr/lib/liblzma.la
