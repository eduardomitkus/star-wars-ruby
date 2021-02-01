#!/bin/bash
# entrypoint.sh

#Script que evita que o server reinicie quando um determinado arquivo server.pid já existe. Será executado quando o container for iniciado.
set -e

rm -f /myapp/tmp/pids/server.pid

exec "$@"