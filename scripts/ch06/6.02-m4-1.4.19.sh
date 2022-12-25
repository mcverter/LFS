bash -xv $HOME/LFS/scripts/ch00/lfs_user_login.sh
cd $LFS_SOURCES_DIR || exit 1

tar xf m4-1.4.19.tar.xz
cd m4-1.4.19

./configure --prefix=/usr --host=$LFS_TGT --build=$(build-aux/config.guess)
make
make install
make DESTDIR=$LFS install
