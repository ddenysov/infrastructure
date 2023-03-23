START := docker-compose \
	-f shared/rabbitmq/docker-compose.yml \
	-f services/mail/docker-compose.yml \
	-f services/user/docker-compose.yml \
	-f api-gateway/docker-compose.yml

build-base:
	docker build . --build-arg CACHE_DROP=$$RANDOM --build-arg APP_PORT=9901 --build-arg APP_MODE=app --build-arg APP_REPO=https://github.com/ddenysov/mail.git --tag ghcr.io/ddenysov/base:latest

push-base:
	docker push ghcr.io/ddenysov/base:latest

build: build-base push-base

run:
	docker-compose run base bash

ssh:
	docker-compose exec base bash

rnd:
	echo $$RANDOM