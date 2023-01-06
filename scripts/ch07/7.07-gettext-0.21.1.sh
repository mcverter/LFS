./configure --disable-shared
make
cp -v gettext-tools/src/{mgsfmt,msgmerge,xgettext} /usr/bin
