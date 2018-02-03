#!/bin/bash

jdk_src_dir="$HOME/Desktop/src"

function get_jdk() {
	if [ ! -d $jdk_src_dir ]; then
		mkdir $jdk_src_dir
	fi
	wget https://yangyaqi.cn/mirrors/java/jdk-8u162-linux-x64.tar.gz
}

case "$1" in
	install7)
		echo "######################################"
		echo "          start install jdk7          "
		echo "######################################"
		get_jdk
		;;
	install8)
		;;
	*)
		echo "Please use install or unstall as first argument"
		;;
esac
