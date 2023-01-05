param location string = resourceGroup().location
param virtualnetworkname string = 'WSvnet'
param VnetAddressPrefixes1 string = '10.10.10.0/24'
param SubNetworkName1 string = 'Subnet1'
param SubAddressPrefixes1 string = '10.10.10.0/25'
var nicName_var = 'myVMNic'
@description('Unique DNS Name for the Public IP used to access the Virtual Machine.')
param dnsNameForPublicIP string = 'dnsehab'
@description('Name of the blob as it is stored in the blob container')
param filename string = 'installapache.sh'
@description('Name of the blob container')
param containerName string = 'data'
@description('Desired name of the storage account')
param storageAccountName string = 'ehabtechgrounds'
var vmName_var = 'MyUbuntuVM'
@description('User name for the Virtual Machine.')
param adminUsername string = 'ehabadmin'
@allowed([
  'sshPublicKey'
  'password'
])
@description('Type of authentication to use on the Virtual Machine. SSH key is recommended.')
param authenticationType string = 'password'
@description('SSH Key or password for the Virtual Machine. SSH key is recommended.')
@secure()
param adminPasswordOrKey string
@allowed([
  '18.04-LTS'
  '20.04-LTS'
  '22.04-LTS'
])
@description('The Ubuntu version for the VM. This will pick a fully patched image of this given Ubuntu version. Allowed values: 18.04-LTS, 16.04.0-LTS, 14.04.5-LTS.')
param ubuntuOSVersion string = '18.04-LTS'
@description('Size of the virtual machine')
param vmSize string = 'Standard_D2s_v3'
param tenantid string = 'de60b253-74bd-4365-b598-b9e55a2b208d'
param objectId string = '6f655a0d-e4e3-44d9-8be3-17c571644ab3'
@description('Enter unique keyvaultname.')
param KeyvualtName string
param BackupInstance string = 'WebserverInstanceBackup'
param policyName string = 'backupPolicy'
param keyVaultResourceGroup string = resourceGroup().name

module virtualnetwork1'Network1.bicep' = {
  name: 'WSVNET'
  params: {
    SubAddressPrefixes1: SubAddressPrefixes1
    SubNetworkName1: SubNetworkName1
    virtualNetworkName1: virtualnetworkname
    VnetAddressPrefixes1: VnetAddressPrefixes1
    location: location
  }
}

module StorageAccount 'StorageAccount.bicep' = {
  name: storageAccountName
  params: {
    containerName: containerName
    filename: filename
    location: location
    storageAccountName: storageAccountName
  }
}


module NIC 'NIC.bicep' = {
  name: nicName_var
  dependsOn: [
    virtualnetwork1
  ]
  params: {
    dnsNameForPublicIP: dnsNameForPublicIP
    location: location
    SubNetworkName1: SubNetworkName1
    virtualnetworkname: virtualnetwork1.name
  }
}

module Webserver 'Webserver.bicep' = {
  name: vmName_var
  dependsOn: [
    NIC
    StorageAccount
  ]
  params: {
    adminPasswordOrKey: adminPasswordOrKey
    adminUsername: adminUsername
    authenticationType: authenticationType
    location: location
    ubuntuOSVersion: ubuntuOSVersion
    vmSize: vmSize
    storageAccountName: storageAccountName
  }
}

output WebserverName string = Webserver.name

module Keyvault 'Keyvault.bicep' = {
  name: KeyvualtName
  dependsOn: [
    StorageAccount
    Webserver
  ]
  params: {
    KeyvualtName: KeyvualtName
    location: location
    objectId: objectId
    tenantid: tenantid
  }
}
output keyurl string = Keyvault.outputs.keyuri

module DiskEncryption 'UbuntuOSdiskEncrypt.bicep' = {
  dependsOn: [
    Keyvault
    Webserver
  ]
  name: 'UbuntuDiskEncryption'
  params: {
    keyVaultResourceGroup:keyVaultResourceGroup
    keyVaultName: KeyvualtName
    vmName: vmName_var
    location: location
  }
}

module BackupWSinst 'Backupwebserver.bicep' = {
  name: BackupInstance
  dependsOn: [
    Webserver
  ]
  params: {
    location: location
    policyName: policyName
  }
}

