#################################
##### IPFW.rules for a Jail #####
#################################

#################################
# Die Folgenden Variablen muessen angepasst werden

# Name der Jail
jail_name="beispieljail"

# IP-Adresse der Jail
jail_ip="123.123.123.123"

# Freigegebene ausgehende Ports (Leerzeichengetrennte Liste)
allowed_tcp_out=""
allowed_udp_out=""

# Freigegebene eingehende Ports (Leerzeichengetrennte Liste)
allowed_tcp_in=""
allowed_udp_in=""

# Wieviele Verbindungen (eingehend) darf ein Host zum Server Aufbauen 
parallel_allowed_hosts="5"

#################################
# Die Folgendfen Variablen nicht veraendern

# Komando fuer IPFW
cmd="/sbin/ipfw -q add"

# Interface
interface=$2


case $1 in

allowOut)
	echo "allowOut fuer $jail_name gestartet"
	# Hier stehend die Regeln welche es der Jail erlauben Kontakt nach
	# Aussen aufzubauen. Die Regeln für Serveranwedungen stehen unter
	# allowIn)
	# z.B. wenn die Jail per ssh nach aussen darf:
	# $cmd allow tcp from $jail_ip to any 22 out via $interface setup keep-state

	for port in $allowed_tcp_out ; do
		$cmd allow tcp from $jail_ip to any $port out via $interface
	done
	for port in $allowed_udp_out ; do
		$cmd allow udp from $jail_ip to any $port out via $interface
	done
	;;

denyOut)
	# Noch nicht umgesetzt
	;;

denyAll)
	# Noch nicht umgesetzt
	;;

allowIn)
	echo "allowIn fuer $jail_name gestartet"
	# hier stehen die Regeln für erlaubte Zugriffe von aussen auf die
	# Jail, Hier müssen alle Regeln zu installierten Serverdiesnten
	# auftauchen.
	# z.B. für ein sshd
	# $cmd allow tcp from any to $jail_ip 22 in via $interface setup limit src-addr 2 

	for port in $allowed_tcp_in ; do
		$cmd allow tcp from any to $jail_ip $port in via $interface setup limit src-addr $parallel_allowed_hosts
	done
	for port in $allowed_udp_in ; do
		$cmd allow udp from any to $jail_ip $port in via $interface limit src-addr $parallel_allowed_hosts
	done
	;;

denyIn)
	# Noch nicht umgesetzt
	;;
esac
