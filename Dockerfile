ARG PLANTUML_VERSION="1.2018.9"
FROM openjdk:11-slim
LABEL maintainer="mps299792458@gmail.com" \
      version=$PLANTUML_VERSION

WORKDIR /usr/local/share/java

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
    graphviz \
    curl \
 && curl -o plantuml.jar -JLsS \
    http://sourceforge.net/projects/plantuml/files/plantuml.${PLANTUML_VERSION}.jar/download \
 && rm -rf /var/lib/apt/lists/*

COPY plantuml.sh /usr/local/bin/plantuml
RUN chmod 755 /usr/local/bin/plantuml

WORKDIR /data
VOLUME ["/data"]
