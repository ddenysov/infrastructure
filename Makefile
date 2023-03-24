include ./services/user/Makefile

START := docker-compose \
	-f shared/rabbitmq/docker-compose.yml \
	-f services/mail/docker-compose.yml \
	-f services/user/docker-compose.yml \
	-f api-gateway/docker-compose.yml

build-base:
	docker build images/base --tag ghcr.io/ddenysov/base:latest

push-base:
	docker push ghcr.io/ddenysov/base:latest

test:
	echo "ok";

start:
	@$(START) up -d

stop:
	@$(START) down