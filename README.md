# ts-binds
ts-binds binds two different folders on your device so that both folders share the same contents

## What does it do
Derived from a very long-living trick for users who are struggling with the internal storage space available on their phones, while at the same time has the benefit of inserting an SD card, ts-binds will make use of already available functions on your device, to mirror a path to another path, effectively making both paths indistinguishable.

For example, if you mirror the `Download` folder on Internal with the `Stuff from Internet` folder on your SD Card, the same list of cat pictures will be shown on both directories when navigated via a file manager, and any changes will take effect on both paths.

## Notice
- Using this module will disable sdcardfs
- Not compatible when device has no SD Card slot
  - Read below
- Not compatible when adoptable storage is used
  - Hey there! This is because the module expect to have an SD Card mounted. As for the moment you may use the module without an SD Card by editing /magisk/ts-binds/service.sh. Go to line 17 and read the comment. I will consider a suitable way to workaround this logic in the script.

## Links
- [**More Info and Further Reading**](https://www.technosparks.net/pages/product-documentation/ts-binds?from=readme)
- [XDA Developers thread](https://forum.xda-developers.com/apps/magisk/module-ts-binds-t3628856)
- [→ DOWNLOAD ZIP](https://github.com/Magisk-Modules-Repo/ts-binds/releases) (Also available in Magisk Repo)
- [GitHub](https://github.com/Magisk-Modules-Repo/ts-binds/)
- [Changelogs](https://github.com/Magisk-Modules-Repo/ts-binds/releases)

## Changelog (2 recent versions)
### 1.0.9
**Modifications**
- Change to use busybox
  - Uses hardcoded PATH towards the busybox folder `/sbin/.core/busybox`
- Uses hardcoded path towards module directory `/sbin/.core/img/ts-binds`
  - Was `/magisk/ts-binds` but /magisk is a softlink towards above path
  - I know, hardcoding paths is a bad practice, but the module goes forward by Magisk's new version. The reason I had to do this is because there is no other easy alternative to find module dir other than extreme measures of loopdevice check or looping through countless number of directories from root.


**Regressions**
- Deprecated (not really) `tsbinds unbind <foldercouple>` command because changes in the kernel is not synchronised by the system
  - Research is in progress to determine the through cause.

### 1.0.8

**Regressions**
- Not backwards-compatible for Magisk version <15 due to template change

**Fixes**
- No longer relies on shebang /system/xbin/bash. In fact, it was stupid for me to do this back then :S
  - This will ensure greater support to different devices especially on stock ROM

**Modifications**
- Updated help snippet
