for file in `ls *.sh` ; do
    if [ $file != $0 ] ; then 
	echo $file;
	bash -xv $file
    fi;
done;
