#!/bin/bash

echo
echo "################################################################"
echo "  Installing Camunda Modeler                                    "
echo "################################################################"
echo

if ! [ -a "/opt/CamundaModeler-5.0.0" ]; then
    SETUP_DIR="$(pwd)"
    cd /opt

    sudo wget https://downloads.camunda.cloud/release/camunda-modeler/5.0.0/camunda-modeler-5.0.0-linux-x64.tar.gz
    sudo tar -xzf camunda-modeler-5.0.0-linux-x64.tar.gz
    sudo rm camunda-modeler-5.0.0-linux-x64.tar.gz
    sudo mv camunda-modeler-5.0.0-linux-x64 CamundaModeler-5.0.0

    cd CamundaModeler-5.0.0
    sudo ./support/xdg_register.sh

    cd ${SETUP_DIR}
fi
