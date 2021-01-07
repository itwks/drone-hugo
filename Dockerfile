ARG NODE_VERSION

FROM node:${NODE_VERSION}-buster-slim

SHELL ["/bin/bash", "-l", "-c"]

ADD drone-hugo.sh /bin/

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev autoconf git \
    ca-certificates \
    wget && \
    rm -rf /var/lib/apt/lists/* &&\
    chmod +x /bin/drone-hugo.sh

ENTRYPOINT [ " /bin/drone-hugo.sh" ]