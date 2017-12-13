#!/bin/bash


apt-get -y install python
apt-get -y install libmysqlclient-dev
apt-get -y install python-dev
apt-get -y install python-pip

pip install mysql_statsd

mkdir /var/log/mysql_statsd/

java -javaagent:/app/statsd-jvm-profiler-2.1.0-jar-with-dependencies.jar=server=$STATSD_SERVER,port=$STATSD_PORT

/etc/init.d/mysql restart


/usr/local/tomcat/bin/catalina.sh run

mysql_statsd --config /app/mysql-statsd.conf

/etc/init.d/mysql restart

