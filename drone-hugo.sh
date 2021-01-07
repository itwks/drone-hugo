#!/bin/bash

HUGO_VERSION=${PLUGIN_HUGO_VERSION:-"0.80.0"}
HUGO_ARCH="64bit"

HUGO_URL="https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-${HUGO_ARCH}.tar.gz"

echo "Fetching Hugo ${HUGO_VERSION} from ${HUGO_URL}"
wget -q -O- ${HUGO_URL} | tar xz -C /usr/local/bin

RUN=${PLUGIN_RUN:-"hugo"}

echo "Running ${RUN}"

${RUN}

# oldIFS=$IFS
# IFS="
# "
# for item in ${RUN}
# do
#     echo "Running $item"
#     $($item)
# done
# IFS=$oldIFS