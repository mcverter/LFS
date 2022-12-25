bash -xv $HOME/LFS/scripts/ch00/lfs_user_login.sh || exit 1
cd /mnt/lfs/sources

tar xf 6.10-grep-3.8.tar.gz
cd 6.10-grep-3.8

./configure --prefix=/usr --host=$LFS_TGT
make
make DESTDIR=$LFS install
