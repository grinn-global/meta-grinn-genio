MACHINEOVERRIDES =. "grinn-genio-platform:"

KERNEL_DEVICETREE = "mediatek/${MACHINE}.dtb"

IMAGE_FSTYPES:append = " aiotflash.tar.zst aiotflash.tar.zst.sha256sum tar.zst"

do_image_aiotflash[depends] += "virtual/dtb:do_deploy"
EXTRA_IMAGEDEPENDS += "virtual/dtb"
IMAGE_CMD:aiotflash:append () {
    cp -a ${DEPLOY_DIR_IMAGE}/devicetree ${tmp_pack_dir}/
}

IMAGE_CMD:aiotflash:append () {
    rm -v -f ${tmp_pack_dir}/partitions.json
    cp -v -L ${tmp_pack_dir}/rity.json ${tmp_pack_dir}/partitions.json
}

IMAGE_CMD:aiotflash:append () {
    cp -v -L ${DEPLOY_DIR_IMAGE}/fw_env.config ${tmp_pack_dir}/
}
