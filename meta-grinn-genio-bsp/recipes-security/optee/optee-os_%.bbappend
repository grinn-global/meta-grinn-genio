python do_check_optee_dram_size() {
    features = (d.getVar('MACHINE_FEATURES') or '').split()
    if 'optee' in features:
        optee_dram_size = d.getVar('OPTEE_DRAM_SIZE')
        if optee_dram_size == "0x00000000":
            bb.fatal(f"Default OPTEE_DRAM_SIZE {optee_dram_size} detected. Please configure this value appropriately!")
}

addtask check_optee_dram_size before do_configure
