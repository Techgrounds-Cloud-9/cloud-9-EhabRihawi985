param location string = resourceGroup().location
param tenantid string = 'de60b253-74bd-4365-b598-b9e55a2b208d'
param objectId string = '6f655a0d-e4e3-44d9-8be3-17c571644ab3'
param KeyvualtName string

resource kv 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: KeyvualtName
  location: location
  properties: {
    createMode: 'default'
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
    enableRbacAuthorization: false
    enabledForDeployment: true
    enabledForTemplateDeployment: true
    enabledForDiskEncryption: true
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: tenantid
    accessPolicies: [
      {
        objectId: objectId
        permissions: {
          keys: [
            'all'
          ]
        }
        tenantId: tenantid
      }
    ]
  }
}


output keyuri string = kv.properties.vaultUri
