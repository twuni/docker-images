#!/usr/bin/env bash

PROJECT_USER=$1

adduser \
  --home "/home/${PROJECT_USER}" \
  --shell /bin/bash \
  --gecos '' \
  --disabled-password \
  --disabled-login \
  "${PROJECT_USER}"
