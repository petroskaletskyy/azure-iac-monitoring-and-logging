RG_NAME=myBicepRG
LOCATION=northeurope

az group create --name $RG_NAME --location $LOCATION

az deployment group create --resource-group $RG_NAME --template-file main.bicep --parameters adminPublicKey="$(cat ~/.ssh/azure_vm.pub)" allowedSSHSourceIp="$(curl -s ifconfig.me)/32" --query "properties.outputs.vmPublicIP.value"

az network nsg show --resource-group $RG_NAME --name $(az network nsg list --resource-group $RG_NAME --query "[0].name" -o tsv) --query "securityRules"

az deployment group create --resource-group $RG_NAME --template-file main.bicep --parameters adminPublicKey="$(cat ~/.ssh/azure_vm.pub)" allowedSSHSourceIp="$(curl -s ifconfig.me)/32" vmSize="Standard_B2s"