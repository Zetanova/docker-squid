#!/bin/bash

# re-create snakeoil self-signed certificate removed in the build process
if [ ! -f /etc/ssl/private/ssl-cert-snakeoil.key ]; then
    /usr/sbin/make-ssl-cert generate-default-snakeoil --force-overwrite > /dev/null 
2>&1
fi

#watch squid logs
tail -F /var/log/squid/access.log 2>/dev/null &
tail -F /var/log/squid/error.log 2>/dev/null &
tail -F /var/log/squid/store.log 2>/dev/null &
tail -F /var/log/squid/cache.log 2>/dev/null &
# create missing cache directories and exit
/usr/sbin/squid -Nz

/usr/sbin/squid "$@"

#wait for output
sleep 1