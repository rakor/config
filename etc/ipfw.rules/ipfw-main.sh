#!/bin/sh

#	Dies ist die Steuerdatei der Firewall. Hier werden alle Systemweiten
#	Festlegungen getroffen. 
#	Firewallregeln die nur die Host-IP betreffen werden in der Datei
#	ipfw-host.sh definiert.
#	Firewallregeln für Jails werden je Jail in einer Datei namens
#	ipfw-jailname.sh definiert. Die Datei ipfw-beispieljail.sh dient als
#	Vorlage.	

#########################################
# Die folgenden Variablen bitte anpassen.

# Netzwerk-Interface ins Internet
interface="em0"

# Liste der DNS-Server zu welchen verbunden werden soll (Leerzeichengetrennte Liste)
dns_servers="192.168.2.1"

# Der zu verwendende DHCP-Server, wenn keiner benötigt wird die Variable leer lassen
dhcp_server="192.168.2.1"

# Hier eine Liste der Jailspezifischen ipfw-rules Dateien.
# Die ipfw-host.sh sollte immer enthalten sein und die ipfw-Regeln fuer
# den Host enthalten.
jail_rules="ipfw-host.sh"

# Pfad zu den $jail_rules. Immer mit abschliessendem / "
jail_rules_path="/etc/ipfw.rules/"

# Ende des Parametrierbereichs
#########################################
#########################################
# Die folgenden Variablen nicht ändern.

# Abkuerzung des Kommandos
cmd="/sbin/ipfw -q add"


#########################################
# Es geht los

# Regen in 10er Schritten hochzaehlen
/sbin/sysctl net.inet.ip.fw.autoinc_step=10

# Zunaechst altlasten leeren
/sbin/ipfw -q -f flush

# Loopback immer frei halten
$cmd allow all from any to any via lo0

# Dynamische Regeln anwenden
$cmd check-state


#########################################
# Alles was raus will erlauben

# DNS-Abfragen erlauben
for dns in $dns_servers ; do
    $cmd allow tcp from any to $dns 53 out via $interface setup keep-state
    $cmd allow udp from any to $dns 53 out via $interface keep-state
done

# DHCP Anfragen erlauben
if [ -n "$dhcp_server" ]; then
    $cmd allow udp from any to $dhcp_server 67 out via $interface keep-state
fi

# Root darf alles
$cmd allow tcp from me to any out via $interface setup keep-state uid root

# Ping erlauben
$cmd allow icmp from any to any out via $interface keep-state

# NTP erlauben
$cmd allow udp from any to any 123 out via $interface keep-state

# whois erlauben
$cmd allow tcp from any to any 43 out via $interface setup keep-state

# Nun kommen die allowOut-Regeln der Jails
for jail in $jail_rules ; do
	/bin/sh $jail_rules_path$jail allowOut $interface 
done

# der Rest wird notiert
$cmd deny log all from any to any out via $interface


#######################################
# Und nun alles was herrein will


#######################################
# Zuerst die ungewollten Anfragen abblocken

# Wir wollen keine ident-Anfragen
$cmd deny tcp from any to any 113 in via $interface

# Keine MS Netbios oder Host2 Anfragen
$cmd deny tcp from any to any 81 in via $interface
$cmd deny tcp from any to any 137 in via $interface
$cmd deny tcp from any to any 138 in via $interface
$cmd deny tcp from any to any 139 in via $interface

# Keine Fragmente
$cmd deny all from any to any frag in via $interface

# Nur per dynamischer Regel zulassen keine bereits aufgebauten Verbindungen
$cmd deny tcp from any to any established in via $interface


###################################
# Alle die wir herrein lassen wollen

# SSH Zugang muss erlaubt sein
#$cmd allow tcp from any to me 22 in via $interface setup limit src-addr 2

# Hier kommen die allowIn-Regeln der Jails
for jail in $jail_rules ; do
    /bin/sh $jail_rules_path$jail allowIn $interface 
done

# Alles andere was rein will wird geloggt und verworfen
$cmd deny log all from any to any in via $interface

# Alles andere wird protokolliert und weggeworfen
$cmd deny log all from any to any

