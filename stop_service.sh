#!/bin/bash

# 使用 pgrep 命令查找包含 "clash" 关键字的进程 ID
pids=$(pgrep -f "clash")

# 判断是否找到匹配的进程
if [ -n "$pids" ]; then
    # 循环遍历进程 ID 并杀死对应进程
    for pid in $pids; do
        kill "$pid"
    done
    echo "已杀死进程"
else
    echo "未找到匹配的进程"
fi

