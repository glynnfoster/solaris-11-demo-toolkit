#!/usr/bin/bash
# This is to wait until a zone gets its IP address. 
# Usage: wait4ip <zonename> <interface name>
# Example: wait4ip zone1 vnic1
if [ $# -lt 2 ] ; then
	echo "Usage: $0 <zonename> <interface name>\n"
	exit 1
fi

while true; do
	zlogin $1 ipadm show-addr | egrep $2.*ok
	if [ $? -eq 0 ] ; then
		echo "Zone $1 is ready!\n"
		exit
	fi
	echo "Waiting for the $1's interface $2 to get ready..."
	sleep 5
done 
