param location string = resourceGroup().location

resource nsg1 'Microsoft.Network/networkSecurityGroups@2019-11-01' = {
  name: 'nsg1'
  location: location
  properties: {
    securityRules: [
      {
        id: 'SSH'
        name: 'AllowCidrBlockSSHInbound'
        properties: {
          access: 'Allow'
          direction: 'Inbound'
          protocol: 'Tcp'
          description: 'IP addresses'
          sourceAddressPrefix: '*' //we need to fix the SSHInbound sourceAddressPrefix//
          destinationAddressPrefix: '10.10.10.0/25'
          sourcePortRange: '*'
          destinationPortRange: '22'
          priority: 900
        }
      }
      {
        id: 'HTTP'
        name: 'AllowAnyHTTPInbound'
        properties: {
          access: 'Allow'
          direction: 'Inbound'
          protocol: '*'
          description: 'Any'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '10.10.10.0/25'
          sourcePortRange: '*'
          destinationPortRange: '80'
          priority: 1000
        }
      }
      {
        id: 'HTTPS'
        name: 'AllowAnyHTTPSInbound'
        properties: {
          access: 'Allow'
          direction: 'Inbound'
          protocol: 'TCP'
          description: 'Any'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '10.10.10.0/25'
          sourcePortRange: '*'
          destinationPortRange: '443'
          priority: 1010
        }
      }
    ]
  }
}

output NSG1 string = nsg1.id

