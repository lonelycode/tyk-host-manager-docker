#!/bin/bash

sed -i 's/DOMAINALIAS/'$DOMAINALIAS'/g' /opt/tyk-dashboard/host-manager/templates/*.conf
cd /opt/tyk-dashboard/host-manager/

service nginx start
./tyk-host-manager