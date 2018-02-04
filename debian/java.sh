#!/bin/bash

jdk_src_dir="/home/src"

function install_jdk() {
	if [ ! -d $jdk_src_dir ]; then
		mkdir $jdk_src_dir
	fi

	cd $jdk_src_dir

	if [ $first == "install8" ]; then
		wget https://yangyaqi.cn/mirrors/java/jdk-8u162-linux-x64.tar.gz
		tar -zxvf jdk-8u162-linux-x64.tar.gz
		rm jdk-8u162-linux-x64.tar.gz
	fi
}

first=$1
case $first in
	install8)
		echo "######################################"
		echo "          start install jdk8          "
		echo "######################################"
		install_jdk
		;;
	*)
		echo "argument error"
		;;
esac
