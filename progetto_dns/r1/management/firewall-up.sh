echo 1 > /proc/sys/net/ipv4/ip_forward

#iptables -P INPUT DROP
#iptables -P FORWARD DROP
#iptables -P INPUT -i lo -j ACCEPT
#iptables -A INPUT -p tcp --dport 80 -j ACCEPT

iptables -t nat -A PREROUTING -p tcp -d 195.11.14.1 --dport 80 -j DNAT --to-destination 195.11.14.5
iptables -t nat -A POSTROUTING -p tcp -s 195.11.14.5 --dport 80 -j SNAT --to-destination 195.11.14.1
