param blobcontainerName string 

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-08-01' existing = {
  name: 'ehabtechgrounds'
}

// Create container
resource containers 'Microsoft.Storage/storageAccounts/blobServices/containers@2019-06-01' = {
  name: '${storageAccount.name}/default/${blobcontainerName}'
  properties: {
    publicAccess: 'Container'
  }
  dependsOn: [
    storageAccount
  ]
}

resource Newfile 'Microsoft.Storage/storageAccounts/fileServices@2022-09-01' = {
  name: 'file_one'
  dependsOn: [
    storageAccount
  ]
}


output ContainerName string = containers.id

