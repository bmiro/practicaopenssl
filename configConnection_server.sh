# Cedeix internet agafar per la interficie wifi (eth1) cap a la cablejada eth0, l'altre ha de
# agafar ip del rang 192.168.1.x, posar com a gateway 192.168.1.40 i un DNS
ifconfig eth0 192.168.1.40
iptables -A FORWARD -o eth1 -i eth0 -s 192.168.1.0/24 -m conntrack --ctstate NEW -j ACCEPT
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A POSTROUTING -t nat -j MASQUERADE
sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"
