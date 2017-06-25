##########################################################################################
#
# ts-binds
# by TechnoSparks
#
##########################################################################################

##########################################################################################
# Defines
##########################################################################################

MODID=ts-binds
AUTOMOUNT=true
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=true

##########################################################################################
# Installation Message
##########################################################################################

print_modname() {
  ui_print "================================================"
  ui_print " ts-binds Magisk Module"
  ui_print "================================================"
  ui_print "Module proudly made by TechnoSparks"
  ui_print "Powered by Magisk (@topjohnwu)"
  ui_print " "
}

print_onFinish() {
  ui_print " "
  ui_print "[i] Flashing is done!"
  ui_print "------------------------------------------------"
}

##########################################################################################
# Replace list
##########################################################################################

REPLACE="
"

##########################################################################################
# Permissions
##########################################################################################

# NOTE: This part has to be adjusted to fit your own needs

set_permissions() {
  # Default permissions, don't remove them
  set_perm_recursive  $MODPATH  0  0  0755  0644
  set_perm $MODPATH/system/bin/tsbinds  0  0  0755
  set_perm /data/media/0/ts-binds-folderlist.txt media_rw media_rw 0664

  # Only some special files require specific permissions
  # The default permissions should be good enough for most cases

  # Some templates if you have no idea what to do:

  # set_perm_recursive  <dirname>                <owner> <group> <dirpermission> <filepermission> <contexts> (default: u:object_r:system_file:s0)
  # set_perm_recursive  $MODPATH/system/lib       0       0       0755            0644

  # set_perm  <filename>                         <owner> <group> <permission> <contexts> (default: u:object_r:system_file:s0)
  # set_perm  $MODPATH/system/bin/app_process32   0       2000    0755         u:object_r:zygote_exec:s0
  # set_perm  $MODPATH/system/bin/dex2oat         0       2000    0755         u:object_r:dex2oat_exec:s0
  # set_perm  $MODPATH/system/lib/libart.so       0       0       0644
}
