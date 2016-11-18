#!/bin/sh

KERNEL="./vmlinuz-virtgrsec"
INITRD="./initramfs-virtgrsec"
CMDLINE="modloop=/boot/modloop-virtgrsec modules=loop,squashfs,sd-mod,usb-storage quiet console=tty0 console=ttyS0,115200"

MEM="-m 1G"
NET="-s 2:0,virtio-net"
IMG_CD="-s 3,ahci-cd,/Volumes/DiskX/ISO/alpine-virt-3.4.6-x86_64.iso"
IMG_HDD="-s 4,virtio-blk,alpine.img"
PCI_DEV="-s 0:0,hostbridge -s 31,lpc"
LPC_DEV="-l com1,stdio"
ACPI="-A"

sudo xhyve $ACPI $MEM $PCI_DEV $LPC_DEV $NET $IMG_CD $IMG_HDD -f kexec,$KERNEL,$INITRD,"$CMDLINE"
