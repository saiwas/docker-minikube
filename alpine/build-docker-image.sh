#!/bin/bash

# build up the base image
docker build -f ./Dockerfile.alpine -t min-k8s-alpine:base .

# Run up the base container
docker run -it -v "/var/run/docker.sock:/var/run/docker.sock:rw" min-k8s-alpine:base bash
