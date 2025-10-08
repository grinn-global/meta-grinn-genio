FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
	file://0001-arch-mediatek-adjust-memory-size-at-runtime.patch \
	file://0002-board-mt8390-8370-evk-enable-fixup-fdt-memory-at-run.patch \
"
