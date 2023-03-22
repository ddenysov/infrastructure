START := docker-compose \
	-f shared/rabbitmq/docker-compose.yml \
	-f services/mail/docker-compose.yml \
	-f services/user/docker-compose.yml \
	-f api-gateway/docker-compose.yml

build-base:
	docker build . --tag ghcr.io/ddenysov/base:latest

push-base:
	docker push ghcr.io/ddenysov/base:latest

build: build-base push-base

run:
	docker-compose run base bash

ssh:
	docker-compose exec base bash