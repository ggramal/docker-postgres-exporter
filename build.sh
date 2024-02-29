#!/bin/bash
TAG="v0.15.0-$(git rev-parse --short HEAD)"
IMAGE="gramal/postgres-exporter"
docker build -t ${IMAGE}:${TAG} . && docker push ${IMAGE}:${TAG}
docker build -t ${IMAGE}:latest . && docker push ${IMAGE}:latest
