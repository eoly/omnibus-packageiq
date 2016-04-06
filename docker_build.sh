#!/bin/bash

docker build --rm -t omnibus-centos6-packageiq -f dockerfiles/omnibus-centos6-packageiq .
docker run --rm -e "PACKAGEIQ_VERSION=${PACKAGEIQ_VERSION}" -e "BUILD_NUMBER=${BUILD_NUMBER}" -v `pwd`/pkg:/pkg -i -t omnibus-centos6-packageiq