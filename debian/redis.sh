#!/bin/bash

redis_service="https://raw.githubusercontent.com/yh147/dotfiles/master/service/redis.service"

cd /home/
wget http://download.redis.io/releases/redis-4.0.9.tar.gz
tar xzf redis-4.0.9.tar.gz
cd redis-4.0.9
make

mkdir -p /home/redis/bin
mkdir -p /home/redis/etc

cp redis.conf /home/redis/etc
cp src/mkreleasehdr.sh /home/redis/bin
cp src/redis-benchmark /home/redis/bin
cp src/redis-check-aof /home/redis/bin
cp src/redis-cli /home/redis/bin
cp src/redis-server /home/redis/bin

wget -P /etc/systemd/system/ $redis_service