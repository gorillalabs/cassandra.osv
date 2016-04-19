#!/bin/sh

# pull this into whatever. vars.sh? because otherwise it's duplicated.
VERSION="3.4"
current_dir=${PWD}
upstream_dir=${current_dir}/upstream

cassandra_name=apache-cassandra-$VERSION
tarball_name=apache-cassandra-${VERSION}-bin.tar.gz
tarball=${upstream_dir}/${tarball_name}
cassandra_dir=${upstream_dir}/${cassandra_name}

jna_version=4.2.2
jna=${upstream_dir}/jna-${jna_version}.jar




rm -r ${current_dir}/ROOTFS
mkdir -p ${current_dir}/ROOTFS/usr/cassandra/lib
mkdir -p ${current_dir}/ROOTFS/usr/cassandra/conf
cp -r ${cassandra_dir}/lib ${current_dir}/ROOTFS/usr/cassandra
cp -r ${cassandra_dir}/conf ${current_dir}/ROOTFS/usr/cassandra
cp ${jna} ${current_dir}/ROOTFS/usr/cassandra/lib
ln -sfn ${cassandra_dir} ${upstream_dir}/current
cp ${current_dir}/cassandra.yaml ${current_dir}/ROOTFS/usr/cassandra/conf/cassandra.yaml
cp ${current_dir}/cassandra.yaml.template ${current_dir}/ROOTFS/usr/cassandra/conf/cassandra.yaml.template

mkdir -p ${current_dir}/ROOTFS/usr/cassandra/data/data
mkdir -p ${current_dir}/ROOTFS/usr/cassandra/data/commitlog
mkdir -p ${current_dir}/ROOTFS/usr/cassandra/data/saved_caches
mkdir -p ${current_dir}/ROOTFS/usr/cassandra/data/hints
