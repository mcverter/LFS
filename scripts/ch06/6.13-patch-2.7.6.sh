bash -xv $HOME/LFS/scripts/ch00/lfs_user_login.sh
cd $LFS_SOURCES_DIR || exit 1

tar xf patch-2.7.6.tar.gz
cd patch-2.7.6

./configure --prefix=/usr --host=$LFS_TGT --build=$(build-aux/config.guess)
make
make DESTDIR=$LFS install

