bash -xv $HOME/LFS/scripts/ch00/lfs_user_login.sh
cd $LFS_SOURCES_DIR || exit 1

tar xf tar-1.34.tar.gz
cd tar-1.34

./configure --prefix=/usr --host=$LFS_TGT  --build=$(build-aux/config.guess)
make
make DESTDIR=$LFS install

