#!/bin/bash

service redis-server start
service openvas-scanner start
service openvas-manager start

echo "Running Greenbone Security Assistant."
/usr/sbin/gsad --foreground --listen=0.0.0.0 --port=9392 --mlisten=0.0.0.0 --mport=9390
