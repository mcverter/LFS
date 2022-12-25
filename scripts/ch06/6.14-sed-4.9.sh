bash -xv $HOME/LFS/scripts/ch00/lfs_user_login.sh || exit 1
cd /mnt/lfs/sources

tar xf sed-4.9.tar.gz
cd sed-4.9

./configure --prefix=/usr --host=$LFS_TGT
make
make DESTDIR=$LFS install

