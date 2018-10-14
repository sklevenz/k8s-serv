FROM ubuntu:cosmic

ARG VERSION=dev

RUN apt-get update && apt-get install -y wget

RUN echo "--------------------- VERSION=$VERSION ---------------------" >> /tmp/docker.log
RUN wget https://github.com/sklevenz/k8s-serv/releases/download/v${VERSION}/k8s-serv_${VERSION}_Linux_i386.tar.gz