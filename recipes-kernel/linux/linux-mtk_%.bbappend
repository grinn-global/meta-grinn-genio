FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

DT_NAME = "grinn-genio-700-evb"
DT_DIR = "${S}/arch/arm64/boot/dts/mediatek"

SRC_URI += " \
    file://0001-mtk_dp-add-support-for-direct-display-port-interface.patch \
	file://fragment.cfg \
	file://${DT_NAME}.dts \
"

do_compile:prepend() {
	cp ${WORKDIR}/${DT_NAME}.dts ${DT_DIR}/
}

