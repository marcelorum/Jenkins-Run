#!/bin/bash

# Copia el jar



echo "######################"
echo "*** Building image ***"
echo "######################"

docker-compose -f /var/jenkins_home/pipeline/pipeline/jenkins/build/docker-compose-build.yml build --no-cache

