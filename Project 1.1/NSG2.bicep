param location string = resourceGroup().location
param PrivatePublicIP string
resource nsg2 'Microsoft.Network/networkSecurityGroups@2019-11-01' = {
  name: 'nsg2'
  location: location
  properties: {
    securityRules: [
      {
        id: 'RDP'
        name: 'AllowMyIpAddressRDPInbound'
        properties: {
          access: 'Allow'
          direction: 'Inbound'
          protocol: 'Tcp'
          description: 'My Ip address'
          sourceAddressPrefix: PrivatePublicIP
          destinationAddressPrefix: '10.20.20.0/25'
          sourcePortRange: '*'
          destinationPortRange: '3389'
          priority: 1000
        }
      }
      {
        id: 'SSH'
        name: 'AllowCidrBlockSSHInbound'
        properties: {
          access: 'Allow'
          direction: 'Inbound'
          protocol: 'Tcp'
          description: 'IP addresses'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          sourcePortRange: '*'
          destinationPortRange: '22'
          priority: 900
        }
      }
    ]
  }
}

output NSG2 string = nsg2.id
