DOCKER_ANSIBLE_VERSION = '1.0.4'
build_A:
	docker build -t gcloud:A --build-arg entrypoint=entrypoint_A .

build_B:
	docker build -t gcloud:B --build-arg entrypoint=entrypoint_B .
	
build_all: build_A build_B
	docker build -t gcloud:release --build-arg entrypoint=entrypoint_release .

start:
	docker-compose up -d

stop:
	docker-compose down

exec_A:
	docker-compose exec -it gcloud_A bash

exec_B:
	docker-compose exec -it gcloud_B bash

