# WKY Pwn

这个脚本是来自于 <a href=https://github.com/TheOfficialFloW/PPPwn>PPPwn</a> and <a href=https://github.com/xfangfang/PPPwn_cpp>PPPwn_cpp</a> 关于针对 Amlogic S805来运行 <a href=https://github.com/GoldHEN/GoldHEN>GoldHen</a> 在PS4 的 11.0, 10.71, 10.70, 10.50, 10.01, 10.00, 9.60, 9.03, 9.00版本进行自动化运行<br>
该脚本基本由[PI-Pwn](https://github.com/stooged/PI-Pwn)来修改而成。

~~PS：为什么淘宝会有399的商家去卖PS4的自动破解工具？？？~~

PS：有问题可以提issue，请勿删除github链接哈=。=



~~已知问题：破解后玩客云无法自动关机~~  #该问题已被修复

2024-5-21 更新中文脚本，整合53端口被占用脚本

<br>

## 测试设备

玩客云系列 Amlogic S805

后续待定···




## Install
<br>

需要有一定的动手能力，虽然玩客云刷写很简单但还是需要一定的基础能力，各位量力而行。

需要设备为： 

玩客云x1  v1和v2版本均可   PS：该设备经过测试

S805 类似架构设备等·····


你需要进行玩客云的固件安装，所需工具以及教程还需自行上网查找。<br>

推荐安装Armbian-unofficial_24.5.0-trunk_Onecloud_bookworm_current_6.6.20.burn.img
该固件经过测试可以完美激活以及成功后自动关机。
烧录工具以及教程还需各位自行寻找ing···



<br>

<br>

```sh
sudo apt update
sudo apt install git -y
sudo rm -r WKY-Pwn
git clone https://github.com/Mintneko/WKY-Pwn 
sudo mkdir /boot/firmware/
cd WKY-Pwn
sudo cp -r PPPwn /boot/firmware/
cd /boot/firmware/PPPwn
sudo chmod 777 *
sudo bash install.sh
```
### 中国大陆用户可以执行以下汉化脚本
```sh
sudo cp /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime #修改时区为中国大陆  
bash <(curl -sSL https://linuxmirrors.cn/main.sh)  #选1即可
sudo apt update
sudo apt install git unzip wget -y
sudo rm -r WKY-Pwn-main main.zip WKY-Pwn
wget https://mirror.ghproxy.com/https://github.com/Mintneko/WKY-Pwn/archive/refs/heads/main.zip  && unzip main.zip
sudo mkdir /boot/firmware/
cd WKY-Pwn-main
sudo cp -r PPPwn /boot/firmware/
cd /boot/firmware/PPPwn
sudo chmod 777 *
sudo bash install_ch.sh
```
<br>

在安装过程中，您将被要求设置一些选项.<br>

如果您使用USB 转以太网适配器连接到控制台，则需要选择 yes
如果您的 玩客云 有以太网端口并且您使用 USB 转以太网适配器，则 USB 适配器的接口应该是 eth1
如果您正在使用某些东西像 玩客云 一样，接口将是 eth0，如果是其他的运营商盒子可能会有改变
如果您选择使用 PPPwn 的 Python，它会慢得多，特别是在 S805的设备上 。

一旦 玩客云 重新启动，pppwn 将自动运行。


## On your PS4:<br>

将 USB 插入 PS4。USB 需放置goldhen.bin文件到根目录并且是格式化成exFAT
转到“设置”，然后转到“网络”。
选择设置 Internet 连接，然后选择使用 LAN 电缆。
选择“自定义设置”，然后为“IP 地址设置”选择“PPPoE”。
输入PPPoE用户ID和PPPoE密码的任何内容。  #建议输入默认的账号和密码 均为ppp
注意：如果您启用互联网访问，则必须匹配安装过程中输入的用户名和密码或使用默认值ppp
为“DNS 设置”和“MTU 设置”选择“自动”。
选择“不用于代理服务器”。

对于 GoldHen，您需要将 goldhen.bin 文件放在 USB 驱动器的根目录中并将其插入控制台。
一旦首次加载 goldhen，它将被复制到控制台内部硬盘，并且不再需要 USB。
要更新goldhen，只需重复上述过程，新版本将复制到内部硬盘

## FTP传输

如果玩客云pwn 设置为允许互联网访问，您可以在控制台上使用 ftp、klog 和 binloader 服务器
您的玩客云还必须通过 wifi 或第二个以太网连接连接到您的家庭网络
要从您的电脑连接到服务器，只需连接到网络上的玩客云 IP，所有请求都将转发到控制台

对于 ftp，请确保将 ftp 客户端软件上的传输模式设置为非Active被动。



## 他能做什么

一旦一切设置完毕并且以太网电缆插入玩客云和控制台之间，玩客云应该自动尝试并连接控制台。
该漏洞利用可能会失败多次，但玩客云将继续清除控制台以继续尝试破解自身。
一旦破解，如果您不使用互联网访问，该过程将停止，并且玩客云将关闭。

如果您想再次破解控制台，您将需要重新启动玩客云。

这个想法是你一起启动控制台和玩客云，并且玩客云将继续尝试 pwn 控制台，而无需你输入任何内容，只需在主屏幕上等待，直到该过程完成
## 更新

很可惜，这样做的玩客云破解并不能进行很便利的更新方式，目前的更新方式是接入屏幕、键盘以及携带更新文件的USB存储设备来进行，不过相当对的玩客云支持USB拓展WIFI，或许后续可以适配网络自动更新方式。
