#!/bin/bash
#nginx -g 'daemon off;'
nginx
exec "$@"