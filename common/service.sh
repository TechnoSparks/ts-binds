#!/system/bin/sh
# sy

# Functions ----------------------------------------------
MODDIR=${0%/*}
sdstatus=0
logfile=/data/media/0/ts-binds.log
function tslog {
    echo -e "$(date +'%F %T'):\n  $1\n" >> $logfile
    echo -e "$1"
}
echo -e "Log initialised at: $(date) \n\n" > $logfile

# Copy over user's bind list ---------------------------
tsbinds update

# Barrier, do not continue until SD card is mounted ----
until [ $sdstatus == "1" ]; do
    if sdname=$(grep -m 1 "/mnt/media_rw/" /proc/mounts | grep -m 1 -Eo "[0-9A-Z]{4}-[0-9A-Z]{4}"); then
        sdstatus=1
        tslog "sdcard $sdname mounted"
    else
        sleep 1
    fi
done

# Execute ----------------------------------------------
if [ ! -f /data/ts-binds/disable.txt ]; then
    tsbinds bind all
else
    tslog "OFF switch file (disable.txt) found. No changes are made."
fi

# End bind ---------------------------------------------
tslog "Script execution completed"
unset -f tslog
