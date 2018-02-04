#!/bin/bash

maven_src_dir="/home/src"

function check_jdk() {
	if [ -z $JAVA_HOME ]; then
		bash java.sh install8
	fi
}

function install_maven() {
	if [ ! -d $maven_src_dir ]; then
		mkdir $maven_src_dir
	fi

	cd $maven_src_dir
	wget http://mirrors.hust.edu.cn/apache/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz
	tar -zxvf apache-maven-3.5.2-bin.tar.gz -C /home/
	echo export M2_HOME=/home/apache-maven-3.5.2 >> ~/.bash_profile
	echo export PATH='$M2_HOME'/bin:'$PATH' >> ~/.bash_profile
}

function config_maven() {
	echo "config"
}

function uninstall_maven() {
	echo "uninstall"
}

case $1 in
	install)
		echo "######################################"
		echo "        start install maven          "
		echo "######################################"
		install_maven
		;;
	uninstall)
		echo "######################################"
		echo "          uninstall maven             "
		echo "######################################"
		uninstall_maven
		;;
	*)
		echo "argument error"
		;;
esac
