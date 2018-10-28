#!/system/bin/sh
# sy

# Functions ----------------------------------------------
MODDIR=${0%/*}
datadir=/data/ts-binds
sdstatus=0
logfile=$MODDIR/data/ts-binds.log
logfileuser=/data/media/0/ts-binds.log
exec > $logfile
exec 2>&1
echo -e "Log initialised at: $(date) \n\n"

# Copy over user's bind list ---------------------------
tsbinds update

# Barrier, do not continue until SD card is mounted ----
i=0
until [ $sdstatus == "1" ]; do
    if sdname=$(grep -m 1 "/mnt/media_rw/" /proc/mounts | grep -m 1 -Eo "[0-9A-Z]{4}-[0-9A-Z]{4}"); then
        sdstatus=1
        echo "sdcard $sdname mounted"
    else
        i=$(expr $i + 1)
        if [ $i -eq 20 ]; then
            echo "20 retries (total of 60 seconds) but SD Card do not found. No changes are made."
            break;
        else
            sleep 3
        fi
    fi
done

# Execute ----------------------------------------------
if [ ! -f $datadir/disable ]; then
    tsbinds bind all
else
    echo "OFF switch file (disable) found. No changes are made."
fi

# End bind ---------------------------------------------
echo "Script execution completed"
cp -f $logfile $logfileuser
chown 1023:1023 $logfileuser
chmod 0664 $logfileuser