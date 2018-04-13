# docker-vscode

A docker container based on debian with git and vscode.

## How to use

Create your project Dockerfile from it, and add your dependencies, for example:

```
FROM danielflira/vscode:testing

RUN apt-get update && apt-get install -y \
    curl

RUN curl -sL https://get.docker.com | bash
```

## How to run

Just execute dev.sh with, so you can call code to change project

```
$ docker run --rm -i danielflira/vscode:testing | tee dev.sh
$ bash dev.sh danielflira/vscode:testin
```

## How vscode versions works

The versions follow debian versions. The versions stable, testing and unstable will be supported.

## How it works

The container runs with privileged, they have same current user credentials, share X11 session, share docker socket.
