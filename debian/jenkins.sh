#!/bin/bash

jenkins_src_dir="/home/jenkins"

function check_jdk() {
	if [ -z $JAVA_HOME ]; then
		bash java.sh install8
	fi
}

function install_jenkins() {
	if [ ! -d $jenkins_src_dir ]; then
		mkdir $jenkins_src_dir
	fi

	cd $jenkins_src_dir
	wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war
}

function start_jenkins() {
	nohup java -jar /home/jenkins/jenkins.war >/home/jenkins/jenkins.log 2>&1 &
}

function stop_jenkins() {
	ps -ef | grep jenkins | awk '{print $2}' | xargs kill -9
}

function uninstall_jenkins() {
	stop_jenkins
	rm -rf /home/jenkins
	rm -rf /root/.jenkins
}

case $1 in
	install)
		echo "######################################"
		echo "        start install jenkins         "
		echo "######################################"
		check_jdk
		install_jenkins
		;;
	uninstall)
		echo "######################################"
		echo "          uninstall jenkins           "
		echo "######################################"
		uninstall_jenkins
		;;
	start)
		echo "######################################"
		echo "          start jenkins           "
		echo "######################################"
		start_jenkins
		;;
	stop)
		echo "######################################"
		echo "            stop jenkins              "
		echo "######################################"
		stop_jenkins
		;;
	*)
		echo "argument error"
		;;
esac
