#!/bin/sh
wget --no-check-certificate https://raw.githubusercontent.com/KneeArrow/shadowsocks_install/master/shadowsocks.sh
wget --no-check-certificate https://raw.githubusercontent.com/KneeArrow/shadowsocks_install/master/shadowsocks-crond.sh
wget --no-check-certificate https://raw.githubusercontent.com/KneeArrow/net-speeder/master/net-speeder_CentOS.sh
chmod +x shadowsocks.sh
chmod +x shadowsocks-crond.sh
chmod +x net_speeder_lazyinstall.sh
sh net_speeder_lazyinstall.sh
echo '*/5 * * * * root bash /root/shadowsocks-crond.sh' >> /etc/init.d/crond
echo 'nohup /usr/local/net_speeder/net_speeder venet0 "ip" >/dev/null 2>&1 & ' >> /etc/rc.local
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo '0 5 * * * reboot' >> /etc/init.d/crond
./shadowsocks.sh 2>&1 | tee shadowsocks.log
