#!/bin/bash

function install() {
	wget https://dev.mysql.com/get/mysql-apt-config_0.8.6-1_all.deb
	dpkg -i mysql-apt-config_0.8.6-1_all.deb
	apt-get update
	apt-get install mysql-server
}

first=$1
case $first in
	install)
		echo "start install mysql"
		install
		;;
	*)
		echo $"Usage: $ {install8|uninstall}"
		;;
esac
