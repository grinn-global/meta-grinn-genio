FILESEXTRAPATHS:prepend := "${THISDIR}/common:${THISDIR}/${MACHINE}:"
DT_DIR = "git/arch/arm64/boot/dts/mediatek"

SRC_URI:append:grinn-genio-510-700-som = " \ 
    file://grinn-genio-510-700-som.dtsi;subdir=${DT_DIR} \
"
SRC_URI:append:grinn-genio-platform = " \
    file://${MACHINE}.dts;subdir=${DT_DIR} \
"
SRC_URI:append:grinn-genio-510-700-sbc = " \
    file://grinn-genio-510-700-sbc.dtsi;subdir=${DT_DIR} \
    file://0001-mtk_dp-add-support-for-direct-display-port-interface.patch \
    file://eth.cfg \
"
SRC_URI:append:grinn-genio-700-evb = " \
    file://0001-mtk_dp-add-support-for-direct-display-port-interface.patch \
    file://eth.cfg \
    file://wwan.cfg \
"
