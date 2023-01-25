@description('Location for all resources.')
param location string = resourceGroup().location
var virtualNetworkName = 'WSvnet'

var publicIPAddressName = 'public_ip'
param AppGWSubnet string = 'myAGSubnet'
var applicationGateWayName = 'myAppGateway'
param dnsNameForPublicIP string = 'dnsehab'


resource virtualNetwork 'Microsoft.Network/virtualNetworks@2021-05-01' existing = {
  name: virtualNetworkName
}

resource publicIPAddress 'Microsoft.Network/publicIPAddresses@2021-05-01' = {
  name: publicIPAddressName
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    dnsSettings: {
      domainNameLabel: dnsNameForPublicIP
    }
  }
}

resource applicationGateWay 'Microsoft.Network/applicationGateways@2021-05-01' = {
  name: applicationGateWayName
  location: location
  properties: {
    sku: {
      name: 'Standard_v2'
      tier: 'Standard_v2'
    }
    gatewayIPConfigurations: [
      {
        name: 'appGatewayIpConfig'
        properties: {
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', virtualNetworkName, AppGWSubnet)
          }
        }
      }
    ]
    sslPolicy:{
      cipherSuites:[
        'TLS_DHE_RSA_WITH_AES_128_GCM_SHA256'
        
      ]
      policyType:'Custom'
      minProtocolVersion:'TLSv1_2'
    }
    probes: [
      {
        name: 'HealthProbe'
        properties:{
          pickHostNameFromBackendHttpSettings:true
          interval: 60
          protocol:'http'
          port: 80
          path:'/health'
          timeout:15
        }
      }
    ]
    frontendIPConfigurations: [
      {
        name: 'appGwPublicFrontendIp'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: resourceId('Microsoft.Network/publicIPAddresses', publicIPAddressName)
          }
        }
      }
    ]
    frontendPorts: [
      {
        name: 'port_80'
        properties: {
          port: 80
        }
      }
    ]
    backendAddressPools: [
      {
        name: 'myBackendPool'
        properties: {}
      }
    ]
    backendHttpSettingsCollection: [
      {
        name: 'myHTTPSetting'
        properties: {
          port: 80
          protocol: 'Http'
          cookieBasedAffinity: 'Disabled'
          pickHostNameFromBackendAddress: false
          requestTimeout: 20
        }
      }
    ]
    httpListeners: [
      {
        name: 'myListener'
        properties: {
          frontendIPConfiguration: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendIPConfigurations', applicationGateWayName, 'appGwPublicFrontendIp')
          }
          frontendPort: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendPorts', applicationGateWayName, 'port_80')
          }
          protocol: 'Http'
          requireServerNameIndication: false
        }
      }
    ]
    requestRoutingRules: [
      {
        name: 'myRoutingRule'
        properties: {
          ruleType: 'Basic'
          httpListener: {
            id: resourceId('Microsoft.Network/applicationGateways/httpListeners', applicationGateWayName, 'myListener')
          }
          backendAddressPool: {
            id: resourceId('Microsoft.Network/applicationGateways/backendAddressPools', applicationGateWayName, 'myBackendPool')
          }
          backendHttpSettings: {
            id: resourceId('Microsoft.Network/applicationGateways/backendHttpSettingsCollection', applicationGateWayName, 'myHTTPSetting')
          }
        }
      }
    ]
    enableHttp2: false
    autoscaleConfiguration: {
      minCapacity: 0
      maxCapacity: 10
    }
  }
  dependsOn: [
    virtualNetwork
    publicIPAddress
  ]
}



