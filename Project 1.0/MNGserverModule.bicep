param location string = resourceGroup().location
param virtualNetworkName2 string = 'MNGvnet'
param VnetAddressPrefixes2 string = '10.20.20.0/24'
param SubNetworkName2 string = 'Subnet2'
param SubAddressPrefixes2 string = '10.20.20.0/25'
var nicName2_var = 'myVMNic2'
param dnsNameForPublicIP2 string = 'dnsehabmng'
var vmName_var = 'MyWinVM'
@description('User name for the Virtual Machine.')
param adminUsername string
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
param vmSize string = 'Standard_B1s'
@description('password for the Virtual Machine.')
@secure()
param adminPassword string
param tenantid string = 'de60b253-74bd-4365-b598-b9e55a2b208d'
param objectId string = '6f655a0d-e4e3-44d9-8be3-17c571644ab3'
param KeyvualtName string
param keyVaultResourceGroup string = resourceGroup().name
param vmName string = 'MyWinVM'
var extensionName = 'AzureDiskEncryption'

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

module MNGserver 'MNGserver.bicep' = {
  name: vmName_var
  dependsOn: [
    NIC2
  ]
  params: {
    adminUsername: adminUsername
    adminPassword: adminPassword
    WinOSVersion: WinOSVersion
    vmSize: vmSize
    location: location
  }
}

module kv 'Keyvault.bicep' = {
  name: KeyvualtName 
  params: {
    KeyvualtName: KeyvualtName
    objectId: objectId
    tenantid: tenantid
    location: location
  }
}


module DiskEncryption 'MNGserverDiskEncryption.bicep' = {
  name: '${vmName}/${extensionName}'
  dependsOn: [
    MNGserver
    kv
  ]
  params: {
    keyVaultName: KeyvualtName
    keyVaultResourceGroup: keyVaultResourceGroup
    vmName: vmName_var
    location: location
  }
}
