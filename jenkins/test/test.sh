#!/bin/bash

echo "################"
echo "*** Testing  ***"
echo "################"

docker run --rm -v /root/.m2:/root/.m2 -v /var/jenkins_home/pipeline/pipeline/java-app:/app -w /app maven:3-alpine "$@"

