FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

DT_NAME = "${MACHINE}"
DT_DIR = "${S}/arch/arm64/boot/dts/mediatek"

SRC_URI += " \
    file://0001-mtk_dp-add-support-for-direct-display-port-interface.patch        \
    file://0002-libbpf-add-libbpf_deprecated_since-macro-for-scheduling-api.patch \
    file://0003-libbpf-make-libbpf_version.h-non-auto-generated.patch             \
    file://0004-tools-resolve_btfids-install-libbpf-headers-when-building.patch   \
    file://0005-tools-resolve_btfids-upport-cross-building-the-kernel-with.patch  \
    file://0006-tools-resolve_btfids-build-with-host-flags.patch                  \
    file://0007-tools-resolve_btfids-use-pkg-config-to-locate-libelf.patch        \
    file://fragment.cfg                                                           \
    file://grinn-genio-700-som.dtsi                                               \
"

SRC_URI:append:grinn-genio-700-evb = " \
    file://grinn-genio-700-evb.dts     \
"

SRC_URI:append:grinn-genioboard = " \
    file://grinn-genioboard.dts     \
"

do_compile:prepend() {
    cp ${WORKDIR}/grinn-genio-700-som.dtsi ${DT_DIR}/
    cp ${WORKDIR}/${DT_NAME}.dts ${DT_DIR}/
}

