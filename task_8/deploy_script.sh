#!/bin/bash

#Variables
RESOURCE_GROUP_NAME="ARMResourceGroupStorageAccount"
LOCATION="northeurope"
STORAGE_ACCOUNT_NAME="armcreatedstorageacc234"
SA_TEMPLATE_FILE='storage-account-template.json'

# Deploy template for creation Resource Group
az group create --location $LOCATION --name $RESOURCE_GROUP_NAME

# Deploy template for creation Storage Account
az deployment group create --resource-group $RESOURCE_GROUP_NAME --template-file $SA_TEMPLATE_FILE --parameters storageAccountName=$STORAGE_ACCOUNT_NAME