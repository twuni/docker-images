FROM debian:stretch

RUN set -e;\
  apt-get update;\
  apt-get install \
    ca-certificates \
    curl \
    git \
    gzip \
    python \
    ssh \
    tar \
    unzip \
  -y;

RUN set -e;\
  AWS_ARCHIVE_FILE="$(mktemp aws-XXXXX.zip)";\
  curl -sSL \
    -o "${AWS_ARCHIVE_FILE}" \
    'https://s3.amazonaws.com/aws-cli/awscli-bundle.zip' \
  ;\
  mkdir -p /opt/aws-cli;\
  unzip -d /opt/aws-cli "${AWS_ARCHIVE_FILE}";\
  rm -vf "${AWS_ARCHIVE_FILE}";\
  /opt/aws-cli/awscli-bundle/install -i /opt/aws -b /bin/aws;\
  rm -vfR "/opt/aws-cli/awscli-bundle";


ENV NODEJS_VERSION=11.9.0

RUN set -e;\
  NODEJS_ARCHIVE_FILE="$(mktemp nodejs-XXXXX.tar.xz)";\
  curl -sSL \
    -o "${NODEJS_ARCHIVE_FILE}" \
    "https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}-linux-x64.tar.xz" \
  ;\
  mkdir -p /opt/nodejs;\
  tar \
      --directory=/opt/nodejs \
      --extract \
      --mode=a-w \
      --verbose \
      --xz \
      --file="${NODEJS_ARCHIVE_FILE}" \
  ;\
  rm -vf "${NODEJS_ARCHIVE_FILE}";\
  ln -s "/opt/nodejs/node-v${NODEJS_VERSION}-linux-x64/bin/node" /bin/node;\
  ln -s "/opt/nodejs/node-v${NODEJS_VERSION}-linux-x64/bin/npm" /bin/npm;

ENV YARN_VERSION=1.14.0

RUN set -e;\
  YARN_ARCHIVE_FILE="$(mktemp yarn-XXXXX.tar.gz)";\
  curl -sSL \
    -o "${YARN_ARCHIVE_FILE}" \
    "https://github.com/yarnpkg/yarn/releases/download/v${YARN_VERSION}/yarn-v${YARN_VERSION}.tar.gz" \
  ;\
  mkdir -p /opt/yarn;\
  tar \
      --directory=/opt/yarn \
      --extract \
      --mode=a-w \
      --verbose \
      --gzip \
      --file="${YARN_ARCHIVE_FILE}" \
  ;\
  rm -vf "${YARN_ARCHIVE_FILE}";\
  ln -s "/opt/yarn/yarn-v${YARN_VERSION}/bin/yarn" /bin/yarn;

RUN set -e;\
  adduser \
    --home /docker \
    --shell /bin/bash \
    --gecos '' \
    --disabled-password \
    --disabled-login \
    docker \
  ;

USER docker

WORKDIR /docker
