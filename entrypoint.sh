#!/bin/bash
set -e
rm -f /login/tmp/pids/server.pid
exec "$@"
