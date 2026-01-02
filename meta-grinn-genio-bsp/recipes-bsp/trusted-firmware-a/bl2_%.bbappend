FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:grinn-genio-510-700-som = " \
	file://0001-plat-mediatek-use-libdram-to-pass-actual-memory-size.patch \
"
