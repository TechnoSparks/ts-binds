# ts-binds
ts-binds binds two different folders on your device so that both folders share the same contents

## What does it do
_Essentially, this "binding" method is widely used to save space on internal storage!_

Derived from a very long-living trick for users who are struggling with the internal storage space available on their phones, while at the same time has the benefit of inserting an SD card, ts-binds will make use of already available functions on your device, to mirror a path to another path, effectively making both paths indistinguishable.

For example, if you mirror the `Download` folder on Internal with the `Stuff from Internet` folder on your SD Card, the same list of cat pictures will be shown on both directories when navigated via a file manager, and any changes will take effect on both paths.

This saves space because the files **physically** reside on the external storage instead of internal storage.

## Notice
- **Not compatible with Android Pie (at the moment)**
- Using this module will disable sdcardfs through build.prop (may be overridable if ROM enforces sdcardfs which means:)
- Not compatible if the ROM strictly enforces SDCardFS
- Not compatible when device has no SD Card slot (logic error in script file, the module expects an SD card on boot)
- Not compatible when adoptable storage is used (logic error in script file, the module expects an SD card on boot)

## Links
- [**More Info and Further Reading**](https://www.technosparks.net/pages/product-documentation/ts-binds?from=readme)
- [XDA Developers thread](https://forum.xda-developers.com/apps/magisk/module-ts-binds-t3628856)
- [→ DOWNLOAD ZIP](https://github.com/Magisk-Modules-Repo/ts-binds/releases) (Also available in Magisk Repo)
- [GitHub](https://github.com/Magisk-Modules-Repo/ts-binds/)
- [Changelogs](https://github.com/Magisk-Modules-Repo/ts-binds/releases)

## Changelog (2 recent versions)

### 1.1
**Regressions**
- Magisk < v17 is no longer supported due to template change

**Additions**
- ts-binds is now licensed with ... Unlicensed! Read LICENSE file for info

**Modifications**
- No longer use system.prop but instead enforce using `resetprop` in post-fs-data mode. This _should_ aggressively disable SDCardFS
- `resetprop` now access the persist storage
- Update minmagisk to version 17.0

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
