# docker-plantuml

[![Travis Build Status](https://travis-ci.org/hrektts/docker-plantuml.svg?branch=master)](https://travis-ci.org/hrektts/docker-plantuml)
[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](./LICENSE)

Dockerfile to build a container image enclosing [PlantUML](http://plantuml.com/) diagram generator.

## Usage

``` shell
cd /path/to/diagram
docker run --rm -v $(pwd):/data -it hrektts/plantuml plantuml ${diagram}
```
