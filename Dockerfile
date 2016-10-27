FROM hrektts/ubuntu:16.04.20161010
MAINTAINER mps299792458@gmail.com

WORKDIR /usr/share/java

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 \
 && echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" \
    > /etc/apt/sources.list.d/webupd8team-java.list \
 && apt-get update \
 && echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" \
    | debconf-set-selections \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    curl oracle-java8-installer maven graphviz fonts-takao-pgothic \
 && curl -JLOsS http://sourceforge.net/projects/plantuml/files/plantuml.jar/download \
 && rm -rf /var/lib/apt/lists/*

COPY plantuml.sh /usr/local/bin/plantuml
RUN chmod 755 /usr/local/bin/plantuml

ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle

WORKDIR /data
VOLUME ["/data"]
