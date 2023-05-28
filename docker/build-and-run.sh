#!/bin/bash

PROJECT_NAME="angular-golang"

docker rm -f "$PROJECT_NAME"
docker image rm -f "$PROJECT_NAME"
mkdir -p build-context

cd ..
root_dir="$(pwd)"

cd "$root_dir/src/backend" || exit 1
export CGO_ENABLED=0
export GOOS=linux
go build -ldflags="-s -w" -o "$root_dir/docker/build-context/backend"

cd "$root_dir/src/frontend" || exit 1
ng build --configuration=production
cp -r dist/frontend "$root_dir/docker/build-context/"

cd "$root_dir/docker" || exit 1
docker build -t "$PROJECT_NAME" .
docker run --rm --name "$PROJECT_NAME" -p 80:80 "$PROJECT_NAME"