#!/bin/bash

yum install bc -y
mkdir /opt/sliceup/stats


mv sliceperfcompress.sh /opt/sliceup/scripts/sliceperfcompress.sh
chmod +x /opt/sliceup/scripts/sliceperfcompress.sh
mv sliceperfcompress.service /etc/systemd/system/sliceperfcompress.service


mv sliceperfmon.sh /opt/sliceup/scripts/sliceperfmon.sh
chmod +x /opt/sliceup/scripts/sliceperfmon.sh
mv sliceperfmon.service /etc/systemd/system/sliceperfmon.service



systemctl enable sliceperfmon.service
systemctl start sliceperfmon.service

systemctl enable sliceperfcompress.service
systemctl start sliceperfcompress.service
