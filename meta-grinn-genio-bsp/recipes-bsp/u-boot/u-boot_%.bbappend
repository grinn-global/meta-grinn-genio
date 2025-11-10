FILESEXTRAPATHS:prepend := "${THISDIR}/common:"
FILESEXTRAPATHS:prepend := "${THISDIR}/${MACHINE}:"

DTS_DIR = "${S}/arch/arm/dts"
DEFCONFIG_DIR = "${S}/configs"

SRC_COMMON += " \
    file://0001-arch-mediatek-adjust-memory-size-at-runtime.patch \
    file://0002-board-mt8390-8370-evk-enable-fixup-fdt-memory-at-run.patch \
    file://${MACHINE}.dts \
    file://${MACHINE}_defconfig \
"

SRC_URI += " \
    file://grinn-genio-som.dtsi \
"

SRC_URI:append:grinn-genio-700-evb = " \
    ${SRC_COMMON} \
"

SRC_URI:append:grinn-genio-sbc = " \
    ${SRC_COMMON} \
    file://grinn-genio-sbc.dtsi \
"

do_configure:prepend:grinn-genio-sbc() {
    cp ${WORKDIR}/grinn-genio-sbc.dtsi ${DTS_DIR}/grinn-genio-sbc.dtsi
}

do_configure:prepend() {
    cp ${WORKDIR}/grinn-genio-som.dtsi ${DTS_DIR}/grinn-genio-som.dtsi
}

do_configure:prepend:grinn-genio-700-evb() {
    cp ${WORKDIR}/${MACHINE}.dts ${DTS_DIR}/genio-700-evk.dts
    cp ${WORKDIR}/${MACHINE}_defconfig ${DEFCONFIG_DIR}/genio_700_evk_defconfig
}

do_configure:prepend:grinn-genio-700-sbc() {
    cp ${WORKDIR}/${MACHINE}.dts ${DTS_DIR}/genio-700-evk.dts
    cp ${WORKDIR}/${MACHINE}_defconfig ${DEFCONFIG_DIR}/genio_700_evk_defconfig
}

do_configure:prepend:grinn-genio-510-sbc() {
    cp ${WORKDIR}/${MACHINE}.dts ${DTS_DIR}/genio-510-evk.dts
    cp ${WORKDIR}/${MACHINE}_defconfig ${DEFCONFIG_DIR}/genio_510_evk_defconfig
}
