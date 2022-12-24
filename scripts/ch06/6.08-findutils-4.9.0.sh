bash -xv $HOME/scripts/ch00/lfs_sources_dir.sh || exit 1

tar xf findutils-4.9.0.tar.gz
cd findutils-4.9.0

./configure --prefix=/usr --localstatedir=/var/lib/locate --host=$LFS_TGT --build=$(build-aux/config.guess)
make
make DESTDIR=$LFS install
