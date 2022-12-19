
HOME_DIR=$HOME
LFS_PROJECT_DIR=$HOME_DIR/LFS
LFSBOOK_DIR=$LFS_PROJECT_DIR/lfs
BLFSBOOK_DIR=$LFS_PROJECT_DIR/blfs

DIRECTORY_DIR=$LFS_PROJECT_DIR/documentation
HTML_DIR=$DIRECTORY_DIR/html
NOCHUNKS_DIR=$DIRECTORY_DIR/nochunks
NOCHUNKS_FILE=$NOCHUNKS_DIR/LFS-BOOK.html
TXT_DIR=$DIRECTORY_DIR/txt
TXT_FILE=$DIRECTORY_DIR/lfs-book.txt

if [ ! -e $DIRECTORY_DIR ]
then
    mkdir $DIRECTORY_DIR
fi


if [ ! -e $HTML_DIR ]
then
    mkdir $HTML_DIR
fi

if [ ! -e $NOCHUNKS_DIR ]
then
    mkdir $NOCHUNKS_DIR
fi

# touch nochunks.html

if [ ! -e $TXT_DIR ]
then
    mkdir $TXT_DIR
fi


cd $LFSBOOK_DIR
make BASEDIR=$HTML_DIR

echo " NOCHUNKS_DIR " $NOCHUNKS_DIR
# make BASEDIR=$HOME/LFS/documentation nochunks
make BASEDIR=$NOCHUNKS_DIR nochunks
echo " TXT_FILE "  $TXT_FILE
lynx -dump $NOCHUNKS_FILE > $TXT_FILE

