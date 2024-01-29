# linux_clash
为centos服务器配置clash服务

centos 翻墙步骤

1、将clash上传到服务器 基于不同的系统架构 在github上选择不同的压缩包
2、解压clash文件 gunzip ./clash-linux-amd64-v1.17.0 然后 chmod 777 ./clash-linux-amd64-v1.17.0 并创建软连接 ln -s $(pwd)/clash-linux-amd64-v1.17.0 /usr/bin/clash
3、使用 wget ./config.yaml [vpn的订阅链接]
4、将Country.mmdbcd 和 config.yaml 放到 解压clash的路径下
4.5 chmod 777 ./pre_start_serivce.sh start_service.sh stop_service.sh  post_stop_service.sh 修改脚本权限
5、复制服务启动 停止所需脚本到服务器上 并将start_service.sh 文件中的路径改为Country.mmdbcd 和 config.yaml所在路径
6、复制clash.service文件到 /etc/systemd/system 并对文件进行编辑，将服务启动 停止脚本所在的路径改到文件中
7、systemctl start clash 启动服务
8、使用 curl https://www.google.com.hk/ 检验是否成功翻墙 返回一堆东西则成功 返回一行则失败

如果仍然不能访问，则手动执行一下 source /etc/profile

