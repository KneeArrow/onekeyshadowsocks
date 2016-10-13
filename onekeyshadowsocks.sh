#!/bin/sh
wget --no-check-certificate https://raw.githubusercontent.com/KneeArrow/shadowsocks_install/master/shadowsocks.sh
wget --no-check-certificate https://raw.githubusercontent.com/KneeArrow/shadowsocks_install/master/shadowsocks-crond.sh
wget -N --no-check-certificate https://raw.githubusercontent.com/KneeArrow/serverspeeder/master/serverspeeder-all.sh
#wget --no-check-certificate https://raw.githubusercontent.com/KneeArrow/net-speeder/master/net-speeder_CentOS.sh
chmod +x shadowsocks.sh
chmod +x shadowsocks-crond.sh
chmod +x serverspeeder-all.sh
#chmod +x net-speeder_CentOS.sh
./shadowsocks.sh 2>&1 | tee shadowsocks.log
bash serverspeeder-all.sh
#sh net-speeder_CentOS.sh
echo '*/5 * * * * root bash /root/shadowsocks-crond.sh' >>  /etc/crontab
#echo 'nohup /usr/local/net_speeder/net_speeder venet0 "ip" >/dev/null 2>&1 & ' >> /etc/rc.local
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo '0 5 * * * reboot' >>  /etc/crontab  
reboot

