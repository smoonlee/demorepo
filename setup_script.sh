# Script Name: Demo Installation Script
# Author: Simon Lee
# Date: May 2019

#!/bin/bash

# Check Root Elevation Status
# https://askubuntu.com/questions/15853/how-can-a-script-check-if-its-being-run-as-root
if [[ $EUID -e 0 ]]; then
   echo "Script Running as Root" 
elif [[ $EUID -ne 0 ]];
   echo "This script must be run as root" 
   exit 1
fi
