#!/bin/bash

function install_nginx() {
	add_user
	get_src
	check_dependence
	config_nginx
	clear_src
}

function check_dependence() {
	version=`cat /proc/version`
	if [[ $version =~ "centos" ]]; then
		yum install -y gcc
		yum install -y pcre pcre-devel
		yum install -y openssl openssl-devel
	elif [[ $version =~ "debian" ]]; then
		apt-get install -y gcc
		apt-get install -y make
		apt-get install -y libpcre3 libpcre3-dev
		apt-get install -y openssl libssl-dev
		apt-get install -y zlib1g-dev
	fi
}

function add_user() {
	groupadd -r nginx
	useradd -r -g nginx -s /bin/false -M nginx
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
	systemctl start nginx
}

function stop_nginx() {
	systemclt stop nginx
}

function uninstall_nginx() {
	stop_nginx
	systemctl disable nginx
	rm -rf /etc/systemd/system/nginx.service
	rm -rf /home/nginx
}

function init_nginx() {
	wget -P /etc/systemd/system/ "https://raw.githubusercontent.com/yh1306/dotfiles/master/service/nginx.service"
	systemctl start nginx
	systemctl enable nginx
	systemctl status nginx
}

case $1 in
	install)
		echo "start install nginx"
		install_nginx
		init_nginx
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
	*)
		echo $"Usage: $0 {start|stop|install|uninstall}"
		;;
esac
