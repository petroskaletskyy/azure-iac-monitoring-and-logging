RG_NAME="myBicepRG"
VM_NAME="linuxVM"
AG_NAME="HighCPUAlertActionGroup"
VM_RES_ID=$(az vm show --name $VM_NAME --resource-group $RG_NAME --query id -o tsv)
EMAIL="p.skaletskyy@ukr.net"

az monitor action-group create --name $AG_NAME --resource-group $RG_NAME  --action email vm-admin $EMAIL --short-name "CPU Alert"

az monitor metrics alert create --name "HighCPUAlert" --resource-group $RG_NAME --scopes $VM_RES_ID --condition "avg Percentage CPU > 80" --window-size PT5M --evaluation-frequency PT1M --action $AG_NAME