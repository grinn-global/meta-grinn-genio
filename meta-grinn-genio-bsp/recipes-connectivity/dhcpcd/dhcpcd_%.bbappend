FILESEXTRAPATHS:prepend := "${THISDIR}/dhcpcd:"

SRC_URI += "file://deny-interfaces.conf"

do_install:append() {
    cat ${WORKDIR}/deny-interfaces.conf >> ${D}${sysconfdir}/dhcpcd.conf
}
