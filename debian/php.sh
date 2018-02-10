#!/bin/bash

php_install_dir="/home/php7"

function install_php() {
	add_user
	get_src
	check_dependence
	config_php
	clear_src
}

function check_dependence() {
	apt-get install -y gcc
	apt-get install -y make
	apt-get install -y libxml2-dev
	apt-get install -y openssl libssl-dev
	apt-get install -y libpng-dev
	apt-get install -y libfreetype6-dev
	apt-get install -y libmcrypt-dev
	ln -s /usr/lib/x86_64-linux-gnu/libssl.so  /usr/lib
}

function add_user() {
	groupadd -r php
	useradd -r -g php -s /bin/false -M php
}

function get_src() {
	cd /home
	wget http://cn2.php.net/distributions/php-7.2.2.tar.gz
}

function config_php() {
	tar -zxvf php-7.2.2.tar.gz && \
	cd php-7.2.2 && \
	./configure  --prefix=$php_install_dir \
	--with-gd \
	--with-zlib \
	--with-freetype-dir \
	--enable-gd-native-ttf \
	--enable-mysqlnd \
	--with-pdo-mysql=mysqlnd \
	--with-openssl \
	--with-mcrypt \
	--enable-mbstring \
	--enable-zip \
	--enable-fpm \
	--with-fpm-user=php \
	--with-fpm-group=php &&\
	make && make install
	cp php.ini-production $php_install_dir/lib/
	cp sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm
	cp $php_install_dir/etc/php-fpm.conf.default $php_install_dir/etc/php-fpm.conf
	cp $php_install_dir/etc/php-fpm.d/www.conf.default $php_install_dir/etc/php-fpm.d/www.conf
	chmod +x /etc/init.d/php-fpm
}

function clear_src() {
	rm -rf /home/php-7.2.2.tar.gz
	rm -rf /home/php-7.2.2
}

function start_php() {
	/etc/init.d/php-fpm start
}

case $1 in
	install)
		echo "start install php"
		install_php
		;;
	uninstall)
		echo "uninstall php"
		uninstall_php
		;;
	start)
		echo "start php"
		start_php
		;;
	stop)
		echo "stop php"
		stop_php
		;;
	reload)
		echo "reload php"
		reload_php
		;;
	check)
		echo "check php conf"
		check_php_conf
		;;
	info)
		echo "php configure info"
		config_info
		;;
	*)
		echo $"Usage: $0 {start|stop|reload|check|install|uninstall|info}"
		;;
esac
