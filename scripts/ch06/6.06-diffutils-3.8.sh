./configure --prefix=/usr --host=$LFT_TGT
make
make DESTDIR=$LFS install
