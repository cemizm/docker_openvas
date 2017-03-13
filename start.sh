#!/bin/bash

service redis-server start

echo "Starting OpenVAS Scanner..."
/sbin/start-stop-daemon --start --exec /usr/sbin/openvassd -- --listen=0.0.0.0 --port=9391 2>&1 >/dev/null
sleep 5

echo "Starting OpenVAS Manager..."
/sbin/start-stop-daemon --start --exec /usr/sbin/openvasmd -- --database=/var/lib/openvas/mgr/tasks.db --listen=0.0.0.0 --port=9390 2>&1 >/dev/null
sleep 5

echo "Starting Greenbone Security Assistant..."
/usr/sbin/gsad --foreground --listen=0.0.0.0 --port=9392 --mlisten=0.0.0.0 --mport=9390
