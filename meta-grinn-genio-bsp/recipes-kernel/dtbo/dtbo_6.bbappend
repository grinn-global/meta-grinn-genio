FILESEXTRAPATHS:prepend:grinn-genio-360-360p-sbc := "${THISDIR}/grinn-genio-360-360p-sbc:"
FILESEXTRAPATHS:prepend:grinn-genio-510-700-sbc := "${THISDIR}/grinn-genio-510-700-sbc:"

SRC_URI:append:grinn-genio-360-360p-sbc = " \
        file://display-dp.dts \
"

SRC_URI:append:grinn-genio-510-700-sbc = " \
        file://audio-sof.dts \
        file://isp71.dtsi \
        file://mtk-camera.dtsi \
        file://camera-imx214-csi0.dts \
        file://camera-imx214-csi1.dts \
        file://camera-imx214-csi0-imx214-csi1.dts \
        file://display-hdmi.dts \
        file://display-dp.dts \
        file://camera-common.dtsi \
        file://wifi-bt-sdio-murata-1zm.dts \
"
