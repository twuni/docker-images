#!/usr/bin/env bash

NODE_VERSION=$1

TEMP_DIR=/tmp
NODE_DIR=/opt/node
BIN_DIR=/usr/local/bin

(
  cd "${TEMP_DIR}"
  curl -sSL "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.xz" | tar xvJf -
) || exit 1

rm -vfR "${NODE_DIR}" || exit 1

mv -v "${TEMP_DIR}/node-v${NODE_VERSION}-linux-x64" "${NODE_DIR}" || exit 1

ln -vs "${NODE_DIR}/bin/node" "${BIN_DIR}/node" || exit 1

ln -vs "${NODE_DIR}/bin/npm" "${BIN_DIR}/npm" || exit 1
