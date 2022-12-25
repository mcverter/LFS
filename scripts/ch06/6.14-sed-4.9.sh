bash -xv $HOME/LFS/scripts/ch00/lfs_user_login.sh
cd $LFS_SOURCES_DIR || exit 1

tar xf sed-4.9.tar.gz
cd sed-4.9

./configure --prefix=/usr --host=$LFS_TGT
make
make DESTDIR=$LFS install

