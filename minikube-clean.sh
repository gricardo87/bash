#!/bin/bash
# Stop and delete the Minikube cluster
minikube stop
minikube delete

# Remove the Minikube configuration files
rm -rf ~/.kube
rm -rf ~/.minikube

# Optionally, remove the Docker images used by Minikube
docker stop $(docker ps -a -q) 2>&-
docker rm $(docker ps -a -q) -f 2>&-
docker rmi $(docker images -a -q) -f 2>&-
docker volume rm $(docker volume ls -q) -f 2>&-
docker network rm $(docker network ls -q) -f 2>&-
docker system prune -f 2>&-
docker volume prune -f 2>&-
