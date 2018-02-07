#!/bin/bash

function check_jdk() {
	if [ -z $JAVA_HOME ]; then
		bash java.sh install8
	fi
}

function install_maven() {
	wget http://mirrors.hust.edu.cn/apache/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz
	tar -zxvf apache-maven-3.5.2-bin.tar.gz -C /home/
	rm -rf  apache-maven-3.5.2-bin.tar.gz
	echo export M2_HOME=/home/apache-maven-3.5.2 >> ~/.bash_profile
	echo export PATH='$M2_HOME'/bin:'$PATH' >> ~/.bash_profile
}

function config_maven() {
	config_maven_local_repo
	config_maven_mirror
}

function config_maven_local_repo() {
	sed -i "55G" /home/apache-maven-3.5.2/conf/settings.xml
	sed -i "56s/^/ <localRepository>\/home\/apache-maven-3.5.2\/local\/repo<\/localRepository>/" /home/apache-maven-3.5.2/conf/settings.xml
	sed -i "56G" /home/apache-maven-3.5.2/conf/settings.xml
}

function config_maven_mirror() {
	sed -i "160G" /home/apache-maven-3.5.2/conf/settings.xml
	sed -i "161s/^/    <mirror>/" /home/apache-maven-3.5.2/conf/settings.xml
	sed -i "161G" /home/apache-maven-3.5.2/conf/settings.xml
	sed -i "162s/^/      <id>alimaven<\/id>/" /home/apache-maven-3.5.2/conf/settings.xml
	sed -i "162G" /home/apache-maven-3.5.2/conf/settings.xml
	sed -i "163s/^/      <name>aliyun maven<\/name>/" /home/apache-maven-3.5.2/conf/settings.xml
	sed -i "163G" /home/apache-maven-3.5.2/conf/settings.xml
	sed -i "164s/^/      <url>http:\/\/maven.aliyun.com\/nexus\/content\/groups\/public\/<\/url>/" /home/apache-maven-3.5.2/conf/settings.xml
	sed -i "164G" /home/apache-maven-3.5.2/conf/settings.xml
	sed -i "165s/^/      <mirrorOf>central<\/mirrorOf>/" /home/apache-maven-3.5.2/conf/settings.xml
	sed -i "165G" /home/apache-maven-3.5.2/conf/settings.xml
	sed -i "166s/^/    <\/mirror>/" /home/apache-maven-3.5.2/conf/settings.xml
}

function uninstall_maven() {
	sed -i '/M2_HOME/d' ~/.bash_profile
	rm -rf /home/apache-maven-3.5.2
}

case $1 in
	install)
		echo "start install maven"
		check_jdk
		install_maven
		config_maven
		;;
	uninstall)
		echo "uninstall maven"
		uninstall_maven
		;;
	*)
		echo "argument error"
		;;
esac
