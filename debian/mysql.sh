#!/bin/bash

function grant() {
  grant all privileges on *.* to 'root'@'%'identified by 'passwd' with grant option;
  FLUSH PRIVILEGES;
}

function install() {
	wget https://dev.mysql.com/get/mysql-apt-config_0.8.6-1_all.deb
	dpkg -i mysql-apt-config_0.8.6-1_all.deb
	apt-get update
	apt-get install mysql-server
}
