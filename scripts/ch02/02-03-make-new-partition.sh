#!/usr/bin/dash

# PARTITION_LABEL="sda2"
if [[ -z $PARTITION_LABEL ]] ; then
    echo "No partition label $PARTITION_LABEL"
    exit 1
fi


export LFS=/mnt/lfs
echo $LFS

if [[ ! -d $LFS ]] ; then
    DISK_PARTITION=/dev/$PARTITION_LABEL
    sudo mkfs -v -t ext4 $DISK_PARTITION
    sudo mkdir -pv $LFS
    sudo mount -v ext4 $DISK_PARTITION $LFS
fi

echo $LFS
