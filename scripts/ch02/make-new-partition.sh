#!/usr/bin/dash

# PARTITION_LABEL=""
DISK_PARTITION = /dev/$PARTITION_LABEL
mkfs -v -t ext4 $DISK_PARTITION

export LFS=/mnt/lfs
echo $LFS
mkdir -pv $LFS
mount -v ext4 $DISK_PARTITION $LFS
# /sbin/swapon -v /dev/<zzz>
echo $LFS
