# Clear Screen
if [ -f /usr/bin/clear]; then
  /usr/bin/clear
else
  clear
fi

#!/bin/bash
echo "#############################################"
echo "#                                           #"
echo "#        GitHub : Demo Repository           #"
echo "#      Docker Inital Setup Script 2019      #"
echo "#                                           #"
echo "#############################################"

# Update Local System
echo ""
echo "Updating Local Reposities and Packages"
apt update && apt upgrade -y
