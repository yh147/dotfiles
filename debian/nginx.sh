#!/bin/bash

function install_nginx() {
	add_user
	get_src
	config_nginx
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
		echo "######################################"
		echo "         start install nginx          "
		echo "######################################"
		install_nginx
		;;
	uninstall)
		echo "######################################"
		echo "           uninstall nginx            "
		echo "######################################"
		uninstall_nginx
		;;
	start)
		echo "######################################"
		echo "              start nginx             "
		echo "######################################"
		start_nginx
		;;
	stop)
		echo "######################################"
		echo "              stop nginx              "
		echo "######################################"
		stop_nginx
		;;
	reload)
		echo "######################################"
		echo "            reload nginx              "
		echo "######################################"
		reload_nginx
		;;
	check)
		echo "######################################"
		echo "         check nginx conf             "
		echo "######################################"
		check_nginx_conf
		;;
	*)
		echo "argument error"
		;;
esac
