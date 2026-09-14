require conf/machine/include/mt8366.inc
require grinn-genio-som.inc

MACHINEOVERRIDES =. "grinn-genio-360-360p-som:"

OPTEE_DRAM_SIZE = "0x200000000"
LIBDRAM_BOARD_NAME = "genio-360-evk"
LK_BOARD_NAME = "genio-360-evk"
UBOOT_MACHINE = "genio_360_evk_defconfig"
