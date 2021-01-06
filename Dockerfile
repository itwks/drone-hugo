# FROM alpine:3.11

# LABEL maintainer="Ariejan de Vroom <ariejan@devroom.io>"

# RUN apk add --no-cache \
#     ca-certificates \
#     mailcap \
#     git \
#     wget \
#     libc6-compat \
#     libstdc++

# ADD drone-hugo.sh /bin/
# RUN chmod +x /bin/drone-hugo.sh

# ENTRYPOINT /bin/drone-hugo.sh

ARG NODE_VERSION

FROM node:${NODE_VERSION}-buster-slim

SHELL ["/bin/bash", "-l", "-c"]

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev autoconf git \
    ca-certificates \
    wget && \
    rm -rf /var/lib/apt/lists/*

ADD drone-hugo.sh /bin/
RUN chmod +x /bin/drone-hugo.sh

ENTRYPOINT /bin/drone-hugo.sh