# ts-binds

ts-binds binds two different folders on your device so that both folders share the same contents

## Project Abandoned

I am stopping development because I no longer use a device with an SD card slot. While the project may be revived in the future should my new device has an SD Card slot, consider using a much more worthy alternative [fbind](https://github.com/VR-25/fbind)

## Update Notice

Please delete `/data/ts-binds`, uninstall module and reboot before updating.

This is a huge update as a lot of the core code has been changed drastically. Please have a look at the changelog below for more information.

## What does it do

_Essentially, this "binding" method is widely used to save space on internal storage!_

Derived from a very long-living trick for users who are struggling with the internal storage space available on their phones, while at the same time has the benefit of inserting an SD card, ts-binds will make use of already available functions on your device, to mirror a path to another path, effectively making both paths indistinguishable.

For example, if you mirror the `Download` folder on Internal with the `Stuff from Internet` folder on your SD Card, the same list of cat pictures will be shown on both directories when navigated via a file manager, and any changes will take effect on both paths.

This saves space because the files **physically** reside on the external storage instead of internal storage.

## Requirements

- Magisk Stable version ≥17
  - Beta and Canary version not supported
- Android version ≥ 5

## Notice

_none_

## Links

- [**Further Reading (Documentation)**](https://www.technosparks.net/pages/product-documentation/ts-binds?from=readme)
- [XDA Developers thread](https://forum.xda-developers.com/apps/magisk/module-ts-binds-t3628856)
- [→ DOWNLOAD ZIP](https://github.com/TechnoSparks/ts-binds/releases) (Also available in Magisk Repo)
- [GitHub](https://github.com/TechnoSparks/ts-binds/)
- [Changelog](https://github.com/TechnoSparks/ts-binds/releases)
- [Verbose changelog (commit history)](https://github.com/Magisk-Modules-Repo/ts-binds/commits/master)

## Changelog (2 recent versions)

### 1.1

**Updgrade Notice**

Please delete `/data/ts-binds`, uninstall module and reboot before updating.

**Regressions**

- Magisk version <17 is no longer supported due to template change

**Additions**

- New binding algorithm to support sdcardfs!
  - SDCardFS seems to rely on `/mnt/runtime` mountpoints. The key is to set the bind paths from there, but the binded mount needs to be remounted with proper `gid=9997` and `mask=6`, thus making legacy `/storage/emulated/0` play nice with the permission of the binded folder
  - It is assumed that as of Oreo, SDCardFS implementation is already mature. Hopefully this algorithm persists for long!
  - Binding algorithm will also mount other runtimes if Android do not do it automatically
- New `$obb` variable to ease things in folderlist
  - OBB binding is dealt with the new algorithm
- Detection algorithm if legacy mode (for FUSE) should be applied on your device
  - Behaviour can be altered by using the new `mode` parameter for tsbinds. Run `tsbinds help` in terminal for more info
- ts-binds is now licensed with ... Unlicensed! Read LICENSE file for info

**Modifications**

- Update minmagisk to version 17.0
- Rename `disable.txt` to `disable`
- No longer output to log file if ts-binds invoked from terminal. Parent process needs to manually pipe to a file
  - `service.sh` output is redirected to the original log file
  - This means that the log only represent the automated process of bind mounting when the system boots.
- `service.sh` will finish if SD Card not found in 60 seconds.
  - Previously the script will infinitely loop
- Code refactor

### 1.0.9

**Additions**

- New `mount` parameter to output the system's mount entries. Command `tsbinds mount` is to execute in shell
- New `pairs` parameter to output the pair names in the `folderlist`. Great to do quick revision. Command `tsbinds pairs` is to execute in shell

**Fixes**

- Fix the mount namespace issue - now binds and unbinds take effect the way it should be!
  - All the commands are now passed through `su -M -c` to take effect on the global namespace.

**Modifications**

- Change to use busybox
  - Uses hardcoded PATH towards the busybox folder `/sbin/.core/busybox`
- Uses hardcoded path towards module directory `/sbin/.core/img/ts-binds`
  - Was `/magisk/ts-binds` but /magisk is a symbolic link towards above path
  - I know, hardcoding paths is not recommended by the Magisk documentation, but the module goes forward by Magisk's new version. The reason I had to do this is because there is no other easy alternative to find module's dir other than extreme measures of loopdevice mounting or looping through countless number of directories from root. So instead of taxing the shell during boot, I prefer not to do that instead.
