FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:grinn-genio-510-700-sbc = " file://usbgadget.conf"
SRC_URI:append:grinn-genio-700-evb = " file://usbgadget.conf"

do_install:append () {
    if [ -f ${WORKDIR}/usbgadget.conf ]; then
        install -m 0644 ${WORKDIR}/usbgadget.conf ${D}${sysconfdir}/usbgadget.conf
    fi
}
