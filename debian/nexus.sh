#!/bin/bash

nexus_src_dir="/home/nexus"

function check_jdk() {
	if [ -z $JAVA_HOME ]; then
		bash java.sh install8
	fi
}

function install_nexus() {
	if [ ! -d $nexus_src_dir ]; then
		mkdir $nexus_src_dir
	fi

	cd $nexus_src_die
	wget https://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-3.7.1-02-unix.tar.gz
	tar -zxvf nexus-3.7.1-02-unix.tar.gz
}

function start_nexus() {
	/home/nexus/nexus-3.7.1-02/bin/nexus start
}

function stop_nexus() {
	/home/nexus/nexus-3.7.1-02/bin/nexus stop
}

function uninstall_nexus() {
	stop_nexus
	rm -rf /home/nexus
}

case $1 in
	install)
		echo "######################################"
		echo "        start install nexus         "
		echo "######################################"
		check_jdk
		install_nexus
		;;
	uninstall)
		echo "######################################"
		echo "          uninstall nexus           "
		echo "######################################"
		uninstall_nexus
		;;
	start)
		echo "######################################"
		echo "          start nexus           "
		echo "######################################"
		start_nexus
		;;
	stop)
		echo "######################################"
		echo "            stop nexus              "
		echo "######################################"
		stop_nexus
		;;
	*)
		echo "argument error"
		;;
esac
