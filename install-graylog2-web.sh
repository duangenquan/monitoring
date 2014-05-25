#!/bin/bash
##
# Installs the Graylog2 web interface
#
# Dependencies:
# - Graylog2 server
##
BASE_PATH=`pwd`
TMP_PATH=$BASE_PATH/tmp

apt-get install -y openjdk-7-jre-headless

mkdir -p $TMP_PATH && cd $TMP_PATH

useradd -s /bin/false -d /var/lib/graylog2 -m graylog2

mkdir -p /var/log/graylog2
chown graylog2:graylog2 /var/log/graylog2

curl -O -L https://github.com/Graylog2/graylog2-web-interface/releases/download/0.20.2/graylog2-web-interface-0.20.2.tgz
tar xf graylog2-web-interface-0.20.2.tgz
cp -R graylog2-web-interface-0.20.2 /usr/share/graylog2-web-interface

mkdir -p /etc/graylog2

cp $BASE_PATH/etc/graylog2/web-interface* /etc/graylog2
cp $BASE_PATH/etc/init/graylog2-web-interface.conf /etc/init

start graylog2-web-interface
