# ImmortalWrt 云编译 - 京东云 RE-SP-01B (MT7621)

基于 GitHub Actions 自动编译 ImmortalWrt 固件，适配京东云 RE-SP-01B 路由器（MT7621 芯片）。

## 设备信息

- **芯片**: 联发科 MT7621AT（双核 880MHz）
- **内存**: 512MB DDR3
- **闪存**: 16MB SPI Flash
- **无线**: MT7615DN（2.4G + 5G 双频）
- **网口**: 1个WAN + 3个LAN（千兆）

## 已内置插件

| 插件 | 说明 |
|------|------|
| luci-app-store | iStore 软件中心（必须） |
| luci-theme-argon | Argon 主题 + 配置 |
| luci-app-samba4 | 局域网文件共享 |
| luci-app-aria2 | Aria2 下载工具 |
| luci-app-upnp | UPnP 端口映射 |
| luci-app-wol | 网络唤醒 |
| luci-app-ddns | 动态域名（支持阿里云/DNSPod） |
| luci-app-wireguard | WireGuard VPN |
| luci-app-turboacc | 网络加速（短转发/FastPath） |
| luci-app-netdata | 系统监控 |
| luci-app-diskman | 磁盘管理 |
| luci-app-mountd | 自动挂载 |

## 默认配置

- **局域网IP**：192.168.12.1（可在 diy-part2.sh 中修改）
- **主机名**: JDCloud-Router
- **时区**: Asia/Shanghai
- **root 密码**: 无（首次登录请设置）

## 使用方法

### 1. 触发编译

- 进入仓库的 **Actions** 标签页
- 选择 **Build iStoreOS** 工作流
- 点击 **Run workflow** 按钮手动触发
- 等待编译完成（约 60-90 分钟）

### 2. 下载固件

编译成功后：
- **Releases 页面**: 自动发布最新固件
- **Actions 运行页**: 底部 Artifacts 区域下载（需登录 GitHub）

固件文件名类似：
```
istoreos-ramips-mt7621-jdcloud_re-sp-01b-squashfs-sysupgrade.bin
istoreos-ramips-mt7621-jdcloud_re-sp-01b-squashfs-factory.bin
```

- `sysupgrade.bin`：从 OpenWrt/iStoreOS 系统内升级
- `factory.bin`：从原厂固件刷入

### 3. 刷入固件

1. 电脑用网线连接路由器 LAN 口
2. 浏览器进入路由器管理页面
3. 系统 → 备份/升级 → 选择固件 → 刷入
4. 等待重启完成（约 3-5 分钟）
5. 浏览器访问 `http://192.168.12.1`

## 自定义配置

### 修改插件列表

编辑 `configs/ramips.config`，添加或删除插件：

```bash
# 添加插件
CONFIG_PACKAGE_luci-app-xxx=y

# 移除插件（注释掉或改成 not set）
# CONFIG_PACKAGE_luci-app-xxx is not set
```

### 修改默认 IP / 主机名 / 时区

编辑 `diy-part2.sh`：

```bash
# 修改 LAN IP
sed -i 's/192.168.100.1/192.168.12.1/g' package/base-files/files/bin/config_generate

# 修改主机名
sed -i 's/ImmortalWrt/MyRouter/g' package/base-files/files/bin/config_generate
```

### 添加第三方软件源

编辑 `diy-part1.sh`，添加 feed 源：

```bash
echo 'src-git 源名称 https://github.com/xxx/xxx.git' >> feeds.conf.default
```

## 目录结构

```
.
├── .github/
│   └── workflows/
│       └── build.yml          # GitHub Actions 编译工作流
├── configs/
│   └── ramips.config          # MT7621 设备配置文件
├── diy-part1.sh               # 编译前脚本（添加软件源）
├── diy-part2.sh               # 配置后脚本（修改默认设置）
└── README.md                  # 说明文档
```

## 注意事项

1. MT7621 性能有限，**不建议开启 Docker**，内存不够用
2. 科学上网插件（PassWall/OpenClash）默认未开启，需要的话在 config 和 diy-part1.sh 中取消注释
3. GitHub Actions 免费额度：个人账号每月 2000 分钟，编译一次约 60-90 分钟
4. 刷固件有风险，请确保设备型号完全匹配，刷机过程中不要断电
5. 首次刷入建议保留配置不勾选，刷完后重新配置

## 参考链接

- [iStoreOS 官方源码](https://github.com/istoreos/istoreos)
- [iStoreOS 官方文档](https://doc.istoreos.com)
- [OpenWrt 硬件表 - 京东云 RE-SP-01B](https://openwrt.org/toh/start)
