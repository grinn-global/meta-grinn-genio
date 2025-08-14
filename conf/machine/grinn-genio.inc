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
