param location string = resourceGroup().location
var nicName2_var = 'myVMNic2'
var publicIPAddressName2_var = 'myPublicIP2'
var publicIPAddressType2 = 'Dynamic'
@description('Unique DNS Name for the Public IP used to access the Virtual Machine.')
param dnsNameForPublicIP2 string = 'dnsehabmng'
param virtualnetworkname2 string = 'MNGvnet'
param SubNetworkName2 string = 'Subnet2'

resource virtualNetwork2 'Microsoft.Network/virtualNetworks@2019-11-01' existing ={
  name: virtualnetworkname2
}

resource Subnet2 'Microsoft.Network/virtualNetworks/subnets@2022-07-01' existing = {
  parent: virtualNetwork2
  name: SubNetworkName2
}

resource publicIPAddressName2 'Microsoft.Network/publicIPAddresses@2020-05-01' = {
  name: publicIPAddressName2_var
  location: location
  properties: {
    publicIPAllocationMethod: publicIPAddressType2
    dnsSettings: {
      domainNameLabel: dnsNameForPublicIP2
    }
  }
}

resource nicName2 'Microsoft.Network/networkInterfaces@2020-05-01' = {
  name: nicName2_var
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddressName2.id
          }
          subnet: {
            id: Subnet2.id
          }
        }
      }
    ]
  }
}
