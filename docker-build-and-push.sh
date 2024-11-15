#!/bin/bash

CONTAINER=$1
VERSION=$2

docker buildx build -t $CONTAINER:$VERSION -f $CONTAINER.dockerfile .
docker tag $CONTAINER:$VERSION 379683964026.dkr.ecr.us-east-1.amazonaws.com/$CONTAINER:$VERSION
docker push 379683964026.dkr.ecr.us-east-1.amazonaws.com/$CONTAINER:$VERSION
