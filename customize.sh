#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm 
#=================================================
#1. Modify default IP
sed -i 's/192.168.1.1/192.168.8.1/g' openwrt/package/base-files/files/bin/config_generate

#2. Clear the login password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' openwrt/package/lean/default-settings/files/zzz-default-settings

#3. 360v6 wireless config file.
rm openwrt/package/firmware/ath11k-firmware/files/board-2.bin.IPQ6018
cp bin/board-2.bin.360v6 openwrt/package/firmware/ath11k-firmware/files/board-2.bin.IPQ6018
