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

config:
	docker-compose -f services/mail/docker-compose.yml \
		-f shared/rabbitmq/docker-compose.yml \
		-f api-gateway/docker-compose.yml \
		config > docker-compose.yml

run-all:
	docker-compose up -d

start: config run-all

stop:
	docker-compose stop