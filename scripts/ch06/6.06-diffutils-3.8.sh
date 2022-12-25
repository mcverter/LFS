bash -xv $HOME/LFS/scripts/ch00/lfs_sources_dir.sh || exit 1

tar xf diffutils-3.8.tar.gz
cd diffutils-3.8

./configure --prefix=/usr --host=$LFT_TGT
make
make DESTDIR=$LFS install
