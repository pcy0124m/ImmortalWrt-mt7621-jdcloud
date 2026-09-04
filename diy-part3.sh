#!/bin/bash
# ===== 在 feeds 更新前执行 =====

# --- 科学上网：OpenClash ---
echo 'src-git openclash https://github.com/vernesong/OpenClash.git' >> feeds.conf.default

# --- Argon 主题（含主题配置插件）---
echo 'src-git argon https://github.com/jerrykuku/luci-theme-argon.git' >> feeds.conf.default

# --- OpenAppFilter 应用过滤（含内核模块，需编译进固件）---
git clone --depth 1 https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
