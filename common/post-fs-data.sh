#!/system/bin/sh
# sy

MODDIR=${0%/*}

# Enforce crticial build props
resetprop ro.sys.sdcardfs false
resetprop -p persist.sys.sdcardfs force_off
resetprop -p persist.esdfs_sdcard false
resetprop -p persist.fuse_sdcard true
