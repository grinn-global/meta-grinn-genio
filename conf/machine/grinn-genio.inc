IMAGE_FSTYPES = "wic.img aiotflash.tar.xz aiotflash.tar.xz.sha256sum"

#
# Use fast compression by default to reduce image assembly time.
# For releases where size is important it can be changed to Yocto default "-9"
#

XZ_COMPRESSION_LEVEL ?= "-3"
