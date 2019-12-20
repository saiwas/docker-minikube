#!/bin/bash

# build up the base image
docker build -f ./Dockerfile.ubuntu -t min-k8s:base .

# Run up the base container
docker run \
		-p 8443:8443 \
		-p 6443:6443 \
		-p 30000:30000 \
		-p 8080:8080 \
    -p 53:53 \
    -v $(pwd)/bin:/tmp/bin \
		--name min-k8s-base \
		-d --privileged=true min-k8s:base /sbin/init

# Install minikube
docker exec -it $(docker ps --filter "name=min-k8s-base" -q) bash /tmp/bin/install-virtualbox.sh
docker exec -it $(docker ps --filter "name=min-k8s-base" -q) bash /tmp/bin/install-minkube.sh
docker exec -it $(docker ps --filter "name=min-k8s-base" -q) bash /tmp/bin/install-kubeclt.sh

# Commit the changes to a new image
docker commit --message "Install Minikube" $(docker ps --filter "name=min-k8s-base" -q) k8s-ubuntu:latest
docker stop min-k8s-base && docker rm min-k8s-base

# modprobe br_netfilter
# sysctl net.bridge.bridge-nf-call-iptables