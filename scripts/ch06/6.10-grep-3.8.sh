bash -xv $HOME/LFS/scripts/ch00/lfs_sources_dir.sh || exit 1

tar xf 6.10-grep-3.8.tar.gz
cd 6.10-grep-3.8

./configure --prefix=/usr --host=$LFS_TGT
make
make DESTDIR=$LFS install
