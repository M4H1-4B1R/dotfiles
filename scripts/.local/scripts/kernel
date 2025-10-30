#!/bin/bash

# Option 1: Using uname (simplest)
kernel_version=$(uname -r)

# Option 2: Using /proc/version (more detailed)
# kernel_version=$(cat /proc/version | cut -d ' ' -f 1-3)

# Option 3:  Using `ls /lib/modules` (shows the module directory name, often a good indicator)
#kernel_version=$(ls /lib/modules | sort -V | tail -n 1)

# Option 4:  Using `dkms status` (shows DKMS modules and kernel version used)
#kernel_version=$(dkms status | grep -oP '(?<=: ).*')


if [[ -z "$kernel_version" ]]; then
  echo "Error: Could not determine kernel version."
else
  echo "$kernel_version"
fi
