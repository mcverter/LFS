bash -xv $HOME/scripts/ch00/lfs_sources_dir.sh || exit 1

tar xf bash-5.2.9.tar.gz
cd bash-5.2.9

./configure --prefix=/usr --build=$(sh support/config.guess) --host=$LFS_TGT --without-bash-malloc
make
make DESTDIR=$LFS install
ln -sv bash $LFS/bin/sh
