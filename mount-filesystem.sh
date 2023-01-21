#!/bin/bash
mountpoint='/u01'
mobileno=""
smsurl=""
mntcmd='/bin/mount -a'
mntchkcmd='/bin/mount'   
###Check mount point available or not IF not alert to service own
${mntchkcmd} | /bin/grep ${mountpoint} > /dev/null 2>&1
if [ $? != 0 ]
        then
    ${mntcmd}
    sleep 5
    ${mntchkcmd} | /bin/grep ${mountpoint} > /dev/null 2>&1
    if [ $? != 0 ]
        then
        echo "issue with mount point"
        exit
    fi
fi
###If mount point is available then check it for utilisation.
warn=90
critical=95
disksize=$(/bin/df -k ${mountpoint} | /bin/awk -F% '{print $1}' | /bin/awk '{print $4}')
if [ ${disksize} -gt ${warn} ]
    then
        echo 'warn'
    elif [ ${disksize} -gt ${critical} ] 
    then
        echo 'critical' 
fi
