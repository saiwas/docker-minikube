#!/bin/bash

docker run \
  -p 8443:8443 \
  -p 6443:6443 \
  -p 30000:30000 \
  -p 8080:8080 \
  --name min-k8s-latest \
  -d --privileged k8s-ubuntu:latest /sbin/init

docker exec -it $(docker ps --filter "name=min-k8s-latest" -q) sudo mv /var/lib/docker/runtimes /var/lib/docker/runtimes-old
docker exec -it $(docker ps --filter "name=min-k8s-latest" -q) sudo systemctl restart docker.service
docker exec -it $(docker ps --filter "name=min-k8s-latest" -q) minikube start --vm-driver=none --extra-config kubeadm.ignore-preflight-errors=SystemVerification

docker exec -it $(docker ps --filter "name=min-k8s-latest" -q) bash
