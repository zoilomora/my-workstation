#!/bin/bash

echo
echo "################################################################"
echo "  Installing Camunda Modeler                                    "
echo "################################################################"
echo

if ! [ -a "/opt/CamundaModeler-3.7.1" ]; then
    SETUP_DIR="$(pwd)"
    cd /opt

    sudo wget https://downloads.camunda.cloud/release/camunda-modeler/3.7.1/camunda-modeler-3.7.1-linux-x64.tar.gz
    sudo tar -xzf camunda-modeler-3.7.1-linux-x64.tar.gz
    sudo rm camunda-modeler-3.7.1-linux-x64.tar.gz
    sudo mv camunda-modeler-3.7.1-linux-x64 CamundaModeler-3.7.1

    cd CamundaModeler-3.7.1
    sudo ./support/xdg_register.sh

    cd ${SETUP_DIR}
fi
