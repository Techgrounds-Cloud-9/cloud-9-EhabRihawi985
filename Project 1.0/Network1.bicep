param location string = resourceGroup().location
param virtualNetworkName1 string = 'WSvnet'
param VnetAddressPrefixes1 string = '10.10.10.0/24'
param SubNetworkName1 string = 'Subnet1'
param SubAddressPrefixes1 string = '10.10.10.0/25'

resource virtualNetwork1 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  dependsOn: [
    nsg1
  ]
  name: virtualNetworkName1
  location: location
  properties: {
   addressSpace: {
    addressPrefixes: [
      VnetAddressPrefixes1
    ]
   } 
   subnets: [
    {
      name: SubNetworkName1
      properties: {
       addressPrefix: SubAddressPrefixes1
       networkSecurityGroup: {
        id: nsg1.outputs.NSG1
       }
      }
    }
   ]
  }
}

module nsg1 'NSG1.bicep' = {
  name: 'nsg1'
  params: {
    location: location
  }
}

output virtualnetwork1 string = virtualNetwork1.id
output Subnet1 string = SubNetworkName1


      



