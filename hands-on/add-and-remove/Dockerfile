FROM ubuntu

RUN   apt-get update && \
      apt-get -y install --no-install-recommends \
      git \
      && rm -rf /var/lib/apt/lists/*


RUN   apt-get -y remove git && apt-get -y autoremove
