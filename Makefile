build-app:
	docker build app --tag ghcr.io/ddenysov/app:latest

build-supervisor:
	docker build supervisor --tag ghcr.io/ddenysov/supervisor:latest

push-app:
	docker push ghcr.io/ddenysov/app:latest

push-supervisor:
	docker push ghcr.io/ddenysov/supervisor:latest

all: build-app build-supervisor push-app push-supervisor