#!/bin/bash
cd /opt/deluge/deluge-1.3.14
source env/bin/activate
deluge-web -c /var/lib/deluge/.config/deluge &
echo $! > /var/run/deluge-web-eye.pid
