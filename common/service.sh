#!/system/xbin/bash

# Functions ----------------------------------------------
MODDIR=${0%/*}
int=/data/media/0
sd=/mnt/media_rw/
sdnamecache=$MODDIR/sdname.sh
sdstatus=0
logfile=$int/ts-binds.log
function tslog {
    echo -e "$(date +'%F %T'):\n  $1\n" >> $logfile
    echo -e "$1"
}
echo -e "Log initialised at: $(date) \n\n" > $logfile

# Copy over user's bind list ---------------------------
tsbinds update

# Barrier, do not continue until SD card is mounted ----
if [ -f $sdnamecache ]; then
    source $sdnamecache
fi
until [ $sdstatus == "1" ]; do
    if [ -f $sdnamecache ]; then
        if grep -q $sdname /proc/mounts; then
            sdstatus=1
        fi
    else
        if grep -Eq '[0-9A-F]{4}-[0-9A-F]{4}' /proc/mounts; then
            sdstatus=1
            for sdname in $(ls /mnt/media_rw); do
               if echo "$sdname" | grep -Eoq '[0-9A-F]{4}-[0-9A-F]{4}'; then
                   echo sdname=$sdname > $sdnamecache
                   break
               fi
            done
            chmod 0755 $sdnamecache
            chown 0:0 $sdnamecache
        fi
    fi
    if [ $sdstatus == "1" ]; then
        sd=$sd$sdname
        tslog "sdcard $sdname mounted"
    else
        sleep 1
    fi
done

# Execute ----------------------------------------------
if [ ! -f $MODDIR/disable.txt ]; then
    tsbinds bind all
else
    tslog "OFF switch file (disable.txt) found. No changes are made."
fi

# End bind ---------------------------------------------
tslog "Script execution completed"
unset -f tslog
