#!/usr/bin/env bash

YARN_VERSION=$1

YARN_DIR=/opt/yarn
TEMP_DIR=/tmp
BIN_DIR=/usr/local/bin

(
  cd "${TEMP_DIR}"
  curl -sSL "https://github.com/yarnpkg/yarn/releases/download/v${YARN_VERSION}/yarn-v${YARN_VERSION}.tar.gz" | tar xvzf -
) || exit 1

rm -vfR "${YARN_DIR}" || exit 1

mv -v "${TEMP_DIR}/yarn-v${YARN_VERSION}" "${YARN_DIR}" || exit 1

ln -vs "${YARN_DIR}/bin/yarn" "${BIN_DIR}/yarn" || exit 1
