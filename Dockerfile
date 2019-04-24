FROM ubuntu:bionic
ARG PLANTUML_VERSION="1.2018.9"
LABEL maintainer="mps299792458@gmail.com" \
      version=$PLANTUML_VERSION

WORKDIR /usr/local/share/java

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    software-properties-common \
 && add-apt-repository ppa:linuxuprising/java \
 && apt-get update \
 && echo "oracle-java10-installer shared/accepted-oracle-license-v1-1 select true" \
    | debconf-set-selections \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    oracle-java10-installer \
    curl \
    oracle-java10-set-default \
    graphviz \
    fonts-takao-pgothic \
 && curl -o plantuml.jar -JLsS \
    http://sourceforge.net/projects/plantuml/files/plantuml.${PLANTUML_VERSION}.jar/download \
 && DEBIAN_FRONTEND=noninteractive apt-get --purge remove -y \
    software-properties-common \
 && DEBIAN_FRONTEND=noninteractive apt-get --purge autoremove -y \
 && rm -rf /var/lib/apt/lists/*

COPY plantuml.sh /usr/local/bin/plantuml
RUN chmod 755 /usr/local/bin/plantuml

WORKDIR /data
VOLUME ["/data"]
