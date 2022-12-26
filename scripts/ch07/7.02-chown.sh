sudo chown -R root::root $LFS{usr,lib,var,etc,bin,sbin,tools}
case $(uname -m) in
    x86_64) sudo chown -R root:root $LFS/lib64 ;;
esac

sudo mkdir -pv $LFS/{dev,proc,sys,run}

sudo mount -v --bind /dev $LFS/dev
sudo mount -v --bind /dev/pts $LFS/dev/pts
sudo mount -vt proc proc $LFS/proc
sudo mount -vt sysfs sysfs $LFS/sys
sudo mount -vt run run $LFS/run


if [ -h $LFS/dev/shm ]
then
    sudo mkdir -pv $LFS/$(readlink $LFS/dev/shm)
else
    sudo mount -t tmpfs -o nosuid,nodev tmpfs $LFS/dev/shm
fi

sudo chroot "$LFS" /usr/bin/env -i HOME=/root TERM="$TERM" PS1='(lfs chroot) \u:\w\$ ' PATH=/usr/bin:/usr/sbin /bin/bash --login

sudo mkdir -pv/{boot,home,mnt,opt,srv}

sudo mkdir -pv/etc/{opt,sysconfig}
sudo mkdir -pv/lib/firmware
sudo mkdir -pv/media/{floppy,cdrom}
sudo mkdir -pv/usr/{,local/}{include,src}
sudo mkdir -pv/usr/local/{bin,lib,sbin}
sudo mkdir -pv/usr/{,local/}share/{color,dict,doc,info,locale,man}
sudo mkdir -pv/usr/{,local/}share/{misc,terminfo,zoneinfo}
sudo mkdir -pv/usr/{,local/}share/man/man{1..8}
sudo mkdir -pv/var/{cache,local,log,mail,opt,spool}
sudo mkdir -pv/var/lib/{color,misc,locate}

sudo ln -sfv /run /var/run
sudo ln -sfv /run/lock /var/lock

sudo install -dv -m 0750 /root
sudo install -dv -m 1777 /tmp /var/tmp
