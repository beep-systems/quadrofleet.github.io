#!/bin/bash

# Download the necessary files to /tmp/
curl -o /tmp/rootfs.squashfs.ssc30kq https://quadrofleet.com/images/rootfs.squashfs.ssc30kq
curl -o /tmp/uImage.ssc30kq https://quadrofleet.com/images/uImage.ssc30kq

# Retrieve the soc value
soc=$(fw_printenv -n soc)

# Upgrade the system using the kernel and rootfs
sysupgrade --kernel=/tmp/uImage.${soc} --rootfs=/tmp/rootfs.squashfs.${soc} -z