param adminPublicKey string
param allowedSSHSourceIp string = '*'
param vmSize string = 'Standard_B1s'
param adminUsername string = 'azureuser'
param location string = resourceGroup().location

var diagStorageAccountName = 'diag${uniqueString(resourceGroup().id)}'

module networking 'modules/network.bicep' = {
    name: 'networkingDeployment'
    params: {
        location: location
        allowedSSHSourceIp: allowedSSHSourceIp
    }
}

module vm 'modules/vm.bicep' = {
    name: 'vmDeployment'
    params: {
        location: location
        adminUsername: adminUsername
        adminPublicKey: adminPublicKey
        subnetId: networking.outputs.vmSubnetId
        diagStorageAccountName: diagStorageAccountName
        vmSize: vmSize
    }
}

output vmPublicIP string = vm.outputs.vmPublicIP
