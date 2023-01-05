param location string = resourceGroup().location
param virtualnetworkname1 string = 'WSvnet'
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
var WSvmName_var = 'MyUbuntuVM'
@description('User name for the Virtual Machine.')
param WSadminUsername string
@allowed([
  'sshPublicKey'
  'password'
])
@description('Type of authentication to use on the Virtual Machine. SSH key is recommended.')
param authenticationType string = 'password'
@description('SSH Key or password for the Virtual Machine. SSH key is recommended.')
@secure()
param WSadminPasswordOrKey string
@allowed([
  '18.04-LTS'
  '20.04-LTS'
  '22.04-LTS'
])
@description('The Ubuntu version for the VM. This will pick a fully patched image of this given Ubuntu version. Allowed values: 18.04-LTS, 16.04.0-LTS, 14.04.5-LTS.')
param ubuntuOSVersion string = '18.04-LTS'
@description('Size of the virtual machine')
param WSvmSize string = 'Standard_D2s_v3'
param tenantid string = 'de60b253-74bd-4365-b598-b9e55a2b208d'
param objectId string = '6f655a0d-e4e3-44d9-8be3-17c571644ab3'
@description('Enter unique keyvaultname.')
param KeyvualtName string
param BackupInstance string = 'WebserverInstanceBackup'
param policyName string = 'backupPolicy'
param keyVaultResourceGroup string = resourceGroup().name

param virtualNetworkName2 string = 'MNGvnet'
param VnetAddressPrefixes2 string = '10.20.20.0/24'
param SubNetworkName2 string = 'Subnet2'
param SubAddressPrefixes2 string = '10.20.20.0/25'
var nicName2_var = 'myVMNic2'
param dnsNameForPublicIP2 string = 'dnsehabmng'
var MNGvmName_var = 'MyWinVM'
@description('User name for the Virtual Machine.')
param MNGadminUsername string
@allowed([
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
param WinOSVersion string = '2019-datacenter-core-g2'
@description('Size of the virtual machine')
param MNGvmSize string = 'Standard_B1s'
@description('password for the Virtual Machine.')
@secure()
param MNGadminPassword string



module Network1'Network1.bicep' = {
  name: 'WSVNET'
  params: {
    SubAddressPrefixes1: SubAddressPrefixes1
    SubNetworkName1: SubNetworkName1
    virtualNetworkName1: virtualnetworkname1
    VnetAddressPrefixes1: VnetAddressPrefixes1
    location: location
  }
}

module Network2 'Network2.bicep' = {
  name: virtualNetworkName2
  params: {
    SubAddressPrefixes2: SubAddressPrefixes2
    SubNetworkName2: SubNetworkName2
    virtualNetworkName2: virtualNetworkName2
    VnetAddressPrefixes2: VnetAddressPrefixes2
    location: location
  }
}

module Networkpeering 'Networkpeering.bicep' = {
  name: 'Networkpeering'
  dependsOn: [
    Network1
    Network2
  ]
  params: {
    existingRemoteVirtualNetworkResourceGroupName: resourceGroup().name
    VnetA: Network1.name
    VnetB: Network2.name
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

module NIC 'NIC1.bicep' = {
  name: nicName_var
  dependsOn: [
    Network1
  ]
  params: {
    dnsNameForPublicIP: dnsNameForPublicIP
    location: location
    SubNetworkName1: SubNetworkName1
    virtualnetworkname: Network1.name
  }
}

module NIC2 'NIC2.bicep' = {
  name: nicName2_var
  dependsOn: [
    Network2
  ]
  params: {
    dnsNameForPublicIP2:dnsNameForPublicIP2
    SubNetworkName2: SubNetworkName2
    virtualnetworkname2: virtualNetworkName2
    location: location
  }
}

module Webserver 'Webserver.bicep' = {
  name: WSvmName_var
  dependsOn: [
    NIC
    StorageAccount
  ]
  params: {
    adminPasswordOrKey: WSadminPasswordOrKey
    adminUsername: WSadminUsername
    authenticationType: authenticationType
    location: location
    ubuntuOSVersion: ubuntuOSVersion
    vmSize: WSvmSize
    storageAccountName: storageAccountName
  }
}

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


module DiskEncryption 'UbuntuOSdiskEncrypt.bicep' = {
  dependsOn: [
    Keyvault
    Webserver
  ]
  name: 'UbuntuDiskEncryption'
  params: {
    keyVaultResourceGroup:keyVaultResourceGroup
    keyVaultName: KeyvualtName
    vmName: WSvmName_var
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

module MNGserver 'MNGserver.bicep' = {
  name: MNGvmName_var
  dependsOn: [
    NIC2
  ]
  params: {
    adminUsername: MNGadminUsername
    adminPassword: MNGadminPassword
    WinOSVersion: WinOSVersion
    vmSize: MNGvmSize
    location: location
  }
}


module DiskEncryption2 'MNGserverDiskEncryption.bicep' = {
  name: 'WinVmDiskEncryption'
  dependsOn: [
    MNGserver
    Keyvault
  ]
  params: {
    keyVaultName: KeyvualtName
    keyVaultResourceGroup: keyVaultResourceGroup
    vmName: MNGvmName_var
    location: location
  }
}

output WebserverName string = Webserver.name
output keyurl string = Keyvault.outputs.keyuri
