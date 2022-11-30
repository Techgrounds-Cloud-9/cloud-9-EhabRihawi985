param location string = resourceGroup().location

resource virtualNetwork1 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: 'app-prd-vnet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.10.10.0/24'
      ]
    }
    virtualNetworkPeerings: [
      {
        id: vnetpeering.id
        name: 'peering'
        properties: {
          allowVirtualNetworkAccess: true
          peeringState: 'Connected'
        }
      }
    ]
    subnets: [
      {
        name: 'Subnet-1'
        properties: {
          addressPrefix: '10.10.10.0/25'
          networkSecurityGroup: {
            id: nsg1.id
          }
        }
      }
    ]
  }
}

resource vnetpeering 'Microsoft.Peering/peerings@2022-10-01' = {
  name: 'vnetpeering'
  location: location
  sku: {
  }
  kind: 'Direct'
}

resource virtualNetwork2 'Microsoft.Network/virtualNetworks@2022-05-01' = {
  name: 'management-prd-vnet'
  location: location
  properties: {
   addressSpace: {
    addressPrefixes: [
     '10.20.20.0/24' 
    ]
   } 
   virtualNetworkPeerings: [
    {
      id: vnetpeering.id
      name: 'peering'
      properties: {
        allowVirtualNetworkAccess: true
        peeringState: 'Connected'
      }
    }
  ]
   subnets: [
    {
      name: 'Subnet-1'
      properties: {
       addressPrefix: '10.20.20.0/25' 
       networkSecurityGroup: {
        id: nsg2.id
       }
      }
    }
   ]
  }
}

resource nsg1 'Microsoft.Network/networkSecurityGroups@2019-11-01' = {
  name: 'nsg1'
  location: location
}

      
resource nsg2 'Microsoft.Network/networkSecurityGroups@2019-11-01' = {
  name: 'nsg2'
  location: location
}


