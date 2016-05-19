#!/bin/sh

#
# Configure varnishd
#

# This script will be placed in /config/init/ and run when container starts.

set -e

echo "[program:varnishd]" > /etc/supervisor.d/varnishd.conf
echo "command = /usr/sbin/varnishd -F -u varnish -f $$VCL_CONFIG -s malloc,$CACHE_SIZE $VARNISHD_PARAMS" >> /etc/supervisor.d/varnishd.conf
echo "autorestart = true" >> /etc/supervisor.d/varnishd.conf
