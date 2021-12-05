#!/bin/bash

myping()
{
#检测局域网内ip地址是否开启

for i in {1..254}
do
	ping -c 2 -i 0.5 192.168.1.$i >/dev/null	#-c 2指发送两次，-i 0.5指每隔0.5秒发送一次，将输出信息重定向到/dev/null文件
	if [ $? -eq 0 ]
	then
		echo "192.168.1.$i is up"
	else
		echo "192.168.1.$i is down"
	fi
done
}

#查询本地ip
ip=`ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'`
echo $ip
:<<参数说明
ifconfig -a :返回本机所有ip信息
grep inet :截取包含inet的行
grep -v 127.0.0.1 :去掉包含127.0.0.1那行
grep -v inet6 :去掉包含inet6的行
awk '{print $2}' :返回第二列的内容
参数说明



