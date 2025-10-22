FILESEXTRAPATHS:prepend := "${THISDIR}/common:${THISDIR}/${MACHINE}:"
DT_DIR = "${S}/arch/arm64/boot/dts/mediatek"

SRC_URI += " \
	file://grinn-genio-som.dtsi \
"

SRC_URI:append:grinn-genio-700-evb = " \
	file://0001-mtk_dp-add-support-for-direct-display-port-interface.patch \
	file://eth.cfg \
	file://${MACHINE}.dts \
"

SRC_URI:append:grinn-genio-sbc = " \
	file://0001-mtk_dp-add-support-for-direct-display-port-interface.patch \
	file://eth.cfg \
	file://grinn-genio-sbc.dtsi \
	file://${MACHINE}.dts \
"

do_configure:prepend() {
	cp ${WORKDIR}/grinn-genio-som.dtsi ${DT_DIR}/
}

do_configure:append:grinn-genio-sbc() {
	cp ${WORKDIR}/grinn-genio-sbc.dtsi ${DT_DIR}/
	cp ${WORKDIR}/${MACHINE}.dts ${DT_DIR}/
}

do_configure:append:grinn-genio-700-evb() {
	cp ${WORKDIR}/${MACHINE}.dts ${DT_DIR}/
}
