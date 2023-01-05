@description('Location for all resources.')
param location string = resourceGroup().location

@description('User name for the Virtual Machine.')
param adminUsername string


@allowed([
  '18.04-LTS'
  '20.04-LTS'
  '22.04-LTS'
])
@description('The Ubuntu version for the VM. This will pick a fully patched image of this given Ubuntu version. Allowed values: 18.04-LTS, 16.04.0-LTS, 14.04.5-LTS.')
param ubuntuOSVersion string = '18.04-LTS'

@description('Size of the virtual machine')
param vmSize string = 'Standard_D2s_v3'

@allowed([
  'sshPublicKey'
  'password'
])
@description('Type of authentication to use on the Virtual Machine. SSH key is recommended.')
param authenticationType string = 'password'

@description('SSH Key or password for the Virtual Machine. SSH key is recommended.')
@secure()
param adminPasswordOrKey string

var imagePublisher = 'Canonical'
var imageOffer = 'UbuntuServer'
var nicName_var = 'myVMNic'
var vmName_var = 'MyUbuntuVM'


var linuxConfiguration = {
  disablePasswordAuthentication: true
  ssh: {
    publicKeys: [
      {
        path: '/home/${adminUsername}/.ssh/authorized_keys'
        keyData: adminPasswordOrKey
      }
    ]
  }
}


resource nicName 'Microsoft.Network/networkInterfaces@2020-05-01' existing = {
  name: nicName_var
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
      adminUsername: adminUsername
      adminPassword: adminPasswordOrKey
      linuxConfiguration: ((authenticationType == 'password') ? json('null') : linuxConfiguration)
    }
    storageProfile: {
      imageReference: {
        publisher: imagePublisher
        offer: imageOffer
        sku: ubuntuOSVersion
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
          id: nicName.id
        }
      ]
    }
  }
}


output vmName string = vmName.properties.vmId

param storageAccountName string = 'ehabtechgrounds'

resource vmName_install_apache 'Microsoft.Compute/virtualMachines/extensions@2020-06-01' = {
  parent: vmName
  name: 'install_apache'
  location: location
  properties: {
    publisher: 'Microsoft.Azure.Extensions'
    type: 'CustomScript'
    typeHandlerVersion: '2.1'
    autoUpgradeMinorVersion: true
    settings: {
      skipDos2Unix: false
      //storageAccountName : StorageAccountName
      //storageAccountKey : listKeys(resourceId('Microsoft.Storage/storageAccounts', StorageAccountName), '2022-05-01').keys[0].value
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

