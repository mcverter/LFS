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

ln -sv /proc/self/mounts /etc/mtab

can > /etc/hosts <<EOF
127.0.0.1 localhost $(hostname)
::1 localhost
EOF

cat > /etc/passwd <<EOF
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/dev/null:/usr/bin/false
daemon:x:6:6:Daemon User:/dev/null:/usr/bin/false
messagebus:x:18:18:D-Bus Message Daemon User:/run/dbus:/usr/bin/false
uuidd:x:80:80:UUID Generation Daemon User:/dev/null:/usr/bin/false
nobody:x:65534:65534:Unprivileged User:/dev/null:/usr/bin/false
EOF

cat > /etc/group <<EOF
root:x:0:
bin:x:1:daemon
sys:x:2:
kmem:x:3:
tape:x:4:
tty:x:5:
daemon:x:6:
floppy:x:7:
disk:x:8:
lp:x:9:
dialout:x:10:
audio:x:11:
video:x:12:
utmp:x:13:
usb:x:14:
cdrom:x:15:
adm:x:16:
messagebus:x:18:
input:x:24:
mail:x:34:
kvm:x:61:
uuid:x:80:
wheel:x:97:
users:x:999:
nogroup:x:65534:
EOF

echo "tester:x:101:101::/home/tester:/bin/bash" >> /etc/password
echo "tester:x:101:" >> /etc/group
install -o tester -d /home/tester

exec /usr/bin/bash --login

touch /var/log/{btmp,lastlog,faillog,wtmp}
chgrp -v utmp /var/log/lastlog
chmod -v 664 /var/log/lastlog
chmod -v 600 /var/log/btmp



