#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=diogosilverio/udacity-devops-ml:v2-logs

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
# Already logged via Docker Desktop
docker tag diogosilverio/udacity-devops-ml diogosilverio/udacity-devops-ml:v2-logs

# Step 3:
# Push image to a docker repository
docker push $dockerpath
