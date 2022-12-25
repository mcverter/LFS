bash -xv $HOME/LFS/scripts/ch00/lfs_user_login.sh || exit 1
cd /mnt/lfs/sources

tar xf tar-1.34.tar.gz
cd tar-1.34

./configure --prefix=/usr --host=$LFS_TGT  --build=$(build-aux/config.guess)
make
make DESTDIR=$LFS install

