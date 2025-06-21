#!/bin/bash
while true; do
read -p "$(printf '\r\n\r\n\033[36m是否希望玩客云设备在 PPPwn 后连接到互联网? (Y|N):\033[0m ')" pppq
case $pppq in
[Yy]* )
sudo apt install dnsmasq  -y
echo 'bogus-priv
expand-hosts
domain-needed
server=8.8.8.8
listen-address=127.0.0.1
port=5353
conf-file=/etc/dnsmasq.more.conf' | sudo tee /etc/dnsmasq.conf
echo 'address=/playstation.com/127.0.0.1
address=/playstation.net/127.0.0.1
address=/playstation.org/127.0.0.1
address=/akadns.net/127.0.0.1
address=/akamai.net/127.0.0.1
address=/akamaiedge.net/127.0.0.1
address=/edgekey.net/127.0.0.1
address=/edgesuite.net/127.0.0.1
address=/llnwd.net/127.0.0.1
address=/scea.com/127.0.0.1
address=/sonyentertainmentnetwork.com/127.0.0.1
address=/ribob01.net/127.0.0.1
address=/cddbp.net/127.0.0.1
address=/nintendo.net/127.0.0.1
address=/ea.com/127.0.0.1' | sudo tee /etc/dnsmasq.more.conf
sudo systemctl restart dnsmasq
echo 'auth
lcp-echo-failure 3
lcp-echo-interval 60
mtu 1482
mru 1482
require-pap
ms-dns 192.168.233.1
netmask 255.255.255.0
defaultroute
noipdefault
usepeerdns' | sudo tee /etc/ppp/pppoe-server-options
while true; do
read -p "$(printf '\r\n\r\n\033[36m是否要设置 PPPoE 用户名和密码?\r\n如果选择“否”，则将使用这些默认值\r\n\r\nUsername: \033[33mppp\r\n\033[36mPassword: \033[33mppp\r\n\r\n\033[36m(Y|N)?: \033[0m')" wapset
case $wapset in
[Yy]* ) 
while true; do
read -p  "$(printf '\033[33mEnter Username: \033[0m')" PPPU
case $PPPU in
"" ) 
 echo -e '\033[31m不能为空哈!\033[0m';;
 * )  
if grep -q '^[0-9a-zA-Z_ -]*$' <<<$PPPU ; then 
if [ ${#PPPU} -le 1 ]  || [ ${#PPPU} -ge 33 ] ; then
echo -e '\033[31m用户名长度必须介于 2 到 32 个字符之间\033[0m';
else 
break;
fi
else 
echo -e '\033[31m用户名只能包含字母数字字符\033[0m';
fi
esac
done
while true; do
read -p "$(printf '\033[33mEnter password: \033[0m')" PPPW
case $PPPW in
"" ) 
 echo -e '\033[31mC不能为空哈!\033[0m';;
 * )  
if [ ${#PPPW} -le 1 ]  || [ ${#PPPW} -ge 33 ] ; then
echo -e '\033[31m密码长度必须介于 2 到 32 个字符之间\033[0m';
else 
break;
fi
esac
done
echo -e '\033[36m使用自定义设置\r\n\r\nUsername: \033[33m'$PPPU'\r\n\033[36mPassword: \033[33m'$PPPW'\r\n\r\n\033[0m'
break;;
[Nn]* ) 
echo -e '\033[36m使用默认设置\r\n\r\nUsername: \033[33mppp\r\n\033[36mPassword: \033[33mppp\r\n\r\n\033[0m'
 PPPU="ppp"
 PPPW="ppp"
break;;
* ) echo -e '\033[31m请输入 Y 或 N\033[0m';;
esac
done
echo '"'$PPPU'"  *  "'$PPPW'"  192.168.233.2' | sudo tee /etc/ppp/pap-secrets
INET="true"
SHTDN="false"
echo -e '\033[32m已安装 PPPoE\033[0m'
break;;
[Nn]* ) 
echo -e '\033[35m跳过 PPPoE 安装\033[0m'
INET="false"
while true; do
read -p "$(printf '\r\n\r\n\033[36m是否希望玩客云在PPPwn脚本运行成功后关闭吗\r\n\r\n\033[36m(Y|N)?: \033[0m')" pisht
case $pisht in
[Yy]* ) 
SHTDN="true"
echo -e '\033[32mok!玩客云运行结束后会自动关机\033[0m'
break;;
[Nn]* ) 
echo -e '\033[35m好吧,这样玩客云就不会自动关机了QAQ\033[0m'
SHTDN="false"
break;;
* ) echo -e '\033[31m请输入 Y 或 N\033[0m';;
esac
done
break;;
* ) echo -e '\033[31m请输入 Y 或 N\033[0m';;
esac
done
while true; do
read -p "$(printf '\r\n\r\n\033[36m你想用pppwn的旧python版本吗，他在运行的时候会慢很多\r\n\r\n\033[36m(Y|N)?: \033[0m')" cppp
case $cppp in
[Yy]* ) 
UCPP="false"
sudo apt install python3 python3-scapy -y
echo -e '\033[32m正在使用 PPPwn 的 Python 版本\033[0m'
break;;
[Nn]* ) 
echo -e '\033[35m正在使用 PPPwn 的 C++ 版本\033[0m'
UCPP="true"
break;;
* ) echo -e '\033[31m请输入 Y 或 N\033[0m';;
esac
done
while true; do
read -p "$(printf '\r\n\r\n\033[36m是否要更改正在使用的PS4固件版本，默认值为 11.00\r\n\r\n\033[36m(Y|N)?: \033[0m')" fwset
case $fwset in
[Yy]* ) 
while true; do
read -p  "$(printf '\033[33m输入固件版本 [11.00 | 10.71 | 10.70 | 10.50 | 10.01 | 10.00 | 9.60 | 9.03 | 9.00]: \033[0m')" FWV
case $FWV in
"" ) 
 echo -e '\033[31m不 能 为 空 !\033[0m';;
 * )  
if grep -q '^[0-9.]*$' <<<$FWV ; then 

if [[ ! "$FWV" =~ ^("11.00"|"10.71"|"10.70"|"10.50"|"10.01"|"10.00"|"9.60"|"9.03"|"9.00")$ ]]  ; then
echo -e '\033[31mT版本必须为11.00, 10.71, 10.70, 10.50, 10.01, 10.00, 9.60, 9.03 或 9.00\033[0m';
else 
break;
fi
else 
echo -e '\033[31m版本只能包含字母数字字符\033[0m';
fi
esac
done
echo -e '\033[32m您正在使用 '$FWV'\033[0m'
break;;
[Nn]* ) 
echo -e '\033[35m使用默认设置: 11.00\033[0m'
FWV="11.00"
break;;
* ) echo -e '\033[31m请输入 Y 或 N\033[0m';;
esac
done
ip link
while true; do
read -p "$(printf '\r\n\r\n\033[36m是否要更改玩客云的局域网接口，默认为eth0\r\n\r\n\033[36m(Y|N)?: \033[0m')" ifset
case $ifset in
[Yy]* ) 
while true; do
read -p  "$(printf '\033[33m输入接口值: \033[0m')" IFCE
case $IFCE in
"" ) 
 echo -e '\033[31m不能为空!\033[0m';;
 * )  
if grep -q '^[0-9a-zA-Z_ -]*$' <<<$IFCE ; then 
if [ ${#IFCE} -le 1 ]  || [ ${#IFCE} -ge 17 ] ; then
echo -e '\033[31m接口长度必须介于 2 到 16 个字符之间\033[0m';
else 
break;
fi
else 
echo -e '\033[31m接口只能包含字母数字字符\033[0m';
fi
esac
done
echo -e '\033[32m您正在使用 '$IFCE'\033[0m'
break;;
[Nn]* ) 
echo -e '\033[35m使用默认设置: eth0\033[0m'
IFCE="eth0"
break;;
* ) echo -e '\033[31m请输入 Y 或 N\033[0m';;
esac
done
VUSB="false"
DTLINK="false"
echo '#!/bin/bash
INTERFACE="'$IFCE'" 
FIRMWAREVERSION="'$FWV'" 
SHUTDOWN='$SHTDN'
USECPP='$UCPP'
PPPOECONN='$INET'
DTLINK='$DTLINK'
PPDBG=false
TIMEOUT="1m"
VMUSB=false'  | sudo tee /boot/firmware/PPPwn/config.sh >/dev/null 2>&1 &
sudo rm /usr/lib/systemd/system/bluetooth.target >/dev/null 2>&1 &
sudo rm /usr/lib/systemd/system/network-online.target >/dev/null 2>&1 &
sudo sed -i 's^sudo bash /boot/firmware/PPPwn/run.sh \&^^g' /etc/rc.local
echo '[Service]
WorkingDirectory=/boot/firmware/PPPwn
ExecStart=/boot/firmware/PPPwn/run.sh
Restart=never
User=root
Group=root
Environment=NODE_ENV=production
[Install]
WantedBy=multi-user.target' | sudo tee /etc/systemd/system/wkypwn.service >/dev/null 2>&1 &
sudo chmod u+rwx /etc/systemd/system/wkypwn.service
sudo systemctl enable wkypwn
sudo systemctl start wkypwn
echo -e '\033[36m安装完成,\033[33m 正在重启中······\033[0m'
sudo reboot
