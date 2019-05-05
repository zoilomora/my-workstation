#!/bin/bash

echo
echo "################################################################"
echo "  Installing Postman                                            "
echo "################################################################"
echo

if ! location=$(type -p "postman"); then
  	sudo snap install postman
fi
