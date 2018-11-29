ORG ?= integreatly
PROJECT=tutorial-web-app-operator
SHELL= /bin/bash
TAG ?= 0.0.2
PKG = github.com/integr8ly/tutorial-web-app

.PHONY: yarn/build
yarn/build:
	yarn build

.PHONY: docker-build
docker-build: yarn/build
	docker build -t quay.io/${ORG}/${PROJECT}:${TAG} -f Dockerfile .

.phony: push
push:
	docker push quay.io/$(ORG)/$(PROJECT):$(TAG)

.PHONY: docker-build-and-push
docker-build-and-push: docker-build push
