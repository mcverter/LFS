
HOME_DIR=/home/mcverter
LFS_PROJECT_DIR=$HOME_DIR/ComputerScienceKubuntu/LFS
LFSBOOK_DIR=$LFS_PROJECT_DIR/lfs
BLFSBOOK_DIR=$LFS_PROJECT_DIR/blfs

DIRECTORY_DIR=$LFS_PROJECT_DIR/documentation
HTML_DIR=$DIRECTORY_DIR/html
NOCHUNKS_FILE=$DIRECTORY_DIR/nochunks.html
TXT_DIR=$DIRECTORY_DIR/txt

if [ ! -e $DIRECTORY_DIR ]
then
    mkdir $DIRECTORY_DIR
fi


if [ ! -e $HTML_DIR ]
then
    mkdir $HTML_DIR
fi

touch NOCHUNKS_FILEnochunks.html

if [ ! -e $TXT_DIR ]
then
    mkdir $TXT_DIR
fi


cd $LFSBOOK_DIR
make BASEDIR=$HTML_DIR
make BASEDIR=$NOCHUNKSDIR nochunks
lynx -dump $NOCHUNKSDIR > $TXT_DIR

