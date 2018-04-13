FROM debian:testing

RUN apt-get update && apt-get install -y \
    curl \
    libnotify4 \
    libnss3 \
    gnupg \
    libxkbfile1 \
    libgconf-2-4 \
    libsecret-1-0 \
    libgtk2.0-0 \
    libxss1 \
    libasound2 \
    git

RUN curl -qL https://go.microsoft.com/fwlink/?LinkID=760868 > vscode.deb \
    && dpkg -i vscode.deb \
    && rm -rf vscode.deb

ADD *.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/*.sh

CMD install.sh
