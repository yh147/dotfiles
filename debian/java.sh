#!/bin/bash

function install_jdk() {
	if [ $first == "install8" ]; then
		wget https://yangyaqi.cn/mirrors/java/jdk-8u162-linux-x64.tar.gz
		tar -zxvf jdk-8u162-linux-x64.tar.gz -C /home/
		rm -rf jdk-8u162-linux-x64.tar.gz
		echo export JAVA_HOME=/home/jdk1.8.0_162 >> ~/.bash_profile
		echo export PATH='$JAVA_HOME'/bin:'$PATH' >> ~/.bash_profile
	fi
}

function uninstall_jdk() {
	if [ $first == "uninstall8" ]; then
		sed -i '/JAVA_HOME/d' ~/.bash_profile
		rm -rf /home/jdk1.8.0_162
	fi

}

first=$1
case $first in
	install8)
		echo "start install jdk8"
		install_jdk
		;;
	uninstall8)
		echo "uninstall jdk8"
		uninstall_jdk
		;;
	*)
		echo "argument error"
		;;
esac
