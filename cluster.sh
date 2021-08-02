echo "ENTER NODE NUMBER: "
read node_number

echo "ENTER GATEWAY: "
read gateway_number


# INSTALL SSH
sudo apt update
sudo apt install openssh-server -y
sudo apt install openssh-client -y


#SET STATIC IP
sudo echo " auto lo \n
iface lo inet loopback \n

# Static IP address \n

auto eth0 \n

iface eth0 inet static \n

address 192.168.0.$node_number \n

netmask 255.255.255.0 \n

network $gateway_number \n

broadcast 192.168.0.255 \n

gateway $gateway_number \n" >> '/etc/network/interfaces'

sudo echo  "
domain localdomain

search localdomain

nameserver 192.168.1.1" > '/etc/resolv.conf'
