FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
	file://0001-arch-arm-genio-700-evk-change-RAM-size-to-4-GB.patch \
	file://0002-arch-mediatek-adjust-memory-size-at-runtime.patch \
	file://0003-board-mt8390-8370-evk-enable-fixup-fdt-memory-at-run.patch \
"
