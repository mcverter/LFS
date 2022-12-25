bash -xv $HOME/LFS/scripts/ch00/lfs_sources_dir.sh || exit 1
tar xf gawk-5.2.1.tar.gz
cd gawk-5.2.1


sed -i 's/extras//' Makefile.in

./configure --prefix=/usr --host=$LFS_TGT --build=$(build-aux/config.guess)
make
make DESTDIR=$LFS install
