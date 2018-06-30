#!/bin/bash

java_url="https://mirrors.yangyaqi.cn/java/jdk-8u172-linux-x64.tar.gz"

function install_jdk() {
	if [ $first == "install8" ]; then
		wget $java_url
		tar -zxvf jdk-8u172-linux-x64.tar.gz -C /home/
		rm -rf jdk-8u172-linux-x64.tar.gz
		echo export JAVA_HOME=/home/jdk1.8.0_172 >> ~/.bash_profile
		echo export PATH='$JAVA_HOME'/bin:'$PATH' >> ~/.bash_profile
	fi
}

function uninstall_jdk() {
	if [ $first == "uninstall8" ]; then
		sed -i '/JAVA_HOME/d' ~/.bash_profile
		rm -rf /home/jdk1.8.0_172
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
		echo $"Usage: $0 {install8|uninstall8}"
		;;
esac
