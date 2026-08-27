#!/bin/bash
# ===== 在 feeds 更新前执行 =====

# --- 科学上网：OpenClash ---
echo 'src-git openclash https://github.com/vernesong/OpenClash.git' >> feeds.conf.default

# --- Argon 主题（含主题配置插件）---
echo 'src-git argon https://github.com/jerrykuku/luci-theme-argon.git' >> feeds.conf.default
sed -i '1i src-git argon https://github.com/jerrykuku/luci-theme-argon.git' feeds.conf.default
