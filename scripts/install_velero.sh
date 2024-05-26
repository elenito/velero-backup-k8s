#!/bin/bash

# Descarga e instala Velero CLI
wget https://github.com/vmware-tanzu/velero/releases/download/v1.7.1/velero-v1.7.1-linux-amd64.tar.gz
tar -xvf velero-v1.7.1-linux-amd64.tar.gz
sudo mv velero-v1.7.1-linux-amd64/velero /usr/local/bin/
