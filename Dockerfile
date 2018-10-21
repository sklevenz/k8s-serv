FROM ubuntu:cosmic

ARG VERSION=dev

RUN apt-get update && apt-get install -y wget

RUN mkdir /var/k8s-srv && cd /var/k8s-srv
RUN echo "$VERSION" >> VERSION
ADD https://github.com/sklevenz/k8s-serv/releases/download/${VERSION}/k8s-serv_${VERSION}_Linux_i386.tar.gz /var/k8s-srv
RUN tar -zxvf /var/k8s-srv/k8s-serv_${VERSION}_Linux_i386.tar.gz -C /var/k8s-srv
RUN rm  /var/k8s-srv/k8s-serv_${VERSION}_Linux_i386.tar.gz
CMD /var/k8s-srv/k8s-serv
EXPOSE 8080
