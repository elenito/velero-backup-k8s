#!/bin/bash

# Crea un bucket de S3
BUCKET_NAME=$1
REGION=${2:-us-east-1}

if [ -z "$BUCKET_NAME" ]; then
  echo "Uso: $0 <nombre-del-bucket> [region]"
  exit 1
fi

aws s3api create-bucket --bucket $BUCKET_NAME --region $REGION
