FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
    file://localversion_off.cfg \
    file://0001-pmdomain-core-add-dummy-release-function-to-genpd-device.patch \
"
