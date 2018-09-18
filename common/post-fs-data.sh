#!/system/bin/sh
# sy

MODDIR=${0%/*}

# Enforce crticial build props
resetprop -n ro.sys.sdcardfs false
resetprop -n persist.sys.sdcardfs force_off
resetprop -n persist.esdfs_sdcard false
resetprop -n persist.fuse_sdcard true
