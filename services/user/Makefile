include .env

build:
	docker build ../../images/base --build-arg CACHE_DROP=$$RANDOM --build-arg APP_PORT=9901 --build-arg APP_MODE=app --build-arg APP_REPO=https://github.com/ddenysov/user.git --tag ghcr.io/ddenysov/user:$$VERSION \
	&& docker build ../../images/base --build-arg CACHE_DROP=$$RANDOM --build-arg APP_MODE=supervisor --build-arg APP_REPO=https://github.com/ddenysov/user.git --tag ghcr.io/ddenysov/user-supervisor:$$VERSION \
	&& echo 'OK';

push:
	docker push ghcr.io/ddenysov/user:$$VERSION

publish: build push

version:
	echo $(TAG)

tag:
	export VERSION=$(TAG) && make build && make push

latest:
	export VERSION=latest && make build && make push