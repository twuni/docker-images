#!/usr/bin/env bash

apt-get update && apt-get install -y \
  ca-certificates \
  curl \
  git \
  gzip \
  python \
  ssh \
  tar \
  unzip \
&& rm -vfR /var/lib/apt/lists/*
