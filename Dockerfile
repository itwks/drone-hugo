ARG NODE_VERSION

FROM node:${NODE_VERSION}-buster-slim

ARG HUGO_VERSION=${HUGO_VERSION:-"0.80.0"}
ARG HUGO_ARCH="64bit"
ARG HUGO_URL="https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-${HUGO_ARCH}.tar.gz"

COPY drone-hugo.sh /bin/

RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential libcurl4-gnutls-dev \
        libexpat1-dev gettext libz-dev libssl-dev autoconf git ca-certificates wget \
        && rm -rf /var/lib/apt/lists/* \
    && echo "Fetching Hugo ${HUGO_VERSION} from ${HUGO_URL}" \
        && wget wget -q -O- ${HUGO_URL} | tar xz -C /usr/local/bin \
        && chmod +x /bin/drone-hugo.sh

ENTRYPOINT /bin/drone-hugo.sh