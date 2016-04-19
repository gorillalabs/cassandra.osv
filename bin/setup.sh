#!/bin/sh

## pull this into whatever. vars.sh? because otherwise it's duplicated.
VERSION="3.4"
current_dir=${PWD}
upstream_dir=${current_dir}/upstream

cassandra_name=apache-cassandra-$VERSION
tarball_name=apache-cassandra-${VERSION}-bin.tar.gz
tarball=${upstream_dir}/${tarball_name}
cassandra_dir=${upstream_dir}/${cassandra_name}

jna_version=4.2.2
jna=${upstream_dir}/jna-${jna_version}.jar


## clean up
mkdir -p ${upstream_dir}/
rm -r ${upstream_dir}/*

## download and extract both Cassandra and JNA to the right places

cd  ${upstream_dir}/
curl -o ${tarball_name} http://archive.apache.org/dist/cassandra/${VERSION}/${tarball_name}
tar xvf ${tarball_name}

curl -o jna-${jna_version}.jar https://maven.java.net/content/repositories/releases/net/java/dev/jna/jna/${jna_version}/jna-${jna_version}.jar

cd ${current_dir}
