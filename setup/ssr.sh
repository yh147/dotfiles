#!/bin/bash
source functions.sh

#install ShadowsocksX-NG
yyq_echo "Installing ShadowsocksX-NG ..."

curl -O https://yangyaqi.cn/ShadowsocksX-NG.1.7.0.zip 
unzip ShadowsocksX-NG.1.7.0.zip -d /Applications/
rm ShadowsocksX-NG.1.7.0.zip

yyq_echo "ShadowsocksX-NG installed"

#curl proxy
echo export ALL_PROXY=socks5://127.0.0.1:1086 >> ~/.bash_profile
