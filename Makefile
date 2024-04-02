.PHONY : build

default: build

builder:
	docker buildx create \
      --name container \
      --driver=docker-container

build:
	docker buildx build --builder=container \
		--platform linux/amd64,linux/arm64 \
		-t docker.io/zalgonoise/graphviz:ubuntu \
		--push .