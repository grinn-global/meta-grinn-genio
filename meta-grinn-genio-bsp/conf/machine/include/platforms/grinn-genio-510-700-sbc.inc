require grinn-genio-platform.inc
require conf/machine/include/mt7921.inc 

MACHINEOVERRIDES =. "grinn-genio-510-700-sbc:"

MACHINE_FEATURES:append = " alsa bluetooth pci usbgadget usbhost wifi tsn uc-fde"

ONSEMI_BOARD_NAME = "MediaTek_Genio"
MACHINE_EXTRA_RRECOMMENDS:append = " \
        onsemi-firmware-ap1302-ar0430 \
        onsemi-firmware-ap1302-ar0830 \
"

MACHINE_EXTRA_RRECOMMENDS:append = " \
        i2c-utils-optiga-trust \
	python3-dev \
"

MACHINE_EXTRA_RRECOMMENDS:append = " \
    ${@bb.utils.contains( \
        'MACHINE_FEATURES', \
        'deepx', \
        ' dx-driver dx-rt dx-stream dx-stream-sample', \
        '', \
        d \
    )} \
"

MACHINE_EXTRA_RRECOMMENDS:append = " \
        bluez5 \
        firmware-nxp-wifi-nxp8987-sdio \
"
