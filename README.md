# docker-plantuml

Dockerfile to build a container image enclosing [PlantUML](http://plantuml.com/) diagram generator.

[![Travis Build Status](https://travis-ci.org/hrektts/docker-plantuml.svg?branch=master)](https://travis-ci.org/hrektts/docker-plantuml)

## Usage

``` shell
cd /path/to/diagram
docker run -u $(id -u):$(id -g) --rm -v $(pwd):/data -it hrektts/plantuml plantuml ${diagram}
```
