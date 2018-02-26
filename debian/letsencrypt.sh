#!/bin/bash

cd /home
git clone https://github.com/letsencrypt/letsencrypt
cd letsencrype
./letsencrypt-auto certonly --standalone --email yanghai1306@gmail.com -d yangyaqi.cn -d www.yangyaqi.cn -d wx.yangyaqi.cn -d mirrors.yangyaqi.cn
