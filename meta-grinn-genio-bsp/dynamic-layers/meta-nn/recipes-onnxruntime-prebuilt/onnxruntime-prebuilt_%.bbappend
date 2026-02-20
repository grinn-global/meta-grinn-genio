do_install:append() {
    if [ -d ${D}${includedir}/onnxruntime/core/session ]; then
        find ${D}${includedir}/onnxruntime/core/session -name "*.h" -exec cp --preserve=mode,timestamps {} ${D}${includedir}/ \;
    fi
}

PROVIDES += "libonnxruntime"
RPROVIDES:${PN} += "libonnxruntime"
