if test $1 == "su"
then
        sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
else
        if test $1 == "lab"
        then
                sed -i "s,\$(macaddr_random),\"fe:fd:a9:e0:1c:88\",g" target/linux/rockchip/armv8/base-files/etc/board.d/02_network
                sed -i 's/192.168.1.1/192.168.31.1/g' package/base-files/files/bin/config_generate
        fi
fi

if test $2 == "18"
then
        SEED="1806"
else
        if test $2 == "19"
        then
                SEED="snapshot"
        fi
fi
cp -f "${GITHUB_WORKSPACE}/configs/$SEED-config.seed" ".config"

# luci-app-ssrserver-python
# rm -rf package/lean/luci-app-ssrserver-python
# svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-ssrserver-python package/luci-app-ssrserver-python

# naiveproxy
# sed -i "/NaiveProxy/d" ".config"
# rm -rf package/ctcgfw/luci-app-naiveproxy
# rm -rf package/ctcgfw/naiveproxy
# # luci-app-ssr-plus
# sed -i "/ssr-plus/d" ".config"
# rm -rf package/lean/luci-app-ssr-plus

# ssr-libev-server
sed -i "/ssr-libev-server/d" ".config"

# softethervpn
sed -i "/softethervpn/d" ".config"

#递归DNS
sed -i "/unbound/d" ".config"

# openvpn
sed -i "/openvpn/d" ".config"
sed -i "/OPENVPN/d" ".config"
sed -i "/ocserv/d" ".config"
sed -i "/OCSERV/d" ".config"

# oled
sed -i "/oled/d" ".config"

# nps
sed -i "/nps/d" ".config"

# 迅雷
sed -i "/xlnetacc/d" ".config"

# 没用
sed -i "/mentohust/d" ".config"

# gost
sed -i "/gost/d" ".config"
sed -i "/GOST/d" ".config"

# luci-app-udpxy
sed -i "/udpxy/d" ".config"

# luci-app-frps
sed -i "/frps/d" ".config"

# luci-app-v2ray-server
sed -i "/v2ray-server/d" ".config"

# 网络驱动器
sed -i "/cifs/d" ".config"

# luci-app-haproxy
sed -i "/luci-app-haproxy/d" ".config"
sed -i "/luci-i18n-haproxy/d" ".config"

# 多拨
sed -i "/mwan3helper/d" ".config"
rm -rf feeds/luci/applications/luci-app-mwan3
rm -rf package/lean/luci-app-mwan3helper
sed -i "/syncdial/d" ".config"
rm -rf package/lean/luci-app-syncdial

# 访问时间控制
rm -rf package/lean/luci-app-accesscontrol

# luci-app-adguardhome
sed -i "/AdGuardHome/d" ".config"
sed -i "/adguardhome/d" ".config"
rm -rf package/ctcgfw/luci-app-adguardhome

# luci-app-adbyby-plus
rm -rf package/lean/luci-app-adbyby-plus

# FTP
rm -rf package/lean/luci-app-vsftpd

# luci-app-seu-net
git clone https://github.com/quzard/luci-app-seu-net.git package/luci-app-seu-net

# sub-web
rm -rf package/ctcgfw/sub-web
git clone https://github.com/quzard/openwrt-sub-web.git package/openwrt-sub-web

echo '
CONFIG_PACKAGE_subconverter=y
CONFIG_PACKAGE_sub-web=y
CONFIG_PACKAGE_subweb=y
CONFIG_PACKAGE_luci-app-seu-net=y
CONFIG_PACKAGE_luci-app-ssrserver-python=y
# CONFIG_PACKAGE_luci-app-vssr=y
' >> ".config"