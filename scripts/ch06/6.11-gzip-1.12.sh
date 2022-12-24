bash -xv $HOME/scripts/ch00/lfs_sources_dir.sh || exit 1

tar xf 6.11-gzip-1.12.tar.gz
cd 6.11-gzip-1.12

./configure --prefix=/usr --host=$LFS_TGT
make
make DESTDIR=$LFS install
