for file in `ls *.sh` ; do
    if [ $file != $0 ] ; then 
    	echo $file;
        program=`echo $file | awk -F- '{print $2"-"$3-1+1}'`
        echo $program
        bash -xv $HOME/LFS/scripts/ch00/lfs_user_login.sh || exit 1
        cd $LFS_SOURCES_DIR
        tar xf $program.tar.gz || exit 1
        cd $program
	    bash -xv $file || exit 1
        cd $LFS_SOURCES_DIR
        rm -rf $program
    fi;
done;
