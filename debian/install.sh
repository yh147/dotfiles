#!/bin/bash

function install_CI() {
	bash java.sh install8
	source ~/.bash_profile
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
		echo "start install CI"
		install_CI
		;;
	uninstallCI)
		echo "start uninstall CI"
		uninstall_CI
		;;
	*)
		echo $"Usage: $0 {CI|uninstallCI}"
		;;
esac
