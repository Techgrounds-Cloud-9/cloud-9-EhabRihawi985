param location string = resourceGroup().location
param virtualNetworkName2 string
param VnetAddressPrefixes2 string
param SubNetworkName2 string
param SubAddressPrefixes2 string

resource virtualNetwork2 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  dependsOn: [
    nsg2
  ]
  name: virtualNetworkName2
  location: location
  properties: {
   addressSpace: {
    addressPrefixes: [
      VnetAddressPrefixes2
    ]
   } 
   subnets: [
    {
      name: SubNetworkName2
      properties: {
       addressPrefix: SubAddressPrefixes2 
       networkSecurityGroup: {
        id: nsg2.outputs.NSG2
       }
      }
    }
   ]
  }
}

module nsg2 'NSG2.bicep' = {
  name: 'nsg2'
  params: {
    location: location
  }
}

output Subnet2 string = SubNetworkName2


      



