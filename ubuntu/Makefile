build:
	bash ./build-docker-image.sh

start-service:
	bash ./start-service.sh

stop:
	docker stop min-k8s-latest

clean-images: stop
	docker rmi min-k8s:base min-k8s:latest
