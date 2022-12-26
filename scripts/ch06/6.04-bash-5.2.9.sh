./configure --prefix=/usr --build=$(sh support/config.guess) --host=$LFS_TGT --without-bash-malloc
make
make DESTDIR=$LFS install
if [ ! -e $LFS/bin/sh ]
then
    ln -sv bash 
fi
