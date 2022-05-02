#!/bin/bash

# Generamos
echo app > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
#echo $PASS >> /tmp/.auth


# Transifere el archivo
scp /tmp/.auth  jenkins@jenremote:/tmp/.auth
scp /var/jenkins_home/pipeline/pipeline/jenkins/deploy/publish jenkins@jenremote:/tmp/publish
ssh jenkins@jenremote "sh /tmp/publish"