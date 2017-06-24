#!/system/xbin/bash
#
# Script will bind two different folders from External storage to internal storage, effectively rendering them as if they are hardlinked, recreating what FolderMount does..
#
# Variables that you can change:
# sd = Your sdcard name
#
# SYNTAX
# folderbind "[sdcard directory]" "[internal directory]"
#
# Where "bind name" is just an "indicator" to tell you what is what, and the other two arguments are pretty self-explanatory..
# [!] WARNING: Make sure to enclose the arguments with quotes!
# [!] WARNING: All three arguments are required
#

# Functions ----------------------------------------------
MODDIR=${0%/*}
int=/data/media/0
sd=/mnt/media_rw/
sdnamecache=$MODDIR/sdname.sh
folderlist=$MODDIR/folderlist.sh
folderlistuser=$int/ts-binds-folderlist.txt
sdstatus=0
logfile=$int/ts-binds.log
function tslog {
    echo -e "$(date +'%F %T'):\n  $1\n" >> $logfile
    echo -e "$1"
}
function folderbind {
    if [ ! "$1" ]; then
        tslog "Bind syntax error! Bind name not given"
        return 1
    elif [ ! "$2" ]; then
        tslog "Bind syntax error! Invalid SD CARD path"
        return 1
    elif [ ! "$3" ]; then
        tslog "Bind syntax error! Invalid INTERNAL STORAGE path"
        return 1
    elif [ ! -d "$sd$2" ]; then
        tslog "Bind aborted: Folder '$sd$2' on SD CARD doesn't exist!"
        return 1
    elif [ ! -d "$int$3" ]; then
        tslog "Bind aborted: Folder '$int$3' on INTERNAL STORAGE doesn't exist!"
        return 1
    else
        mount -o bind "$sd$2" "$int$3" && tslog "Bind successful: $sd$2" || tslog "Bind failed: $sd$2"
    fi
}
echo -e "Log initialised at: $(date) \n\n" > $logfile

# Copy over user's bind list ---------------------------
if [ ! $folderlist -nt $folderlistuser ]; then
    tslog "Difference found between cached and original user list!"
    cp $folderlistuser $folderlist
    chmod 0755 $folderlist
    chown 0:0 $folderlist
    tslog "Updated cached list"
fi

# Barrier, do not continue until SD card is mounted ----
if [ -f $sdnamecache ]; do
    sdname=$(cat $sdnamecache)
fi
until [ $sdstatus == "1" ]; do
    if [ -f $sdnamecache ]; do
        if grep -q $sdname /proc/mounts; then
            sdstatus=1
        fi
    else
        if grep -Eq '[0-9A-F]{4}-[0-9A-F]{4}' /proc/mounts; then
            sdstatus=1
            for sdname in `ls /mnt/media_rw`; do
               if echo "$sdname" | grep -Eoq '[0-9A-F]{4}-[0-9A-F]{4}'; then
                   echo $sdname > $sdnamecache
                   break
               fi
            done
        fi
    fi
    if [ $sdstatus == "1" ]; then
        sd=$sd$sdname
        tslog "sdcard $sdname mounted"
    else
        sleep 1
    fi
done

# Execute -----------------------------
. $folderlist

# End bind ---------------------------------------------
chown root:root $logfile
chmod 0666 $logfile
tslog "Ownership applied to log file"
tslog "Script execution completed"
unset -f tslog folderbind
