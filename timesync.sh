cat /root/ntp.sh 

#!/bin/bash

#######################################################
# Function: Inspection Time
# Author: davie
ntp_cmd="/usr/sbin/ntpdate"
if [ ! -f "${ntp_cmd}" ]; then
echo "/usr/sbin/ntpdate does not exists!"
yum -y install ntp* >/dev/null
fi

#NTP服务器数组列表
ntpServer=(
[0]=0.cn.pool.ntp.org
[1]=1.cn.pool.ntp.org
[2]=2.cn.pool.ntp.org
[3]=3.cn.pool.ntp.org
)
#校验#
serverNum=`echo ${#ntpServer[*]}`
NUM=0
for ((i=0; i<=$serverNum; i++)); do
echo -n "正在和NTP服务器:${ntpServer[$NUM]}校验中..."
/usr/sbin/ntpdate ${ntpServer[$NUM]} >> /dev/null 2>&1
if [ $? -eq 0 ]; then
echo -e "\e[1;32m\t[成功]\e[0m"
echo -e "\e[1;32m同步成功,退出......\e[0m"
break
else
echo -e "\e[1;31m\t[失败]\e[0m"
echo -e "\e[1;31m继续同步下一个!!!!!\e[0m"
let NUM++
fi
sleep 2
done