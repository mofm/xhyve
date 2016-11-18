#!/bin/sh

# Ubuntu
KERNEL="./boot/vmlinuz-4.4.0-31-generic"
INITRD="./boot/initrd.img-4.4.0-31-generic"
CMDLINE="earlyprintk=serial quiet console=ttyS0 acpi=off root=/dev/vda1 ro"

MEM="-m 2G"
SMP="-c 2"
NET="-s 2:0,virtio-net"
IMG_HDD="-s 4,virtio-blk,./ubuntu.img"
PCI_DEV="-s 0:0,hostbridge -s 31,lpc"
LPC_DEV="-l com1,stdio"
UUID="-U deadbeef-dead-dead-dead-deaddeafbeef"
sudo xhyve $ACPI $MEM $SMP $PCI_DEV $LPC_DEV $NET $IMG_CD $IMG_HDD $UUID \
  -f kexec,$KERNEL,$INITRD,"$CMDLINE"
