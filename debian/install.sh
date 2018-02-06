#!/bin/bash

function install_CI() {
	bash java.sh install8
	bash maven.sh install
	bash jenkins.sh install
	bash nexus.sh install
	bash jenkins.sh start
	bash nexus.sh start
}

function uninstall_CI() {
	bash java.sh uninstall8
	bash maven.sh uninstall
	bash jenkins.sh uninstall
	bash nexus.sh uninstall
}

case $1 in
	CI)
		echo "######################################"
		echo "          start install CI            "
		echo "######################################"
		install_CI
		;;
	uninstallCI)
		echo "######################################"
		echo "          start uninstall CI          "
		echo "######################################"
		uninstall_CI
		;;
	*)
		echo "argument error"
		;;
esac
