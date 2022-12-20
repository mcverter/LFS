#!/usr/bin/dash
export LFS=/mnt/lfs

PARTITION_LABEL="sda4"
DISK_PARTITION=/dev/$PARTITION_LABEL

echo "LFS " $LFS
echo "DISK PARTITION " $DISK_PARTITION

mount -v ext4 $DISK_PARTITION $LFS
sudo mkdir -v $LFS/sources
sudo chmod -v a+wt $LFS/sources
echo `pwd`
wget --input-file=$HOME/LFS/documentation/html/wget-list-sysv --continue --directory-prefix=$LFS/sources
pushd $LFS/sources
md5sum -c md5sums
popd
echo $LFS
