#! /bin/bash
virsh destroy vm1
virsh undefine vm1
virsh destroy vm2
virsh undefine vm2

virsh net-destroy external
virsh net-undefine external
virsh net-destroy internal
virsh net-undefine internal
virsh net-destroy management
virsh net-undefine management

rm vm1.img
rm vm1config.iso
rm vm2.img
rm vm2config.iso
rm -r config-drives
rm -r networks
rm xenial-server-cloudimg-amd64-disk1.img
