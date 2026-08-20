# meta-tensorflow master targets styhead+, where file:// lands in UNPACKDIR.
# scarthgap unpacks straight into WORKDIR and does not know UNPACKDIR at all.
UNPACKDIR = "${WORKDIR}"

# Add Python support for stable delegate
SRC_URI += "file://0001-add-python-support-for-stable-delegate.patch"

# The Python support patch was written for 2.16.1, so needs some adjustment to land on 2.17.0
python do_patch:prepend() {
    os.environ['QUILT_PATCH_OPTS'] = '--fuzz=3'
}

ERROR_QA:remove = "patch-fuzz"
WARN_QA:append = " patch-fuzz"

# Add GPU delegate to keep functionality available in the previous versions 
TF_TARGET_EXTRA += "tensorflow/lite/delegates/gpu:libtensorflowlite_gpu_delegate.so"

# Fix compile error caused by C++ version inconsistency between MediaTek's source and TensorFlow's build system
TF_ARGS_EXTRA += "--per_file_copt=tensorflow/lite/delegates/utils/neuron_stable_delegate/neuron_delegate_external.*@-std=c++20"

STABLE_DELEGATE_SETTINGS = "${S}/tensorflow/lite/delegates/utils/neuron_stable_delegate/settings.json"
STABLE_DELEGATE_UPSTREAM_PATH = "/usr/lib64/libtensorflowlite_mtk_neuron_delegate.so"

do_install:append() {
	install -d ${D}${libdir}
	install -d ${D}${datadir}/label_image

	install -m 644 ${S}/bazel-bin/tensorflow/lite/delegates/utils/experimental/stable_delegate/libdelegate_loader.a \
		${D}${libdir}
	install -m 644 ${S}/bazel-bin/tensorflow/lite/delegates/utils/experimental/stable_delegate/libtflite_settings_json_parser.a \
		${D}${libdir}
	install -m 644 ${S}/bazel-bin/tensorflow/lite/delegates/gpu/libtensorflowlite_gpu_delegate.so \
		${D}${libdir}/gpu_external_delegate.so

	grep -q "${STABLE_DELEGATE_UPSTREAM_PATH}" ${STABLE_DELEGATE_SETTINGS} || \
		bbfatal "stable delegate settings: '${STABLE_DELEGATE_UPSTREAM_PATH}' not found in ${STABLE_DELEGATE_SETTINGS}"
	sed "s|${STABLE_DELEGATE_UPSTREAM_PATH}|${libdir}/libneuron_stable_delegate.so|" ${STABLE_DELEGATE_SETTINGS} \
		> ${D}${datadir}/label_image/stable_delegate_settings.json
	chmod 644 ${D}${datadir}/label_image/stable_delegate_settings.json
}
