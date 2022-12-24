bash -xv $HOME/scripts/ch00/lfs_sources_dir.sh || exit 1

tar xf coreutils-9.1.tar.gz
cd coreutils-9.1

../configure --prefix=/usr --host=$LFS_TGT --build=$(build-aux/config.guess) --enable-install-program=hostname --enable-no-install-program=kill,uptime

make
make DESTDIR=$LFS install
mv -v $LFS/usr/bin/chroot $LFS/usr/sbin
mkdir -pv $LFS/usr/share/man/man8
mv -v $LFS/usr/share/man/man1/chroot.1 $LFS/usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/' $LFS/usr/share/man/man8/chroot.8