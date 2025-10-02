FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

TFA_BUILD_TARGET += "bl2"

SRC_URI += " \
	file://0001-plat-mediatek-use-libdram-to-pass-actual-memory-size.patch \
"

deltask do_gen_bl2_img

do_gen_bl2_img() {
	media="emmc"
	if [ "${@bb.utils.contains('MACHINE_FEATURES', 'ufs-boot', 'ufs-boot', '', d)}" = "ufs-boot" ]; then
		media="ufs"
	fi

	if [ "${@bb.utils.contains('MACHINE_FEATURES', 'nor-boot', 'nor-boot', '', d)}" = "nor-boot" ]; then
		media="nor"
	fi

	if [ "${@oe.utils.conditional('BL2_SIGN_ENABLE', '1', '1', '', d)}" = "1" ]; then
		cp ${B}/mt8188/release/bl2.bin ${B}/bl2.img
		python3 -m sign-image_v2.pbp \
				-i ${RECIPE_SYSROOT}/${sysconfdir}/secure/key.ini \
				-g ${RECIPE_SYSROOT}/${sysconfdir}/secure/pl_gfh_config_pss.ini \
				-func sign -o ${B}/bl2.img ${B}/bl2.img ${SIGN_EN_ARGS}
		python3 -m secure_chip_tools.dev-info-hdr-tool $media ${B}/bl2.img ${B}/bl2.img
		python3 -m sign-image_v2.pbp \
				-j ${RECIPE_SYSROOT}/${sysconfdir}/secure/sbc.pem -func keyhash_pss -o ${DEPLOYDIR}/secure/keyhash ${SIGN_EN_ARGS}
        else
		cp ${B}/mt8188/release/bl2.bin ${B}/bl2.img.tmp
		truncate -s%4 ${B}/bl2.img.tmp
		uboot-mkimage -T mtk_image -a 0x201000 -e 0x201000 -n "media=$media;arm64=1" \
				-d ${B}/bl2.img.tmp ${B}/bl2.img
	fi
}

python() {
    bb.build.addtask('do_gen_bl2_img', 'do_install', 'do_compile', d)
}
