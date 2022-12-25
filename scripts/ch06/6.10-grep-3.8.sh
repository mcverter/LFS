bash -xv $HOME/LFS/scripts/ch00/lfs_user_login.sh
cd $LFS_SOURCES_DIR || exit 1

tar xf 6.10-grep-3.8.tar.gz
cd 6.10-grep-3.8

./configure --prefix=/usr --host=$LFS_TGT
make
make DESTDIR=$LFS install
