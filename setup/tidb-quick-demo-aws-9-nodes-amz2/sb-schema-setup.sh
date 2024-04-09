#!/bin/bash

source ./hosts-env.sh

mysql -h ${HOST_DB1_PRIVATE_IP} -uroot -P4000 << 'EOFX'
CREATE DATABASE sbtest;
CREATE USER 'user1'@'%' IDENTIFIED BY 'tidb';
CREATE USER 'user2'@'%' IDENTIFIED BY 'tidb';
GRANT ALL PRIVILEGES ON *.*  TO 'user1'@'%';
GRANT ALL PRIVILEGES ON *.*  TO 'user2'@'%';
EOFX
