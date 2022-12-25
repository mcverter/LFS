bash -xv $HOME/LFS/scripts/ch00/lfs_sources_dir.sh || exit 1

tar xf make-4.4.tar.gz
cd make-4.4

sed -e '/ifdef SIGPIPE/, +2 d' -e '/undef FATAL_SIG/i FATAL_SIG (SIGPIPE);' -i src/main.c

./configure --prefix=/usr --host=$LFS_TGT --without=guile --build=$(build-aux/config.guess)
make
make DESTDIR=$LFS install

