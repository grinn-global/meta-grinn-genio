FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

DT_NAME = "${MACHINE}"
DT_DIR = "${S}/arch/arm64/boot/dts/mediatek"

SRC_URI += " \
    file://0001-mtk_dp-add-support-for-direct-display-port-interface.patch        \
    file://grinn-genio.cfg                                                        \
    file://grinn-genio-700-som.dtsi                                               \
    file://grinn-genio-510-som.dtsi                                               \
"

SRC_URI:append:grinn-genio-700-evb = " \
    file://grinn-genio-700-evb.dts     \
"

SRC_URI:append:grinn-genio-sbc = " \
    file://grinn-genio-sbc.dtsi    \
"

SRC_URI:append:grinn-genio-700-sbc = " \
    file://grinn-genio-700-sbc.dts     \
"

SRC_URI:append:grinn-genio-510-sbc = " \
    file://grinn-genio-510-sbc.dts     \
"

do_compile:prepend:grinn-genio-sbc() {
     cp ${WORKDIR}/grinn-genio-sbc.dtsi ${DT_DIR}/
}

do_compile:prepend() {
    cp ${WORKDIR}/grinn-genio-700-som.dtsi ${DT_DIR}/
    cp ${WORKDIR}/grinn-genio-510-som.dtsi ${DT_DIR}/
    cp ${WORKDIR}/${DT_NAME}.dts ${DT_DIR}/
}

