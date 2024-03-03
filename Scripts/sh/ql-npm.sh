#!/bin/bash  
###
 # @Author: yanyuwangluo 1915241107@qq.com
 # @Date: 2024-03-03 09:18:39
 # @LastEditors: yanyuwangluo 1915241107@qq.com
 # @LastEditTime: 2024-03-03 09:29:20
 # @FilePath: \青龙shell\ql-npm.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
### 
#修复青龙npm源失效
echo "修复青龙Npm源失效"
echo "烟雨阁"

# 定义四个地址选项及其备注  
options=(  
  "1. npm 官方源 - https://registry.npmjs.org/"  
  "2. 淘宝源 - https://registry.npmmirror.com/"  
  "3. cnpm源 - https://r.cnpmjs.org/"  
  "4. GitHub源 - https://npm.pkg.github.com/"  
)  
  
# 显示选项菜单  
echo "请选择要使用的 NPM 地址:"  
for option in "${options[@]}"; do  
  echo "$option"  
done  
  
# 读取用户输入  
read -p "请输入序号（1-4）: " choice  
  
# 检查输入是否有效  
if ! [[ $choice =~ ^[1-4]$ ]]; then  
  echo "输入无效，请输入1-4之间的数字。"  
  exit 1  
fi  
  
# 提取用户选择的地址  
selected_address=$(echo "${options[$choice-1]}" | awk -F'-' '{print $2}')  
  
# 写入到.npmrc文件中  
echo "registry=$selected_address" >> ~/.npmrc  
  
echo "已将地址写入到~/.npmrc文件中。"