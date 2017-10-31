FROM debian:stretch

COPY install-system-packages.sh /tmp/install-system-packages.sh
RUN /tmp/install-system-packages.sh && rm -f /tmp/install-system-packages.sh

COPY install-awscli.sh /tmp/install-awscli.sh
RUN /tmp/install-awscli.sh && rm -f /tmp/install-awscli.sh

COPY install-node.sh /tmp/install-node.sh
RUN /tmp/install-node.sh 8.8.1 && rm -f /tmp/install-node.sh

COPY install-yarn.sh /tmp/install-yarn.sh
RUN /tmp/install-yarn.sh 1.2.1 && rm -f /tmp/install-yarn.sh

COPY add-user.sh /tmp/add-user.sh
RUN /tmp/add-user.sh project && rm -f /tmp/add-user.sh

USER project
