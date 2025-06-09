# Copyright (C) 2025 Grinn sp. z o.o.
# Released under the MIT license (see COPYING.MIT for the terms)

FILESEXTRAPATHS:prepend := "${THISDIR}/common:"
FILESEXTRAPATHS:prepend:grinn-genio-sbc := "${THISDIR}/grinn-genio-sbc:"

SRC_URI:append:grinn-genio-sbc = "                \
	file://mtk-camera.dtsi                    \
	file://isp71.dtsi                         \
	file://camera-common.dtsi                 \
	file://camera-imx214-csi0.dts             \
	file://camera-imx214-csi1.dts             \
	file://camera-imx214-csi0-imx214-csi1.dts \
"
