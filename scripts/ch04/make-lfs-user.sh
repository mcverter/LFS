#!/usr/bin/dash
export LFS=/mnt/lfs

sudo groupadd lfs
sudo useradd -s /bin/bash -g lfs -m -k /dev/null lfs
sudo passwd lfs
sudo chown -v lfs $LFS/{usr{,/*},lib,var,etc,bin,sbin,tools}
case $(uname -m) in
    x86_64) sudo chown -v lfs $LFS/lib64 ;;
esac
