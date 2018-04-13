#!/bin/bash

if [[ -z "${1}" ]]; then
    echo "you must inform image name"
    exit 1
fi

IMAGE_NAME="${1}"
X11_SOCKET=`echo $DISPLAY | sed -e 's/.*://' -e 's/\..*$//'`
mkdir -p .home

docker run --rm -ti --privileged \
-v /etc/passwd:/etc/passwd \
-v /etc/shadow:/etc/shadow \
-v /tmp/.X11-unix/X${X11_SOCKET}:/tmp/.X11-unix/X${X11_SOCKET} \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $PWD/.home:$HOME \
-v $PWD:/data \
-e DISPLAY=$DISPLAY \
-u `id -u`:`id -g` \
--workdir /data \
"${IMAGE_NAME}" bash
