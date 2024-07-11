#!/bin/bash

REPOSITORY_NAME="drone-repo"

echo "Enable Artifact Registry API:"
gcloud services enable artifactregistry.googleapis.com


echo "Create Artifact Registry repository:"
gcloud artifacts repositories create "$REPOSITORY_NAME" \
    --repository-format=docker \
    --location=europe-central2 \
    --description="Repository for storing Docker images related to the drone navigation app."
