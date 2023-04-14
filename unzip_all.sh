#!/bin/bash

# 获取当前目录
current_dir=$(pwd)

# 设置环境变量，以便正确处理中文文件名
export LANG=en_US.UTF-8

# 遍历当前目录下的所有文件
for file in "$current_dir"/*; do
  # 检查文件是否是.zip或.tar.gz格式的压缩文件
  if [[ $file == *.zip ]]; then
    # 解压.zip文件到当前目录，并使用iconv命令确保文件名编码为UTF-8
    7z x -o"$current_dir" "$file"
  elif [[ $file == *.tar.gz ]]; then
    # 解压.tar.gz文件到当前目录
    tar -xzf "$file" --directory "$current_dir"
  fi
done