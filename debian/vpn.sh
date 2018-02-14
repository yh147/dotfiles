#!/bin/bash

function install_vpn() {
	get_src
	check_dependence
	clear_src
}

function check_dependence() {
	apt-get install -y gcc
	apt-get install -y make
}

function get_src() {
	cd /home
	wget https://yangyaqi.cn/mirrors/vpn-v4.25-9656.tar.gz
	tar -zxvf vpn-v4.25-9656.tar.gz
}

function uninstall_vpn() {
	rm -rf /etc/init.d/vpn-fpm
	rm -rf /home/vpn7
}

case $1 in
	install)
		echo "start install vpn"
		install_vpn
		;;
	uninstall)
		echo "uninstall vpn"
		uninstall_vpn
		;;
	*)
		echo $"Usage: $0 {start|stop|reload|check|install|uninstall|info}"
		;;
esac
