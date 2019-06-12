#!/bin/bash

function install() {
	apt-get install erlang-nox
	wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | sudo apt-key add -
	apt-get update
	apt-get install rabbitmq-server
	rabbitmq-plugins enable rabbitmq_management
	systemctl restart rabbitmq-server
	systemctl status rabbitmq-server
}

function add_user() {
	rabbitmqctl add_user admin admin
	rabbitmqctl set_user_tags admin administrator
}


first=$1
case $first in
	install)
		echo "start install rabbitmq-server"
		install
		;;
	add_user)
		echo "add_user"
		add_user
		;;
	*)
		echo $"Usage: $0 {install|add_user}"
		;;
esac
