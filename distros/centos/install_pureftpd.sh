echo ""
echo "################################"
echo "     Installing pure-ftpd        "
echo "################################"
echo ""

yum -y install pure-ftpd

echo ""
echo "Configure Pure-ftpd Service"
systemctl enable pure-ftpd.service
echo "pure-ftpd service enabled!"
systemctl start pure-ftpd.service
echo "pure-ftpd service started!"

