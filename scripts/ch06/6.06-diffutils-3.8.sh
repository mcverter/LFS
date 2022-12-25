bash -xv $HOME/LFS/scripts/ch00/lfs_user_login.sh || exit 1
cd /mnt/lfs/sources

tar xf diffutils-3.8.tar.gz
cd diffutils-3.8

./configure --prefix=/usr --host=$LFT_TGT
make
make DESTDIR=$LFS install
