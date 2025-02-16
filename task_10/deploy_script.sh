#!/bin/bash

az group create --name Task-10-rg --location northeurope

az deployment group create --resource-group Task-10-rg --template-file azure_deploy.json --parameters vmName=MyUbuntuVM adminUsername=azureuser authenticationType=sshPublicKey \≈adminPublicKey="$(cat ~/.ssh/azure_vm.pub)"

az vm show -d -g Task-10-rg -n MyUbuntuVM --query publicIps -o tsv