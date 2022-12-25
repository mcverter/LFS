bash -xv $HOME/LFS/scripts/ch00/lfs_user_login.sh
cd $LFS_SOURCES_DIR || exit 1

tar xf binutils-2.39.tar.gz
cd binutils-2.39.tar.gz

sed '6009s/$add_dir//' -i ltmain.sh

mkdir -v build
cd build

../configure --prefix=/usr --host=$LFS_TGT --build=(../config.guess) --disable-nls --enable-shared --enable-gprofng=no --disable-werror --enable-64-bit-bfd
make
make DESTDIR=$LFS install

rm -v $LFS/usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes}.{a,la}
