param location string = resourceGroup().location
param vNetName string = 'WSvnet'
param addressPrefix string = '10.10.10.0/24'
param subnetName string = 'Subnet1'
param subnetPrefix string = '10.10.10.0/25'
param subnetName2 string = 'myAGSubnet'
param subnetPrefix2 string = '10.10.10.128/26'

resource vNet 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: vNetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetPrefix
          networkSecurityGroup: {
            id: nsg1.id
          }
        }
      }
      {
        name: subnetName2
        properties: {
          addressPrefix: subnetPrefix2
        }
      }      
    ]
  }
}

resource nsg1 'Microsoft.Network/networkSecurityGroups@2019-11-01' existing = {
  name: 'nsg1'
}


