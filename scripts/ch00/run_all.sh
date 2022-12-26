SCRIPT_DIR=`pwd`
for file in `ls *.sh` ; do
    if [ $file != $0 ] ; then 
        program=`echo $file | awk -F- '{print $2"-"$3}' | sed 's/...$//'`
        bash -xv $HOME/LFS/scripts/ch00/lfs_user_login.sh || exit 1
        cd $LFS_SOURCES_DIR
	echo "Installing $program"
	if [ -e $program.tar.xz ]
	then
            tar xf $program.tar.xz || exit 1
	elif [ -e $program.tar.gz ] 
	then
	    tar xf $program.tar.gz || exit 1
	else
	    echo "could not extract archive"
	    exit 1
	fi
        cd $program
	bash -xv $SCRIPT_DIR/$file || exit 1
        cd $LFS_SOURCES_DIR
        rm -rf $program
    fi;
done;
