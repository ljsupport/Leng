#!/bin/bash

#获取Cento系统版本
VERSION=`rpm -q centos-release`
VERSION1="centos-release-6"
VERSION2="centos-release-7"

echo "请选择需要的操作（按下对应数字后回车确认）"
echo "1：更换Centos内核"
echo "2：一键安装锐速"
echo "0：退出"
read num

#更换Centos内核
if [ "${num}" == "1" ]
then

if [[ $VERSION == $VERSION1* ]]; then
rpm -ivh http://soft.91yun.org/ISO/Linux/CentOS/kernel/kernel-firmware-2.6.32-504.3.3.el6.noarch.rpm
rpm -ivh http://soft.91yun.org/ISO/Linux/CentOS/kernel/kernel-2.6.32-504.3.3.el6.x86_64.rpm --force

else
rpm -ivh http://soft.91yun.org/ISO/Linux/CentOS/kernel/kernel-3.10.0-229.1.2.el7.x86_64.rpm --force
fi

reboot
fi

#安装锐速
if [ "${num}" == "2" ]
then
yum -y install net-tools
wget -N --no-check-certificate https://github.com/91yun/serverspeeder/raw/master/serverspeeder.sh && bash serverspeeder.sh

sh ls.sh
fi


if [ "${num}" == "0" ]
then
exit
fi
