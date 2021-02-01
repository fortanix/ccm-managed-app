# This script is wrapper over confidential computing node agent installer. Based on the attestation type selected in CCM Managed App, az-dcap-client is installed in this script
# This script is referenced from CCM Azure Managed App Templates

#!/bin/bash

install_az_dcap_client() {
  attestationType="$1"
  if [ $attestationType == "--attestation-type=DCAP" ]; then
    echo "deb [arch=amd64] https://packages.microsoft.com/ubuntu/16.04/prod xenial main" | tee /etc/apt/sources.list.d/msprod.list
    wget -qO - https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
    apt -y update
    apt install -y az-dcap-client
  fi
}

install_az_dcap_client $2

bash ./installer.sh $@
