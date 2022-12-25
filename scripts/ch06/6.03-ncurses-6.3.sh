bash -xv $HOME/LFS/scripts/ch00/lfs_user_login.sh
cd $LFS_SOURCES_DIR || exit 1

tar xf ncurses-6.3.tar.gz
cd ncurses-6.3

sed -i s/mawk// configure

mkdir build
pushd build
  ../configure
  make -C include
  make -C progs tic
popd

./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess) --mandir=/usr/share/man --with-manpage-formal=normal --with-shared --without-normal --with-cxx-shared --without-debug --without-ada --disable-stripping --enable-widec

make
make DESTDIR=$LFS TIC_PATH=$(pwd)/build/progs/tic install
echo "INPUT(-lcursesw)" > $LFS/usr/lib/libncurses.so


