service network-manager stop
ifconfig eth0 192.168.1.63
route add default gw 192.168.1.40 eth0
echo "nameserver 194.179.1.100" > /etc/resolv.conf
echo "nameserver 194.179.1.101" >> /etc/resolv.conf
