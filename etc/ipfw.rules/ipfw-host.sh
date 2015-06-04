###################################
##### IPFW.rules for the host #####
###################################

#################################
# Die Folgenden Variablen muessen angepasst werden

# IP-Adresse des Host
host_ip="192.168.2.100"

# Freigegebene ausgehende Ports (Leerzeichengetrennte Liste)
allowed_tcp_out="1980 22 80 993 143 25 443 465 20 21"
allowed_udp_out=""

# Freigegebene eingehende Ports (Leerzeichengetrennte Liste)
allowed_tcp_in="6600 22 1234"
allowed_udp_in=""

# Wieviele Verbindungen (eingehend) darf ein Host zum Server Aufbauen 
parallel_allowed_hosts="5"

#################################
# Die Folgenden Variablen nicht veraendern

# Komando fuer IPFW
cmd="/sbin/ipfw -q add"

# Interface
interface=$2


case $1 in

allowOut)
	echo "allowOut fuer den Host gestartet"
	# Hier stehend die Regeln welche es der Jail erlauben Kontakt nach
	# Aussen aufzubauen. Die Regeln für Serveranwedungen stehen unter
	# allowIn)
	# z.B. wenn die Jail per ssh nach aussen darf:
	# $cmd allow tcp from $host_ip to any 22 out via $interface setup keep-state

    for port in $allowed_tcp_out ; do
        $cmd allow tcp from $host_ip to any $port out via $interface setup keep-state
    done
    for port in $allowed_udp_out ; do
        $cmd allow udp from $host_ip to any $port out via $interface keep-state
    done
	;;

denyOut)
	echo "Dies ist rauszus verboten"
	;;

denyAll)
	echo "Das ist in beide Richtungen verboten"
	;;

allowIn)
	echo "allowIn fuer den Host gestartet"
	# hier stehen die Regeln für erlaubte Zugriffe von aussen auf die
	# Jail, Hier müssen alle Regeln zu installierten Serverdiesnten
	# auftauchen.
	# z.B. für ein sshd
	# $cmd allow tcp from any to $host_ip 22 in via $interface setup limit src-addr 2 

    for port in $allowed_tcp_in ; do
        $cmd allow tcp from any to $host_ip $port in via $interface setup limit src-addr $parallel_allowed_hosts
    done
    for port in $allowed_udp_in ; do
        $cmd allow udp from any to $host_ip $port in via $interface limit src-addr $parallel_allowed_hosts
    done
	;;

denyIn)
	echo "Das ist herrein verboten"
	;;
esac
