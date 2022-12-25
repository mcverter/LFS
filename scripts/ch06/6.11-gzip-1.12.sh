bash -xv $HOME/LFS/scripts/ch00/lfs_user_login.sh || exit 1
cd /mnt/lfs/sources

tar xf 6.11-gzip-1.12.tar.gz
cd 6.11-gzip-1.12

./configure --prefix=/usr --host=$LFS_TGT
make
make DESTDIR=$LFS install
