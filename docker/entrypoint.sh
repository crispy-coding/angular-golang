#!/bin/sh

/usr/bin/backend prodMode &
BACKEND_PID=$!

nginx -g "daemon off;" &
NGINX_PID=$!

# Makes
trap "echo 'Stopping...'; kill $BACKEND_PID $NGINX_PID" SIGINT SIGTERM
wait $BACKEND_PID $NGINX_PID