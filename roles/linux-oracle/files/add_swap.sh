#!/bin/sh

# size of swapfile in megabytes
swapsize=4096

echo 'Adding swapfile.'
#fallocate -l ${swapsize}M /swapfile2
dd if=/dev/zero of=/swapfile2 count=${swapsize} bs=1MiB
chmod 600 /swapfile2
mkswap /swapfile2
swapon /swapfile2
echo '/swapfile2 none swap defaults 0 0' >> /etc/fstab

# output results to terminal
df -h
cat /proc/swaps
cat /proc/meminfo | grep Swap
