#! /bin/bash 
source config
exec 1> config-drives/vm1-config/meta-data
echo "instance-id: 107fd8f9-26b7-4825-8f2d-797fc25f131f"
echo "hostname: vm1"
echo "local-hostname: vm1"
echo "public-keys:"
echo " - "$(cat $SSH_PUB_KEY)
echo "network-interfaces: |" 

echo "  auto $VM1_EXTERNAL_IF"
echo "  iface $VM1_EXTERNAL_IF inet dhcp"
echo "  dns-nameservers $VM_DNS"

echo "  auto $VM1_INTERNAL_IF"
echo "  iface $VM1_INTERNAL_IF inet static"
echo "  address $VM1_INTERNAL_IP"
echo "  netmask $INTERNAL_NET_MASK"

echo "  auto $VM1_MANAGEMENT_IF"
echo "  iface $VM1_MANAGEMENT_IF inet static"
echo "  address $VM1_MANAGEMENT_IP"
echo "  netmask $MANAGEMENT_NET_MASK"
#echo "runcmd:"
#echo " - sysctl net.ipv4.ip_forward=1"
#echo " - iptables -t nat -A POSTROUTING -o $VM1_EXTERNAL_IF -j MASQUERADE"




exec 1> config-drives/vm2-config/meta-data
echo "instance-id: 107fd8f9-26b7-4825-8f2d-797fc25f131f"
echo "hostname: vm2"
echo "local-hostname: vm2"
echo "public-keys:"
echo " - "$(cat $SSH_PUB_KEY)
echo "network-interfaces: |" 

echo "  auto $VM2_INTERNAL_IF"
echo "  iface $VM2_INTERNAL_IF inet static"
echo "  address $VM2_INTERNAL_IP"
echo "  netmask $INTERNAL_NET_MASK"
echo "  gateway $VM1_INTERNAL_IP"
echo "  dns-nameservers $VM_DNS"

echo "  auto $VM2_MANAGEMENT_IF"
echo "  iface $VM2_MANAGEMENT_IF inet static"
echo "  address $VM2_MANAGEMENT_IP"
echo "  netmask $MANAGEMENT_NET_MASK"

#echo "bootcmd:"
#echo " - ifconfig $VM1_EXTERNAL_IF up"


