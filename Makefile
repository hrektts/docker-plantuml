all: build

build:
	@docker build -t hrektts/plantuml:latest .

release: build
	@docker build -t hrektts/plantuml:$(shell cat VERSION) .
