```
docker run --rm -ti --privileged \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v $PWD:/data
vscode:stable
```