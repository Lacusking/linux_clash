#!/bin/bash

# 指定需要查找和修改的文件路径
file_path="/etc/profile"

# 使用 sed 命令将文件中包含 http://127.0.0.1:7890 的行注释掉
sed -i '/http:\/\/127.0.0.1:7890/ s/^/#/' "$file_path"

echo "注释完成"

source /etc/profile
