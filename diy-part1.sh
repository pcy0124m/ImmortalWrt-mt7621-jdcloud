#!/bin/bash
# ============================================================
# diy-part1.sh - 编译前自定义脚本
# 作用：添加第三方软件源、克隆额外插件
# ============================================================

# 进入 OpenWrt 源码目录
cd openwrt

# ---------- 添加 Argon 主题源 ----------
echo 'src-git argon https://github.com/jerrykuku/luci-theme-argon.git' >> feeds.conf.default

# ---------- 添加 Turbo ACC 网络加速源 ----------
echo 'src-git turboacc https://github.com/chenmozhijin/turboacc.git' >> feeds.conf.default

# ---------- OpenAppFilter 应用过滤（含内核模块，需编译进固件） ----------
git clone --depth 1 https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter

# ---------- （可选）添加 PassWall 源，需要的话取消注释 ----------
# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall.git' >> feeds.conf.default
# echo 'src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git' >> feeds.conf.default
# echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git' >> feeds.conf.default

# ---------- （可选）添加 OpenClash 源，需要的话取消注释 ----------
# echo 'src-git openclash https://github.com/vernesong/OpenClash.git' >> feeds.conf.default

# ---------- （可选）克隆单个插件到 package 目录 ----------
# git clone https://github.com/xxx/luci-app-xxx.git package/luci-app-xxx

echo "===== diy-part1.sh 执行完成 ====="
