param location string
param allowedSSHSourceIp string

resource vnet 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: 'vnet-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
    {
      name: 'vmSubnet'
      properties: {
        addressPrefix: '10.0.1.0/24'
        networkSecurityGroup: {
          id: nsg.id
        }
      }
    }
    {
      name: 'appsSubnet'
      properties: {
        addressPrefix: '10.0.2.0/24'
      }
    }   
    ]  
  }
}

resource nsg 'Microsoft.Network/networkSecurityGroups@2021-05-01' = {
  name: 'nsg-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    securityRules: [
      {
        name: 'AllowSSH'
        properties: {
          priority: 100
          access: 'Allow'
          direction: 'Inbound'
          protocol: 'Tcp'
          sourceAddressPrefix: allowedSSHSourceIp
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
          destinationPortRange: '22'
        }
      }
    ]
  }
}

output vmSubnetId string = vnet.properties.subnets[0].id
