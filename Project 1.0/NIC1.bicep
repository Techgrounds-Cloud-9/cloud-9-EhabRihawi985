param location string = resourceGroup().location
var nicName_var = 'myVMNic'
var publicIPAddressName_var = 'myPublicIP'
var publicIPAddressType = 'Dynamic'
@description('Unique DNS Name for the Public IP used to access the Virtual Machine.')
param dnsNameForPublicIP string = 'dnsehab'
param virtualnetworkname string = 'WSvnet'
param SubNetworkName1 string = 'Subnet1'

resource virtualNetwork1 'Microsoft.Network/virtualNetworks@2019-11-01' existing ={
  name: virtualnetworkname
}

resource Subnet 'Microsoft.Network/virtualNetworks/subnets@2022-07-01' existing = {
  parent: virtualNetwork1
  name: SubNetworkName1
}

resource publicIPAddressName 'Microsoft.Network/publicIPAddresses@2020-05-01' = {
  name: publicIPAddressName_var
  location: location
  properties: {
    publicIPAllocationMethod: publicIPAddressType
    dnsSettings: {
      domainNameLabel: dnsNameForPublicIP
    }
  }
}

resource nicName 'Microsoft.Network/networkInterfaces@2020-05-01' = {
  name: nicName_var
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddressName.id
          }
          subnet: {
            id: Subnet.id
          }
        }
      }
    ]
  }
}
