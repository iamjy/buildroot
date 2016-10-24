#!/bin/sh

####################################################################
# Symbol: BR2_ROOTFS_POST_BUILD_SCRIPT [=y]                        #
# Type  : string                                                   #
# Prompt: Custom scripts to run before creating filesystem images  #
#   Location:                                                      #
# (1) -> System configuration                                      #
#   Defined at system/Config.in:393                                #
####################################################################


####################################################################
# Test script                                                      #
####################################################################
TOP_DIR=${PWD}
BOARD_CONF_DIR=${TOP_DIR}/board/mtekvision/victoria_fpga

### Makes device node
#sudo ${BOARD_CONF_DIR}/scripts/mkdev.sh ${TOP_DIR}/output/target/dev

### Make ipc directory
if [ ! -d ${TOP_DIR}/output/target/ipc ]; then
	mkdir ${TOP_DIR}/output/target/ipc
fi
