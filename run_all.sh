#!/bin/bash

# 创建/清空汇总文件
> total.out

# 遍历所有.out文件
for outfile in A35R_cdrall_3-15_*.out; do
    # 提取基础文件名（不带扩展名）
    base_name="${outfile%.out}"
    
    # 提取第六行第七列数值
    value=$(sed -n "6p" "$outfile" | awk '{print $7}')
    
    # 将结果写入汇总文件
    echo "${base_name}=${value}" >> total.out
    
    # 可选进度显示
    echo "已处理：$outfile → 提取值：$value"
done

echo "所有数据已汇总至 total.out"