#!/bin/bash
# ============================================================
# diy-part2.sh - 配置后自定义脚本
# 作用：修改默认 IP、主机名、时区、WiFi 等
# ============================================================

cd openwrt

# ---------- 修改默认 LAN IP ----------
# iStoreOS 默认一般是 192.168.100.1，这里改成 192.168.12.1
# 不需要改的话注释掉下面这行
sed -i 's/192.168.100.1/192.168.12.1/g' package/base-files/files/bin/config_generate

# ---------- 修改默认主机名 ----------
sed -i 's/IStoreOS/JDCloud-Router/g' package/base-files/files/bin/config_generate

# ---------- 修改默认时区为上海 ----------
sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

# ---------- 修改默认 WiFi 名称和密码（可选） ----------
# 注意：MT7621 的 WiFi 配置可能在别的文件里，以下是通用写法
# sed -i 's/ssid=OpenWrt/ssid=MyWiFi/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
# sed -i 's/encryption=none/encryption=psk2/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
# sed -i '/set wireless.default_radio${devidx}.encryption=psk2/a\set wireless.default_radio${devidx}.key=你的WiFi密码' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# ---------- 开启 WiFi（默认是关闭的） ----------
# sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# ---------- 修改 root 默认密码（可选，默认无密码） ----------
# 将下面的密码哈希替换为你想要的密码（使用 openssl passwd -1 生成）
# sed -i 's/root::0:0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g' package/base-files/files/etc/shadow

# ---------- 移除不需要的默认包（减小固件体积） ----------
# sed -i 's/CONFIG_PACKAGE_luci-app-firewall=y/# CONFIG_PACKAGE_luci-app-firewall is not set/g' .config

echo "===== diy-part2.sh 执行完成 ====="
