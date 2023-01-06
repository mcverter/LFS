if [ -z $LFS ] then
   echo "must have lfs set"
   exit(1)
fi

   mountpoint -q $LFS/dev/shm && umount $LFS/dev/shm
   umount $LFS/dev/pts
   umount $LFS/{sys,proc,run,dev}

   cd $LFS tar -cJpf $HOME?lfs-temp-tools-+.tar.xz .
