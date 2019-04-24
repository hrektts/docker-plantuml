#!/bin/bash

set -e

java -Djava.awt.headless=true -jar /usr/share/java/plantuml.jar $@
