build-app:
	docker build . --tag ghcr.io/ddenysov/app:latest

push-app:
	docker push ghcr.io/ddenysov/app:latest

build: build-app push-app

run:
	docker-compose run app bash

start:
	@docker-compose up -d

stop:
	@docker-compose down

restart: stop start

ssh:
	@docker-compose exec app bash