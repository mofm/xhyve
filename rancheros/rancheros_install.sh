#!/bin/sh

KERNEL="./vmlinuz"
INITRD="./initrd"
CMDLINE="earlyprintk=serial console=ttyS0"

MEM="-m 1G"
NET="-s 2:0,virtio-net"
IMG_CD="-s 3,ahci-cd,/Volumes/DiskX/ISO/rancheros.iso"
IMG_HDD="-s 4,virtio-blk,rancheros.img"
PCI_DEV="-s 0:0,hostbridge -s 31,lpc"
LPC_DEV="-l com1,stdio"
ACPI="-A"

sudo xhyve $ACPI $MEM $PCI_DEV $LPC_DEV $NET $IMG_CD $IMG_HDD -f kexec,$KERNEL,$INITRD,"$CMDLINE"
