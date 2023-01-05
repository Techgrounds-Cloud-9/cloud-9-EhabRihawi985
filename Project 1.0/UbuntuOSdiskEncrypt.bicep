param keyVaultName string
param keyVaultResourceGroup string 
param vmName string = 'MyUbuntuVM'
param location string = resourceGroup().location

var extensionName = 'AzureDiskEncryption'
var keyVaultResourceID = resourceId(keyVaultResourceGroup, 'Microsoft.KeyVault/vaults/', keyVaultName)


resource DiskEncryption 'Microsoft.Compute/virtualMachines/extensions@2022-08-01' = {
  name: '${vmName}/${extensionName}'
  location: location
  properties: {
    publisher: 'Microsoft.Azure.Security'
    type: 'AzureDiskEncryptionForLinux'
    typeHandlerVersion: '1.1'
    autoUpgradeMinorVersion: true
    settings: {
      EncryptionOperation: 'EnableEncryption'
      KeyVaultURL: reference(keyVaultResourceID, '2019-09-01').vaultUri
      KeyVaultResourceId: keyVaultResourceID
      KeyEncryptionAlgorithm: 'RSA-OAEP'
      VolumeType: 'All'
      ResizeOSDisk: false
    }
  }
}
