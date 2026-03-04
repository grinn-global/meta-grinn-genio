SUMMARY = "Wi-Fi firmware redistributed by NXP"
DESCRIPTION = "Additional Wi-Fi firmware redistributed by NXP, \
which is not covered by linux-firmware package. Once package becomes \
available as a part of linux-firmware - it can be dropped from this \
recipe in favor of upstream."

SECTION = "kernel"
LICENSE = "Proprietary"
LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ca53281cc0caa7e320d4945a896fb837"

SRC_URI = "git://github.com/nxp-imx/imx-firmware.git;protocol=https;branch=${SRCBRANCH}"
SRCBRANCH = "lf-6.6.52_2.2.0"
SRCREV = "2978f3c88d6bcc5695a7b45f1936f18d31eebfa8"

S = "${WORKDIR}/git"

inherit allarch

CLEANBROKEN = "1"
ALLOW_EMPTY:${PN} = "1"

do_compile() {
	:
}

do_install() {
    install -d ${D}${sysconfdir}/firmware

    # Install NXP Connectivity common
    install -d ${D}${nonarch_base_libdir}/firmware/nxp
    install -d ${D}${nonarch_base_libdir}/firmware/mrvl
    install -m 0644 nxp/wifi_mod_para.conf ${D}${nonarch_base_libdir}/firmware/nxp
    install -m 0644 nxp/wifi_mod_para.conf ${D}${nonarch_base_libdir}/firmware/mrvl

    # Install NXP Connectivity SDIO8987 firmware
    install -m 0644 nxp/FwImage_8987/ed_mac_ctrl_V3_8987.conf  ${D}${nonarch_base_libdir}/firmware/nxp
    install -m 0644 nxp/FwImage_8987/sdiouart8987_combo_v0.bin ${D}${nonarch_base_libdir}/firmware/nxp
    install -m 0644 nxp/FwImage_8987/txpwrlimit_cfg_8987.conf  ${D}${nonarch_base_libdir}/firmware/nxp
    install -m 0644 nxp/FwImage_8987/ed_mac_ctrl_V3_8987.conf  ${D}${nonarch_base_libdir}/firmware/mrvl
    install -m 0644 nxp/FwImage_8987/sdiouart8987_combo_v0.bin ${D}${nonarch_base_libdir}/firmware/mrvl/sd8987_uapsta.bin
    install -m 0644 nxp/FwImage_8987/txpwrlimit_cfg_8987.conf  ${D}${nonarch_base_libdir}/firmware/mrvl
}

PACKAGES =+ " \
    ${PN}-nxp-common \
    ${PN}-nxp8987-sdio \
"

FILES:${PN}-nxp-common = " \
    ${nonarch_base_libdir}/firmware/nxp/wifi_mod_para.conf \
"

FILES:${PN}-nxp8987-sdio = " \
    ${nonarch_base_libdir}/firmware/nxp/*8987* \
    ${nonarch_base_libdir}/firmware/mrvl/sd8987_uapsta.bin \
    ${nonarch_base_libdir}/firmware/mrvl/ed_mac_ctrl_V3_8987.conf \
    ${nonarch_base_libdir}/firmware/mrvl/txpwrlimit_cfg_8987.conf \
    ${nonarch_base_libdir}/firmware/mrvl/wifi_mod_para.conf \
"
RDEPENDS:${PN}-nxp8987-sdio += "${PN}-nxp-common"
