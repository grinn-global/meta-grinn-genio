FILESEXTRAPATHS:prepend:grinn-genio-360-360p-sbc := "${THISDIR}/grinn-genio-360-360p:"
FILESEXTRAPATHS:prepend:grinn-genio-510-700-sbc := "${THISDIR}/grinn-genio-510-700:"
FILESEXTRAPATHS:prepend:grinn-genio-som := "${THISDIR}/grinn-genio-som:"
DT_DIR = "git/arch/arm/dts"

SRC_URI:append:grinn-genio-som = " \
    file://0001-misc-add-MediaTek-eFuse-driver.patch \
    file://efuse-mac.cfg \
"
SRC_URI:append:grinn-genio-360-360p-som = " \
    file://grinn-genio-360-360p-som.dtsi;subdir=${DT_DIR} \
"
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
    file://devicetrees-${MACHINE}.cfg \
"
SRC_URI:append:grinn-genio-360-360p-sbc = " \
    file://grinn-genio-360-360p-sbc.dtsi;subdir=${DT_DIR} \
    file://0001-phy-increase-default-phy-autoneg-timeout.patch \
    file://0002-board-mt8366-evk-report-the-Grinn-board-name.patch \
    file://random_ethaddr.cfg \
"
SRC_URI:append:grinn-genio-510-700-sbc = " \
    file://grinn-genio-510-700-sbc.dtsi;subdir=${DT_DIR} \
"
