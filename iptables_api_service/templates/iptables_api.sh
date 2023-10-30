#/usr/bin/bash

# get your own local ip  and put it in the next command
net_ip=`ip -o route get to 8.8.8.8 | sed -n 's/.*src \([0-9.]\+\).*/\1/p'`
./root/.services/iptables-api -https=false -ip=$net_ip -port=8443 -log=/var/log/iptables-api.access.log
