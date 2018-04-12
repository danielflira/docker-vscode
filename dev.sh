#!/bin/bash

SOCKET=`echo $DISPLAY | sed -e 's/.*://' -e 's/\..*$//'`

IMAGE=${1:-danielflira/vscode:stable}
mkdir -p .home

docker run --rm -ti --privileged \
-v /etc/passwd:/etc/passwd \
-v /etc/shadow:/etc/shadow \
-v /tmp/.X11-unix/X${SOCKET}:/tmp/.X11-unix/X${SOCKET} \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $PWD/.home:$HOME \
-v $PWD:/data \
-e DISPLAY=$DISPLAY \
-u `id -u`:`id -g` \
--workdir /data \
"${IMAGE}"
