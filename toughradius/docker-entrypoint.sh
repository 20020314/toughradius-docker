#!/bin/sh
set -e

# this if will check if the first argument is a flag
# but only works if all arguments require a hyphenated flag
# -v; -SL; -f arg; etc will work, but not arg1 arg2
if [ "$#" -eq 0 ] || [ "${1#-}" != "$1" ]; then
    set -- freeradius "$@"
fi

# check for the expected command
if [ "$1" = 'freeradius' ]; then
    shift
    exec freeradius -f "$@"
fi

# many people are likely to call "radiusd" as well, so allow that
if [ "$1" = 'radiusd' ]; then
    shift
    exec freeradius -f "$@"
fi

if [ -d /var/log/freeradius ]; then
  chown freerad:freerad -R /var/log/freeradius
else
    echo "/var/log/freeradius not exists"
fi

test -d /var/toughradius || mkdir -p /var/toughradius

# else default to run whatever the user wanted like "bash" or "sh"
exec "$@"