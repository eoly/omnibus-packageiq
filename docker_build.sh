#!/bin/bash

echo 'Building Centos 6 Omnibus Package'
docker build --rm -t omnibus-centos6-packageiq -f dockerfiles/omnibus-centos6-packageiq .
docker run --rm -e "PACKAGEIQ_VERSION=${PACKAGEIQ_VERSION}" -e "BUILD_ITERATION=${BUILD_ITERATION}" -v `pwd`/pkg:/pkg -i -t omnibus-centos6-packageiq
docker rmi omnibus-centos6-packageiq

echo 'Building Centos 7 Omnibus Package'
docker build --rm -t omnibus-centos7-packageiq -f dockerfiles/omnibus-centos7-packageiq .
docker run --rm -e "PACKAGEIQ_VERSION=${PACKAGEIQ_VERSION}" -e "BUILD_ITERATION=${BUILD_ITERATION}" -v `pwd`/pkg:/pkg -i -t omnibus-centos7-packageiq
docker rmi omnibus-centos7-packageiq