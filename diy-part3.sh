#!/bin/bash
# 在 feeds 更新前执行。默认全部注释，需要时去掉 # 即可。
# ⚠️ 25.12 已换 apk，第三方源是否适配需自行确认，加了不兼容的源会编译失败

# 科学上网（PassWall，第三方源）
# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall.git' >> feeds.conf.default
# echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git' >> feeds.conf.default

# 或 OpenClash（第三方源）
# echo 'src-git openclash https://github.com/vernesong/OpenClash.git' >> feeds.conf.default
