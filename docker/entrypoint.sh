#!/bin/sh

/usr/bin/backend prod &
BACKEND_PID=$!

nginx -g "daemon off;" &
NGINX_PID=$!

trap "echo 'Stopping...'; kill $BACKEND_PID $NGINX_PID" SIGINT SIGTERM
wait $BACKEND_PID $NGINX_PID