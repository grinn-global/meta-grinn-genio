IMAGE_FSTYPES = "wic.img aiotflash.tar.xz aiotflash.tar.xz.sha256sum"

#
# Use fast compression by default to reduce image assembly time.
# For releases where size is important it can be changed to Yocto default "-9"
#

XZ_COMPRESSION_LEVEL ?= "-3"


#
# Add devicetree directory to aiotflash.tar
#

do_image_aiotflash[depends] += "virtual/dtb:do_deploy"

EXTRA_IMAGEDEPENDS += "virtual/dtb"

IMAGE_CMD:aiotflash:append () {
    cp -a ${DEPLOY_DIR_IMAGE}/devicetree ${tmp_pack_dir}/
}

#
# Replace symlink with copy (to solve permissions problem with symlinks on Windows)
# NOTE: rity.json is enough for genio-flash and partitions.json is
#       kept only for compatibility
#

IMAGE_CMD:aiotflash:append () {
    rm -v -f ${tmp_pack_dir}/partitions.json
    cp -v -L ${tmp_pack_dir}/rity.json ${tmp_pack_dir}/partitions.json
}
