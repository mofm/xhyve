#!/bin/sh

# RancherOS
KERNEL="./vmlinuz-v0.7.1-rancheros"
INITRD="./initrd-v0.7.1-rancheros"
CMDLINE="earlyprintk=serial quiet console=ttyS0 acpi=off rancher.state.dev=LABEL=RANCHER_STATE ran"

MEM="-m 2G"
SMP="-c 2"
NET="-s 2:0,virtio-net"
IMG_HDD="-s 4,virtio-blk,./rancheros.img"
PCI_DEV="-s 0:0,hostbridge -s 31,lpc"
LPC_DEV="-l com1,stdio"
UUID="-U deadbeef-dead-dead-dead-deaddeafbeef"
sudo xhyve $ACPI $MEM $SMP $PCI_DEV $LPC_DEV $NET $IMG_CD $IMG_HDD $UUID \
  -f kexec,$KERNEL,$INITRD,"$CMDLINE"
