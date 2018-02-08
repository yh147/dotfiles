#!/bin/bash

function install_nginx() {
	add_user
	get_src
	check_dependence
	config_nginx
	clear_src
}

function check_dependence() {
	apt-get install libpcre3 libpcre3-dev
	apt-get install openssl libssl-dev
	apt-get install zlib1g-dev
}

function add_user() {
	groupadd -r nginx
	useradd -r -g nginx nginx
}

function get_src() {
	cd /home
	wget http://nginx.org/download/nginx-1.12.2.tar.gz
}

function config_nginx() {
	tar -zxvf nginx-1.12.2.tar.gz && \
	cd nginx-1.12.2 && \
	./configure --prefix=/home/nginx \
	--user=nginx --group=nginx \
	--with-http_ssl_module \
	--with-pcre && \
	make && make install
}

function clear_src() {
	rm -rf /home/nginx-1.12.2.tar.gz
	rm -rf /home/nginx-1.12.2
}

function start_nginx() {
	/home/nginx/sbin/nginx
}

function stop_nginx() {
	/home/nginx/sbin/nginx -s stop
}

function reload_nginx() {
	/home/nginx/sbin/nginx -s reload
}

function check_nginx_conf() {
	/home/nginx/sbin/nginx -t
}

function uninstall_nginx() {
	stop_nginx
	rm -rf /home/nginx
}

case $1 in
	install)
		echo "start install nginx"
		install_nginx
		;;
	uninstall)
		echo "uninstall nginx"
		uninstall_nginx
		;;
	start)
		echo "start nginx"
		start_nginx
		;;
	stop)
		echo "stop nginx"
		stop_nginx
		;;
	reload)
		echo "reload nginx"
		reload_nginx
		;;
	check)
		echo "check nginx conf"
		check_nginx_conf
		;;
	*)
		echo $"Usage: $0 {start|stop|reload|check|install|uninstall}"
		;;
esac
