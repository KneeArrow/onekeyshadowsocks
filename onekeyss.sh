#!/bin/sh
wget --no-check-certificate https://raw.githubusercontent.com/KneeArrow/shadowsocks_install/master/shadowsocks.sh
wget --no-check-certificate https://raw.githubusercontent.com/KneeArrow/shadowsocks_install/master/shadowsocks-crond.sh
wget -N --no-check-certificate https://raw.githubusercontent.com/91yun/serverspeeder/master/serverspeeder-all.sh
chmod +x shadowsocks.sh
chmod +x shadowsocks-crond.sh
chmod +x serverspeeder-all.sh
./shadowsocks.sh 2>&1 | tee shadowsocks.log
bash serverspeeder-all.sh
echo '*/5 * * * * root bash /root/shadowsocks-crond.sh' >>  /etc/crontab
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo '0 5 * * * reboot' >>  /etc/crontab  
reboot

