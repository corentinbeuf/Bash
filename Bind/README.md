# Bind
Your content here

## Présentation

## Installation et configuration
- Mettre à jour les sources.
```bash
sudo apt-get update
```
- Installer **Bind9**.
```bash
sudo apt-get bind9 -y
```
- Editer le fichier "**named.conf.options**".
```bash
sudo nano /etc/bind/named.conf.options
```
- Le fichier doit ressembler ) ceci :
```conf
options {
	directory "/var/cache/bind";
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
};
```
- Faire un "**Ctrl+S**" puis un "**Ctrl+X**" pour sauvegarder puis quitter le fichier.
- Editer le fichier "**named.conf.local**" pour spécifier l'emplacement des fichier de la zone de recherche directe et de la zone de recherche inversée.
```bash
sudo nano /etc/bind/named.conf.local
```
- Le fichier doit ressembler ) ceci :
```conf
//
// Do any local configuration here
//
// Consider adding the 1918 zones here, if they are not used in your
// organization
//include "/etc/bind/zones.rfc1918";
zone "example.com" {
        type master;
        file "/etc/bind/db.example.com";
        allow-query { any; };        
};
zone "10.168.192.in-addr.arpa" {
        type master;
        file "/etc/bind/db.192";
};
```
- Faire un "**Ctrl+S**" puis un "**Ctrl+X**" pour sauvegarder puis quitter le fichier.
- Editer le fichier "**db.example.com**" pour configurer la zone de rechercher directe.
```bash
sudo nano etc/bind/db.example.com
```
- Le fichier doit ressembler ) ceci :
```conf
;
; BIND data file for local loopback interface
;
$TTL	604800
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
monitoring		IN	A	192.168.10.1
```
- Faire un "**Ctrl+S**" puis un "**Ctrl+X**" pour sauvegarder puis quitter le fichier.
- Editer le fichier "**db.192**"pour configurer la zone de recherche inversée.
```bash
sudo nano etc/bind/db.192
```
- Le fichier doit ressembler ) ceci :
```conf
;
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
1.10.168.192.in-addr.arpa.	IN	PTR	monitoring.example.com.
```
- Faire un "**Ctrl+S**" puis un "**Ctrl+X**" pour sauvegarder puis quitter le fichier.
- Redémarrer le service "**bind9**".
```bash
sudo systemctl restart bind9
```

### Scripts
- [Bash](https://raw.githubusercontent.com/corentinbeuf/Bash/main/Bind/install_bind.sh)
{.links-list}

## Sauvegarde

## Restauration

## Mise à jour