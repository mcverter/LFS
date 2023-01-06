mkdir -pv /var/lib/hwclock

./configure ADJTIME_PATH=/var/lib/hwclock/adjtime --libdir=/usr/lib --docdir=/usr/share/doc/util-linux-2.38.1 --disable-chfn-chsh --disable-login --disable-nologin --disable-su --disable-sepriv --disable-runuser --disable-pylibmount --disable-static --without-python runstatdir=/run

make
make install
