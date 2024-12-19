# linux_clash
## 为centos服务器配置clash服务

centos 翻墙步骤如下

1、将clash上传到服务器 基于不同的系统架构 在github上选择不同的压缩包 

2、解压clash文件 `gunzip ./clash-linux-amd64-v1.17.0` 然后 `chmod 777 ./clash-linux-amd64-v1.17.0` 并创建软连接 `ln -s $(pwd)/clash-linux-amd64-v1.17.0 /usr/bin/clash`

3、使用 `wget ./config.yaml [vpn的订阅链接]`

4、将`Country.mmdbcd` 和 `config.yaml` 放到 解压clash的路径下

5、修改脚本权限 `chmod 777 ./pre_start_serivce.sh start_service.sh stop_service.sh  post_stop_service.sh` 

6、复制服务启动及停止所需脚本到服务器上，并将`start_service.sh` 文件中的路径改为`Country.mmdbcd` 和 `config.yaml`所在路径

7、复制`clash.service`文件到 `/etc/systemd/system` 并对文件进行编辑，将服务启动、停止及恢复脚本所在的路径改到文件中

8、启动服务 `systemctl start clash`

9、使用 `curl https://www.google.com.hk/` 检验是否成功翻墙,输出一堆东西则成功,输出一行则失败

如果仍然不能访问，则手动执行一下 `source /etc/profile`

## docker 访问 vpn
``` shell
docker run -itd --network=host {image} bash
 
vim /etc/profile
export http_proxy=http://127.0.0.1:7890
export https_proxy=http://127.0.0.1:7890
#保存然后更新配置
source /etc/profile
```