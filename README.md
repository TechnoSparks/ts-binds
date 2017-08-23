# ts-binds
ts-binds binds two different folders on your device so that both folders share the same contents

## Changelog (2 recent versions)
### 1.0.6
**Additions**  
- Disable sdcardfs from build.prop

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

## What does it do
Derived from a very long-living trick for users who are struggling with the internal storage space available on their phones, while at the same time has the benefit of inserting an SD card, ts-binds will make use of already available functions on your device, to mirror a path to another path, effectively making both paths indistinguishable.

For example, if you mirror the `Download` folder on Internal with the `Stuff from Internet` folder on your SD Card, the same list of cat pictures will be shown on both directories when navigated via a file manager, and any changes will take affect on both paths.

## Notice
Using this module will disable sdcardfs.

## Features
1. Automated mount on boot based on user-configured path-list in internal storage
2. Robust functions available for use in Terminal
3. Bind or unbind specific “folder couple” that you named

## How to use
- Install module by flashing via recovery or selecting the zip in Magisk Manager.
- Once you reboot, a new file with the name `ts-binds-folderlist.txt` will be created in your internal storage.
- Edit the file and add your own folder couple. In-depth learning [here](https://www.technosparks.net/pages/product-documentation/ts-binds?q=bind).
- Save the file, reboot and forget! Or if you don't want to reboot, open a terminal emulator and run `su -c tsbinds reinit`
- Any changes that you wish to make in the future can be done by editing the file again, and re-run `tsbinds reinit`. As easy as that.

## Requirements
Bash support is required since the scripts are Bash scripts. The shebangs are pointing to `/system/xbin/bash`. LineageOS or derivative ROMs should be of no problem. Bash binary is not a requirement if the standard shell can read bash-syntaxes

## Terminal functions
ts-binds also provides a few useful terminal functions that you can use to your advantage. To see available options, run `tsbinds help` in a terminal emulator. Note that using `tsbinds` require an elevated shell (root).

## Links
- [→ DOWNLOAD ZIP](https://github.com/Magisk-Modules-Repo/ts-binds/releases) (Also available in Magisk Repo)
- [XDA Developers thread](https://forum.xda-developers.com/apps/magisk/module-ts-binds-t3628856)
- [GitHub](https://github.com/Magisk-Modules-Repo/ts-binds/)
- [Changelogs](https://github.com/Magisk-Modules-Repo/ts-binds/releases)
