# ts-binds
ts-binds binds two different folders on your device so that both folders share the same contents

## What does it do
Derived from a very long-living trick for users who are struggling with the internal storage space available on their phones, while at the same time has the benefit of inserting an SD card, ts-binds will make use of already available functions on your device, to mirror a path to another path, effectively making both paths indistinguishable.

For example, if you mirror the `Download` folder on Internal with the `Stuff from Internet` folder on your SD Card, the same list of cat pictures will be shown on both directories when navigated via a file manager, and any changes will take effect on both paths.

## Notice
Using this module will disable sdcardfs.

## Links
- [**More Info and Further Reading**](https://www.technosparks.net/pages/product-documentation/ts-binds)
- [XDA Developers thread](https://forum.xda-developers.com/apps/magisk/module-ts-binds-t3628856)
- [→ DOWNLOAD ZIP](https://github.com/Magisk-Modules-Repo/ts-binds/releases) (Also available in Magisk Repo)
- [GitHub](https://github.com/Magisk-Modules-Repo/ts-binds/)
- [Changelogs](https://github.com/Magisk-Modules-Repo/ts-binds/releases)

## Changelog (2 recent versions)
### 1.0.6
**Additions**  
- Disable sdcardfs by using prop entries

### 1.0.5
**Additions**  
- Print out log contents when `tsbinds log` is executed in terminal

**Modifications**  
- Get sdcard's name more reliably
- Changed the description of the module
- Modified README to reflect the new place of the repository

### 1.0.4
**Additions**  
- Added support to bind two different files!
- folderlist now has a link to an in-depth tutorial

**Fixes**  
- Invalid path to log file in service.sh

**Modifications**  
- SD card name will not be cached anymore
- Simpler `grep`ing of SD card name
- File overwrite warning is added to `tsbinds help` for the `tsbinds move` feature
- Readme.md now points to GitHub releases to show changelogs instead of commits as changelogs
