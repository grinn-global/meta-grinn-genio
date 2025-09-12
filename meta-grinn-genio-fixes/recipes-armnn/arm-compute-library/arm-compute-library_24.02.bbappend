# The hash commit was removed from the main branch, so we switch to the archived-releases branch
SRC_URI:remove = "git://github.com/ARM-software/ComputeLibrary.git;protocol=https;branch=main;name=arm-compute-library"
SRC_URI:append = " git://github.com/ARM-software/ComputeLibrary.git;protocol=https;branch=archived-releases;name=arm-compute-library"
