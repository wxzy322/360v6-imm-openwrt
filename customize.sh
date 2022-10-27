#!/bin/bash

# 修改 lan IP
sed -i 's/192.168.1.1/192.168.8.1/g' openwrt/package/base-files/files/bin/config_generate

# 修改主机名
sed -i 's/OpenWrt/chainsx-bee/g' openwrt/package/base-files/files/bin/config_generate

# 修改时区
sed -i 's/UTC/Asia\/Shanghai/g' openwrt/package/base-files/files/bin/config_generate

# 修改luci配置
echo "
config core 'main'
        option resourcebase '/luci-static/resources'
        option lang 'zh_cn'
        option mediaurlbase '/luci-static/argon'

config extern 'flash_keep'
        option uci '/etc/config/'
        option dropbear '/etc/dropbear/'
        option openvpn '/etc/openvpn/'
        option passwd '/etc/passwd'
        option opkg '/etc/opkg.conf'
        option firewall '/etc/firewall.user'
        option uploads '/lib/uci/upload/'

config internal 'languages'
        option zh_cn '简体中文 (Simplified Chinese)'

config internal 'sauth'
        option sessionpath '/tmp/luci-sessions'
        option sessiontime '3600'

config internal 'ccache'
        option enable '1'

config internal 'themes'
        option Argon '/luci-static/argon'
        option Bootstrap '/luci-static/bootstrap'

config internal 'diag'
        option dns 'openwrt.org'
        option ping 'openwrt.org'
        option route 'openwrt.org'
" > openwrt/extra/luci/modules/luci-base/root/etc/config/luci

# 修改连接数
sed -i 's/16384/65535/g' openwrt/package/kernel/linux/files/sysctl-nf-conntrack.conf

# 修改 SSID
sed -i 's/OpenWrt/chainsx-bee/g' openwrt/package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改 wifi 地区
sed -i 's/US/CN/g' openwrt/package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 360v6 无线配置文件
rm openwrt/package/firmware/ath11k-firmware/files/board-2.bin.IPQ6018
cp bin/board-2.bin openwrt/package/firmware/ath11k-firmware/files/board-2.bin.IPQ6018
