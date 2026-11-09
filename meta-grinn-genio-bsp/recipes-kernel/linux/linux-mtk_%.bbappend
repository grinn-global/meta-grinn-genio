FILESEXTRAPATHS:prepend:grinn-genio-360-360p-sbc := "${THISDIR}/grinn-genio-360-360p:"
FILESEXTRAPATHS:prepend:grinn-genio-510-700-sbc := "${THISDIR}/grinn-genio-510-700:"
DT_DIR = "git/arch/arm64/boot/dts/mediatek"

SRC_URI:append:grinn-genio-360-360p-som = " \
    file://grinn-genio-360-360p-som.dtsi;subdir=${DT_DIR} \
"
SRC_URI:append:grinn-genio-510-700-som = " \ 
    file://grinn-genio-510-700-som.dtsi;subdir=${DT_DIR} \
"
SRC_URI:append:grinn-genio-360-360p-sbc = " \
    file://grinn-genio-360-360p-sbc.dtsi;subdir=${DT_DIR} \
    file://grinn-genio-360-sbc.dts;subdir=${DT_DIR} \
    file://grinn-genio-360p-sbc.dts;subdir=${DT_DIR} \
    file://0001-PCI-mediatek-gen3-allow-PERST-to-be-driven-from-a-GPIO.patch \
    file://eth.cfg \
    file://pcie-aspm.cfg \
"
SRC_URI:append:grinn-genio-510-700-sbc = " \
    file://${MACHINE}.dts;subdir=${DT_DIR} \
    file://grinn-genio-510-700-sbc.dtsi;subdir=${DT_DIR} \
    file://0001-mtk_dp-add-support-for-direct-display-port-interface.patch \
    file://eth.cfg \
"
