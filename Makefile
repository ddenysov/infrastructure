START := docker-compose \
	-f shared/rabbitmq/docker-compose.yml \
	-f services/mail/docker-compose.yml \
	-f services/user/docker-compose.yml \
	-f api-gateway/docker-compose.yml

build-base:
	docker build images/base --tag ghcr.io/ddenysov/base:latest

push-base:
	docker push ghcr.io/ddenysov/base:latest

build-app:
	docker build images/app --tag ghcr.io/ddenysov/app:latest

build-supervisor:
	docker build images/supervisor --tag ghcr.io/ddenysov/supervisor:latest

push-app:
	docker push ghcr.io/ddenysov/app:latest

push-supervisor:
	docker push ghcr.io/ddenysov/supervisor:latest

build-all: build-app build-supervisor push-app push-supervisor

run-gateway:
	docker-compose  -f api-gateway/docker-compose.yml up -d

run-all:
	docker-compose -f services/mail/docker-compose.yml up -d

test:
	echo @$(START)

stop-all:
	docker-compose -f services/mail/docker-compose.yml down

config:
	@$(START) config

start:
	@$(START) up -d

stop:
	@$(START) down