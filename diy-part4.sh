#!/bin/bash
# 在 feeds 安装后、生成配置前执行

# 改默认 LAN IP（默认 192.168.1.1，这里改成 192.168.31.1，按需改）
# sed -i 's/192.168.1.1/192.168.12.1/g' package/base-files/files/bin/config_generate

# 关闭 IPv6（不需要可注释掉）
# sed -i 's/ip6assign/#ip6assign/g' package/network/config/network/files/network.config 2>/dev/null || true
