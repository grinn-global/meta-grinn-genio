SUMMARY = "Blacklist btnxpuart autoload and start it later with systemd"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = " \
    file://btnxpuart-blacklist.conf \
    file://btnxpuart-load.service \
"

S = "${WORKDIR}"

inherit systemd

do_install() {
    install -d ${D}${sysconfdir}/modprobe.d
    install -m 0644 ${WORKDIR}/btnxpuart-blacklist.conf \
        ${D}${sysconfdir}/modprobe.d/

    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/btnxpuart-load.service \
        ${D}${systemd_system_unitdir}/
}

FILES:${PN} += " \
    ${sysconfdir}/modprobe.d/btnxpuart-blacklist.conf \
    ${systemd_system_unitdir}/btnxpuart-load.service \
"

SYSTEMD_SERVICE:${PN} = "btnxpuart-load.service"
SYSTEMD_AUTO_ENABLE:${PN} = "enable"

RDEPENDS:${PN} += "kernel-module-btnxpuart"
