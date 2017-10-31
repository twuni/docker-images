#!/usr/bin/env bash

TEMP_DIR=/tmp
AWS_DIR=/usr/local/aws
BIN_DIR=/usr/local/bin

(
  cd "${TEMP_DIR}"
  curl -sSL 'https://s3.amazonaws.com/aws-cli/awscli-bundle.zip' -o awscli-bundle.zip || exit 1
  unzip awscli-bundle.zip || exit 1
  rm -vf awscli-bundle.zip || exit 1
) || exit 1


"${TEMP_DIR}/awscli-bundle/install" \
  -i "${AWS_DIR}" \
  -b "${BIN_DIR}/aws" \
  || exit 1

rm -vfR "${TEMP_DIR}/awscli-bundle"
