param location string = resourceGroup().location
param vNetName2 string = 'MNGvnet'
param VnetAddressPrefixes2 string = '10.20.20.0/24'
param SubNetworkName2 string = 'Subnet2'
param SubAddressPrefixes2 string = '10.20.20.0/25'
param PrivatePublicIP string

resource virtualNetwork2 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  dependsOn: [
    nsg2
  ]
  name: vNetName2
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
    PrivatePublicIP: PrivatePublicIP
  }
}

output Subnet2 string = SubNetworkName2


      



