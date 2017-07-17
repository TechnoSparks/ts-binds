# ts-binds
ts-binds basically make use of “bind” parameter of the “mount” available in your Android environment

## What does it do
Derived from a very long-living trick for users who are struggling with the internal storage space available on their phones, while at the same time has the benefit of inserting an SD card, ts-binds will make use of already available functions on your device, to mirror a path to another path, effectively making both paths indistinguishable.

For example, if you mirror the `Download` folder on Internal with the `Stuff from Internet` folder on your SD Card, the same list of cat pictures will be shown on both directories when navigated via a file manager, and any changes will take affect on both paths.

## Why this when I have huge internal storage
Since you can mirror two different paths altogether, the use of this module doesn't only end on making use of SD cards. If you wish to mirror, let's say a folder from `/data` to another in `/system`, this module also gets the job done

## Features
1. Automated mount on boot based on user-configured path-list in internal storage
2. Robust functions available for use in Terminal
3. Bind or unbind specific “folder couple” that you named

## How to use
- Install module by flashing via recovery or selecting the zip in Magisk Manager.
- Once you reboot, a new file with the name `ts-binds-folderlist.txt` will be created in your internal storage.
- Edit the file and add your own folder couple. In-depth learning [here](https://github.com/TechnoSparks/ts-binds/wiki/Bind-Two-Different-Folders).
- Save the file, reboot and forget! Or if you don't want to reboot, open a terminal emulator and run `su -c tsbinds reinit`
- Any changes that you wish to make in the future can be done by editing the file again, and re-run `tsbinds reinit`. As easy as that.

## Requirements
1. Magisk
2. Bash support is required since the scripts are Bash scripts. The shebangs are pointing to `/system/xbin/bash`. LineageOS or derivative ROMs should be of no problem. Bash binary is not a requirement if the standard shell can read bash-syntaxes

## Terminal functions
ts-binds also provides a few useful terminal functions that you can use to your advantage. To see available options, run `tsbinds help` in a terminal emulator. Note that using `tsbinds` require an elevated shell (root).

## Links
- [→ DOWNLOAD](https://github.com/TechnoSparks/ts-binds/releases)
- [XDA Developers thread](https://forum.xda-developers.com/apps/magisk/module-ts-binds-t3628856)
- [GitHub](https://github.com/TechnoSparks/ts-binds)
- [Changelogs](https://github.com/TechnoSparks/ts-binds/releases)
