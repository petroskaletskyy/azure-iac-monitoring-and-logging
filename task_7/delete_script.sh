#!/bin/bash

#Variables
RESOURCE_GROUP_NAME="ARMResourceGroup"

# Delete Resource Group
az group delete --name $RESOURCE_GROUP_NAME --yes --no-wait