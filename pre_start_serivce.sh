#!/bin/bash

# 指定需要查找和修改的文件路径
file_path="/etc/profile"

# 判断文件中是否包含 http://127.0.0.1:7890
if grep -q "http://127.0.0.1:7890" "$file_path"; then
    # 如果存在，则判断是否被注释
    if grep -q "#.*http://127.0.0.1:7890" "$file_path"; then
        # 如果被注释，则取消注释
        sed -i 's/^#\(.*http:\/\/127\.0\.0\.1:7890\)/\1/' "$file_path"
        echo "已取消注释"
    else
        echo "已存在且未被注释"
    fi
else
    # 如果不存在，则添加 http://127.0.0.1:7890
    echo "export http_proxy=http://127.0.0.1:7890" >> "$file_path"
    echo "export https_proxy=http://127.0.0.1:7890" >> "$file_path"
    echo "已添加"
fi
source /etc/profile
