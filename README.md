# ts-binds
ts-binds basically make use of "bind" parameter of the "mount" available in your Android environment

## What does it do
It has been a very long-living trick for users who are struggling with the internal storage space available on their phones, while at the same time has the benefit of inserting an SD card.

ts-binds will make use of already available functions on your device, to mirror a path to another path, effectively making both paths indistinguishable.

For example, if you mirror the `Download` folder on Internal with the `Stuff from Internet` folder on your SD Card, the same list of cat pictures will be shown on both directories when navigated via a file manager

## Why this when I have huge Internal storage
Since you can mirror two different paths altogether, the use of this module doesn't only end on making use of SD cards. If you wish to mirror, let's say a folder from
