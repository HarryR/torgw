#!/bin/sh
rm -rf services

for N in `seq 1 9`
do
	mkdir -p services/tor$N
	SVFILE=services/tor$N/run
	echo '#!/bin/sh' > $SVFILE
	echo mkdir -p /var/lib/tor/$N >> $SVFILE
	echo exec tor --SocksPort 905$N --PidFile /var/run/tor.$N.pid --CookieAuthentication 1 --Sandbox 1 --DataDirectory /var/lib/tor/$N >> $SVFILE
	chmod 755 $SVFILE
done

mkdir -p services/haproxy
SVFILE=services/haproxy/run
echo '#!/bin/sh' > $SVFILE
echo 'exec haproxy -f /etc/haproxy/haproxy.cfg' >> $SVFILE 
chmod 755 $SVFILE
