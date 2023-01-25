@description('Size of VMs in the VM Scale Set.')
param vmSku string = 'Standard_D2s_v3'

@description('The Windows version for the VM. This will pick a fully patched image of this given Windows version. Allowed values: 2008-R2-SP1, 2012-Datacenter, 2012-R2-Datacenter & 2016-Datacenter, 2019-Datacenter.')
@allowed([
  '18.04-LTS'
  '20.04-LTS'
  '22.04-LTS'
])
param imageOffer string = '18.04-LTS'

@description('Number of VM instances (100 or less).')
@minValue(1)
@maxValue(100)
param instanceCount int = 1

@description('When true this limits the scale set to a single placement group, of max size 100 virtual machines. NOTE: If singlePlacementGroup is true, it may be modified to false. However, if singlePlacementGroup is false, it may not be modified to true.')
param singlePlacementGroup bool = false

@description('Admin username on all VMs.')
param adminUsername string

@description('Admin password on all VMs.')
@secure()
param adminPassword string

@description('Location for all resources.')
param location string = resourceGroup().location

@description('Fault Domain count for each placement group.')
param platformFaultDomainCount int = 1

var vmScaleSetName = toLower(substring('vmssName${uniqueString(resourceGroup().id)}', 0, 9))
var vNetName = 'WSvnet'
var nicName = '${vmScaleSetName}nic'
var ipConfigName = '${vmScaleSetName}ipconfig'
var applicationGatewayBackendAddressPools = resourceId('Microsoft.Network/applicationGateways/backendAddressPools', applicationGateWayName,'myBackendPool')
var osType = {
  publisher: 'Canonical'
  offer: 'UbuntuServer'
  sku: imageOffer
  version: 'latest'
}
var imageReference = osType

param applicationGateWayName string = 'myAppGateway'
param storageAccountName string = 'ehabtechgrounds'



resource vNet 'Microsoft.Network/virtualNetworks@2021-05-01' existing = {
  name: vNetName
}

resource nsg1 'Microsoft.Network/networkSecurityGroups@2022-07-01' existing = {
  name: 'nsg1'
}

resource vmScaleSet 'Microsoft.Compute/virtualMachineScaleSets@2021-11-01' = {
  name: vmScaleSetName
  location: location
  sku: {
    name: vmSku
    tier: 'Standard'
    capacity: instanceCount
  }
  properties: {
    automaticRepairsPolicy: {
      enabled: true
      gracePeriod: 'PT10M'
      repairAction: 'Replace'
    }
    singlePlacementGroup: singlePlacementGroup
    orchestrationMode: 'Uniform'
    upgradePolicy: {
      mode: 'Manual'
    }
    scaleInPolicy: {
      rules: [
        'Default'
      ]
    }
    virtualMachineProfile: {
      osProfile: {
        computerNamePrefix: vmScaleSetName
        adminUsername: adminUsername
        adminPassword: adminPassword
        linuxConfiguration: {
          disablePasswordAuthentication: false
          provisionVMAgent: true
        }
        allowExtensionOperations: true
      }
      storageProfile: {
        osDisk: {
          osType: 'Linux'
          caching: 'ReadWrite'
          createOption: 'FromImage'
          managedDisk: {
            storageAccountType: 'StandardSSD_LRS'
          }
        }
        imageReference: imageReference
      }
      networkProfile: {
        networkInterfaceConfigurations: [
          {
            name: nicName
            properties: {
              primary: true
              enableAcceleratedNetworking: true
              networkSecurityGroup: {
                id: nsg1.id
              }
              dnsSettings: {
                dnsServers: [
                  
                ]
              }
              enableIPForwarding: false
              ipConfigurations: [
                {
                  name: ipConfigName
                  properties: {
                    subnet: {
                      id: vNet.properties.subnets[0].id
                    }
                    privateIPAddressVersion: 'IPv4'
                    applicationGatewayBackendAddressPools: [
                      {
                        id: applicationGatewayBackendAddressPools
                      }
                    ]
                  }
                }
              ]
            }
          }
        ]
      }
      extensionProfile: {
        extensions: [
          {
            name: 'install_apache'
            properties: {
              publisher: 'Microsoft.Azure.Extensions'
              type: 'CustomScript'
              typeHandlerVersion: '2.1'
              autoUpgradeMinorVersion: true
              settings: {
                skipDos2Unix: false
                fileUris: [
                  'https://ehabtechgrounds.blob.core.windows.net/data/installapache.sh'
                ]
              }
              protectedSettings: {
                storageAccountName : storageAccountName
                storageAccountKey : listKeys(resourceId('Microsoft.Storage/storageAccounts', storageAccountName), '2022-05-01').keys[0].value
                commandToExecute: 'sh installapache.sh'
              }
            }
          }
        ]
      }
    }
    doNotRunExtensionsOnOverprovisionedVMs: false
    platformFaultDomainCount: platformFaultDomainCount
  }
}



resource autoscalehost 'Microsoft.Insights/autoscalesettings@2021-05-01-preview' = {
  name: 'autoscalehost'
  location: location
  properties: {
    name: 'autoscalehost'
    targetResourceUri: vmScaleSet.id
    enabled: true
    profiles: [
      {
        name: 'Profile1'
        capacity: {
          minimum: '1'
          maximum: '3'
          default: '1'
        }
        rules: [
          {
            metricTrigger: {
              metricName: 'Percentage CPU'
              metricResourceUri: vmScaleSet.id
              timeGrain: 'PT1M'
              statistic: 'Average'
              timeWindow: 'PT5M'
              timeAggregation: 'Average'
              operator: 'GreaterThan'
              threshold: 50
            }
            scaleAction: {
              direction: 'Increase'
              type: 'ChangeCount'
              value: '1'
              cooldown: 'PT5M'
            }
          }
          {
            metricTrigger: {
              metricName: 'Percentage CPU'
              metricResourceUri: vmScaleSet.id
              timeGrain: 'PT1M'
              statistic: 'Average'
              timeWindow: 'PT5M'
              timeAggregation: 'Average'
              operator: 'LessThan'
              threshold: 30
            }
            scaleAction: {
              direction: 'Decrease'
              type: 'ChangeCount'
              value: '1'
              cooldown: 'PT5M'
            }
          }
        ]
      }
    ]
  }
}

resource healthcheck 'Microsoft.Compute/virtualMachineScaleSets/extensions@2022-08-01' = {
  name: 'HealthExtension'
  parent: vmScaleSet
  properties: {
    publisher: 'Microsoft.ManagedServices'
    type: 'ApplicationHealthLinux'
    autoUpgradeMinorVersion: true
    typeHandlerVersion: '1.0'
    settings: {
      protocol: 'tcp'
      port: 80
    }
  }
}


