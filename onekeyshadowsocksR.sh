#!/bin/sh
wget --no-check-certificate https://raw.githubusercontent.com/KneeArrow/shadowsocks_install/master/shadowsocksR.sh
wget --no-check-certificate https://raw.githubusercontent.com/KneeArrow/shadowsocks_install/master/shadowsocks-crond.sh
wget -N --no-check-certificate https://raw.githubusercontent.com/KneeArrow/serverspeeder/master/serverspeeder-all.sh
chmod +x shadowsocksR.sh
chmod +x shadowsocks-crond.sh
chmod +x serverspeeder-all.sh
./shadowsocks-go.sh 2>&1 | tee shadowsocks-go.log
bash serverspeeder-all.sh
echo '*/5 * * * * root bash /root/shadowsocks-crond.sh' >>  /etc/crontab
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime


