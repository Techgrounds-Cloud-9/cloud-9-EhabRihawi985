@description('User name for the Virtual Machine.')
param adminUsername2 string
@allowed([
  '2008-R2-SP1'
  '2008-R2-SP1-smalldisk'
  '2012-Datacenter'
  '2012-datacenter-gensecond'
  '2012-Datacenter-smalldisk'
  '2012-datacenter-smalldisk-g2'
  '2012-Datacenter-zhcn'
  '2012-datacenter-zhcn-g2'
  '2012-R2-Datacenter'
  '2012-r2-datacenter-gensecond'
  '2012-R2-Datacenter-smalldisk'
  '2012-r2-datacenter-smalldisk-g2'
  '2012-R2-Datacenter-zhcn'
  '2012-r2-datacenter-zhcn-g2'
  '2016-Datacenter'
  '2016-datacenter-gensecond'
  '2016-datacenter-gs'
  '2016-Datacenter-Server-Core'
  '2016-datacenter-server-core-g2'
  '2016-Datacenter-Server-Core-smalldisk'
  '2016-datacenter-server-core-smalldisk-g2'
  '2016-Datacenter-smalldisk'
  '2016-datacenter-smalldisk-g2'
  '2016-Datacenter-with-Containers'
  '2016-datacenter-with-containers-g2'
  '2016-datacenter-with-containers-gs'
  '2016-Datacenter-zhcn'
  '2016-datacenter-zhcn-g2'
  '2019-Datacenter'
  '2019-Datacenter-Core'
  '2019-datacenter-core-g2'
  '2019-Datacenter-Core-smalldisk'
  '2019-datacenter-core-smalldisk-g2'
  '2019-Datacenter-Core-with-Containers'
  '2019-datacenter-core-with-containers-g2'
  '2019-Datacenter-Core-with-Containers-smalldisk'
  '2019-datacenter-core-with-containers-smalldisk-g2'
  '2019-datacenter-gensecond'
  '2019-datacenter'
  '2019-datacenter-gs'
  '2019-Datacenter-smalldisk'
  '2019-datacenter-smalldisk-g2'
  '2019-Datacenter-with-Containers'
  '2019-datacenter-with-containers-g2'
  '2019-datacenter-with-containers-gs'
  '2019-Datacenter-with-Containers-smalldisk'
  '2019-datacenter-with-containers-smalldisk-g2'
  '2019-Datacenter-zhcn'
  '2019-datacenter-zhcn-g2'
  '2022-datacenter'
  '2022-datacenter-azure-edition'
  '2022-datacenter-azure-edition-core'
  '2022-datacenter-azure-edition-core-smalldisk'
  '2022-datacenter-azure-edition-smalldisk'
  '2022-datacenter-core'
  '2022-datacenter-core-g2'
  '2022-datacenter-core-smalldisk'
  '2022-datacenter-core-smalldisk-g2'
  '2022-datacenter-g2'
  '2022-datacenter-smalldisk'
  '2022-datacenter-smalldisk-g2'
])
@description('The Ubuntu version for the VM. This will pick a fully patched image of this given Ubuntu version. Allowed values: 18.04-LTS, 16.04.0-LTS, 14.04.5-LTS.')
param WinOSVersion string = '2019-datacenter'
@description('Size of the virtual machine')
param vmSize string = 'Standard_B1s'
@description('Location for all resources.')
param location string = resourceGroup().location
@description('password for the Virtual Machine.')
@secure()
param adminPassword2 string
var imagePublisher = 'MicrosoftWindowsServer'
var imageOffer = 'WindowsServer'
var vmName_var = 'MyWinVM'
var nicName2_var = 'myVMNic2'

resource nicName2 'Microsoft.Network/networkInterfaces@2020-05-01' existing = {
  name: nicName2_var
}


resource vmName 'Microsoft.Compute/virtualMachines@2020-06-01' = {
  name: vmName_var
  location: location
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    osProfile: {
      computerName: vmName_var
      adminUsername: adminUsername2
      adminPassword: adminPassword2
    }
    storageProfile: {
      imageReference: {
        publisher: imagePublisher
        offer: imageOffer
        sku: WinOSVersion
        version: 'latest'
      }
      osDisk: {
        name: '${vmName_var}_OSDisk'
        caching: 'ReadWrite'
        createOption: 'FromImage'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nicName2.id
        }
      ]
    }
  }
}
