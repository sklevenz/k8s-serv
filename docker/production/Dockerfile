FROM ubuntu:cosmic

RUN apt-get update && apt-get install -y wget

RUN mkdir /var/k8s-serv && cd /var/k8s-serv
RUN echo "$VERSION" >> VERSION
ADD https://github.com/sklevenz/k8s-serv/releases/download/${VERSION}/k8s-serv_${VERSION}_Linux_i386.tar.gz /var/k8s-serv
RUN tar -zxvf /var/k8s-serv/k8s-serv_${VERSION}_Linux_i386.tar.gz -C /var/k8s-serv
RUN rm  /var/k8s-serv/k8s-serv_${VERSION}_Linux_i386.tar.gz

CMD /var/k8s-serv/k8s-serv
EXPOSE 8080
