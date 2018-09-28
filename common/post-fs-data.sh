#!/system/bin/sh
# sy

MODDIR=${0%/*}

# Enforce crticial build props
resetprop ro.sys.sdcardfs false
resetprop persist.sys.sdcardfs force_off
resetprop persist.esdfs_sdcard false
resetprop persist.fuse_sdcard true
