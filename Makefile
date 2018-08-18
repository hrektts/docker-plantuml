all: build

build:
	@docker build -t hrektts/plantuml:latest .

release: build
	@docker build -t hrektts/plantuml:$(shell cat Dockerfile | \
		grep "ARG PLANTUML_VERSION" | \
		sed -e 's/[^"]*"\([^"]*\)".*/\1/') .
