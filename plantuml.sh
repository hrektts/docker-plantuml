#!/bin/bash

set -e

java -Djava.awt.headless=true -jar /usr/local/share/java/plantuml.jar $@
