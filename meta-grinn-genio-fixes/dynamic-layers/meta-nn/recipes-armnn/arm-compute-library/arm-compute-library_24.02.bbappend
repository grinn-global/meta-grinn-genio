#
# arm-compute-library: Repo branch update
# https://gitlab.com/mediatek/aiot/rity/meta-nn/-/commit/b999ddd6642f7d911193aa10325cb3f4aed5cd2f
#
SRC_URI:remove = " \
    git://github.com/ARM-software/ComputeLibrary.git;protocol=https;branch=main;name=arm-compute-library \
"
SRC_URI:append = " \
    git://github.com/ARM-software/ComputeLibrary.git;protocol=https;branch=archived-releases;name=arm-compute-library \
"
