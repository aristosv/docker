FROM debian:buster
MAINTAINER namehere <email@here.net>

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y wget openjdk-11-jdk uuid-runtime openssh-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    wget https://dl.bintray.com/rundeck/rundeck-deb/rundeck_3.2.5.20200403-1_all.deb && \
    dpkg -i rundeck_3.2.5.20200403-1_all.deb && \
    rm -f rundeck_3.2.5.20200403-1_all.deb

EXPOSE 4440

ADD https://raw.githubusercontent.com/aristosv/docker/master/run /opt

RUN chmod +x /opt/run

ENTRYPOINT ["/opt/run"]
