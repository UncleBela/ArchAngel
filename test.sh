#/bin/sh
device="sda1"

$(lsblk | grep -o "$device" > /dev/null)
echo $?
