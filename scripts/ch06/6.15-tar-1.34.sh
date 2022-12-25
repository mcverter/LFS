bash -xv $HOME/LFS/scripts/ch00/lfs_sources_dir.sh || exit 1

tar xf tar-1.34.tar.gz
cd tar-1.34

./configure --prefix=/usr --host=$LFS_TGT  --build=$(build-aux/config.guess)
make
make DESTDIR=$LFS install

