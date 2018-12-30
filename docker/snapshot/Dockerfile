FROM ubuntu:cosmic

ARG VERSION=dev

RUN apt-get update && apt-get install -y wget

RUN mkdir /var/k8s-serv && cd /var/k8s-serv
RUN echo "$VERSION" >> VERSION
ADD k8s-serv /var/k8s-serv
RUN chmod +x /var/k8s-serv/k8s-serv
CMD /var/k8s-serv/k8s-serv
EXPOSE 8080
