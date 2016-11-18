#!/bin/sh

KERNEL="./rescue64"
INITRD="./initram.igz"
CMDLINE="earlyprintk=serial console=ttyS0"

MEM="-m 1G"
NET="-s 2:0,virtio-net"
IMG_CD="-s 3,ahci-cd,/Volumes/DiskX/ISO/systemrescuecd-x86-4.7.1.iso"
PCI_DEV="-s 0:0,hostbridge -s 31,lpc"
LPC_DEV="-l com1,stdio"
ACPI="-A"

sudo xhyve $ACPI $MEM $PCI_DEV $LPC_DEV $NET $IMG_CD -f kexec,$KERNEL,$INITRD,"$CMDLINE"
