FROM ubuntu:vivid

RUN apt-get update && apt-get install -y --no-install-recommends \
  gcc \
  build-essential \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY DieWithError.c DieWithError.c
COPY HandleTCPClient.c HandleTCPClient.c

COPY server.c server.c
RUN gcc -o server server.c DieWithError.c HandleTCPClient.c

COPY client.c client.c
RUN gcc -o client client.c DieWithError.c

