FILESEXTRAPATHS:prepend := "${THISDIR}/common:${THISDIR}/${MACHINE}:"
DT_DIR = "git/arch/arm/dts"

SRC_URI:append:grinn-genio-510-700-som = " \
    file://grinn-genio-510-700-som.dtsi;subdir=${DT_DIR} \
    file://0001-arch-mediatek-adjust-memory-size-at-runtime.patch \
    file://0002-board-mt8390-8370-evk-enable-fixup-fdt-memory-at-run.patch \
    file://0003-phy-increase-default-phy-autoneg-timeout.patch \
    file://dynamic-ram.cfg \
    file://random_ethaddr.cfg \
"
SRC_URI:append:grinn-genio-platform = " \
    file://${MACHINE}.dts;subdir=${DT_DIR} \
    file://devicetrees.cfg \
"
SRC_URI:append:grinn-genio-510-700-sbc = " \
    file://grinn-genio-510-700-sbc.dtsi;subdir=${DT_DIR} \
"
