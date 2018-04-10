#!/bin/bash

nexus_src_dir="/home/nexus"
nexus_url="https://mirrors.yangyaqi.cn/nexus/nexus-3.10.0-04-unix.tar.gz"

function check_jdk() {
	if [ -z $JAVA_HOME ]; then
		bash java.sh install8
	fi
}

function install_nexus() {
	if [ ! -d $nexus_src_dir ]; then
		mkdir $nexus_src_dir
	fi

	cd $nexus_src_dir
	wget $nexus_url
	tar -zxvf nexus-3.10.0-04-unix.tar.gz
	rm -rf nexus-3.10.0-04-unix.tar.gz
}

function start_nexus() {
	/home/nexus/nexus-3.10.0-04/bin/nexus start
}

function stop_nexus() {
	/home/nexus/nexus-3.10.0-04/bin/nexus stop
}

function uninstall_nexus() {
	stop_nexus
	rm -rf /home/nexus
}

case $1 in
	install)
		echo "start install nexus"
		check_jdk
		install_nexus
		;;
	uninstall)
		echo "uninstall nexus"
		uninstall_nexus
		;;
	start)
		echo "start nexus"
		start_nexus
		;;
	stop)
		echo "stop nexus"
		stop_nexus
		;;
	*)
		echo $"Usage: $0 {start|stop|install|uninstall}"
		;;
esac
