FROM ubuntu
MAINTAINER Caderrik <caderrik@gmail.com>

ENV INSTALL_DIR=/server SERVER=csgoserver UPDATE_ON_START=1

RUN set -x && \
    dpkg --add-architecture i386 && \
    apt-get update -qq && \
    apt-get install -qq binutils mailutils postfix curl wget file gzip bzip2 bsdmainutils python util-linux tmux lib32gcc1 libstdc++6 libstdc++6:i386

RUN useradd -m -d "${INSTALL_DIR}" -u 1000 lgsm

COPY run-server.sh /usr/local/bin/run-server
RUN chmod +x /usr/local/bin/run-server

USER lgsm
WORKDIR "${INSTALL_DIR}"
VOLUME ["${INSTALL_DIR}"]
CMD ["/usr/local/bin/run-server"]
