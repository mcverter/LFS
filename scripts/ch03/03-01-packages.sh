#!/usr/bin/dash
export LFS=/mnt/lfs

echo "LFS " $LFS

# mount -v ext4 $DISK_PARTITION $LFS
sudo mkdir -v $LFS/sources
sudo chmod -v a+wt $LFS/sources
echo `pwd`
wget --input-file=$HOME/LFS/documentation/html/wget-list-sysv --continue --directory-prefix=$LFS/sources
pushd $LFS/sources
md5sum -c md5sums
popd
echo $LFS
