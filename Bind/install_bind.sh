#!/bin/bash
echo "-------------------------"
echo " Update packages/sources "
echo "-------------------------"
sudo apt-get update -y > /dev/null
echo "-------------------------"
echo " Install 'bind9' package "
echo "-------------------------"
sudo apt-get install bind9 -y > /dev/null
echo "--------------------------------"
echo " Modify named.conf.options file "
echo "--------------------------------"
sudo echo "options {
	directory \"/var/cache/bind\";
	forwarders { 8.8.8.8; 8.8.4.4; };
	allow-query { any; };
	recursion yes;
	//========================================================================
	// If BIND logs error messages about the root key being expired,
	// you will need to update your keys.  See https://www.isc.org/bind-keys
	//========================================================================
	dnssec-validation auto;
	auth-nxdomain no;    # conform to RFC1035
	version none;
    forward only;
	//listen-on-v6 { any; };
};" > /etc/bind/named.conf.options
echo "------------------------------"
echo " Modify named.conf.local file "
echo "------------------------------"
sudo echo "//
// Do any local configuration here
//
// Consider adding the 1918 zones here, if they are not used in your
// organization
//include "/etc/bind/zones.rfc1918";
zone \"example.com\" {
        type master;
        file \"/etc/bind/db.example.com\";
        allow-query { any; };        
};
zone \"10.168.192.in-addr.arpa\" {
        type master;
        file \"/etc/bind/db.192\";
};" > /etc/bind/named.conf.local
echo "-------------------------"
echo " Create direct area file "
echo "-------------------------"
sudo touch /etc/bind/db.example.com
sudo echo ";
; BIND data file for local loopback interface
;
\$TTL	604800
@	IN	SOA	ns1.example.com. root.example.com. (
			2017071011
			604800
			86400
			2419200
			604800 )
;
; name servers - NS records
@			IN	NS	ns1.example.com.
; name servers - A records
ns1			IN	A	192.168.10.253
; 192.168.10.0/24 - A records
jenkins		    IN	A	192.168.10.1
bitwarden		IN	A	192.168.10.1
registry	    IN	A	192.168.10.1
monitoring		IN	A	192.168.10.1" > /etc/bind/db.example.com
echo "-------------------------"
echo " Restart 'bind' service "
echo "-------------------------"
sudo systemctl restart bind9
echo "---------------------------"
echo " Create inverted area file "
echo "---------------------------"
sudo touch /etc/bind/db.192
sudo echo ";
; BIND reverse data file for local loopback interface
;
\$TTL	604800
@	IN	SOA	ns1.example.com. root.ns1.example.com. (
			8
			604800
			86400
			2419200
			604800 )
;
@	IN	NS	ns1.
253	IN	PTR	ns1.example.com.
1.10.168.192.in-addr.arpa.	IN	PTR	jenkins.example.com.
1.10.168.192.in-addr.arpa.	IN	PTR	bitwarden.example.com.
1.10.168.192.in-addr.arpa.	IN	PTR	registry.example.com.
1.10.168.192.in-addr.arpa.	IN	PTR	monitoring.example.com." > /etc/bind/db.192
echo "-------------------------"
echo " Restart 'bind' service "
echo "-------------------------"
sudo systemctl restart bind9