#!/bin/bash

#Variables
RESOURCE_GROUP_NAME="ARMResourceGroup"
LOCATION="northeurope"
RG_TEMPLATE_FILE='resource-group-template.json'

# Deploy template for creation Resource Group
az deployment sub create --location $LOCATION --name $RESOURCE_GROUP_NAME --template-file $RG_TEMPLATE_FILE