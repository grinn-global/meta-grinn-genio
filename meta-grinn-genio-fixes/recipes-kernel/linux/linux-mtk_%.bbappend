FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://0001-libbpf-add-libbpf_deprecated_since-macro-for-scheduling-api.patch \
    file://0002-libbpf-make-libbpf_version.h-non-auto-generated.patch             \
    file://0003-tools-resolve_btfids-install-libbpf-headers-when-building.patch   \
    file://0004-tools-resolve_btfids-upport-cross-building-the-kernel-with.patch  \
    file://0005-tools-resolve_btfids-build-with-host-flags.patch                  \
    file://0006-tools-resolve_btfids-use-pkg-config-to-locate-libelf.patch        \
"
