param location string = resourceGroup().location
param vNetName1 string = 'WSvnet'
param addressPrefix string = '10.10.10.0/24'
param subnetName string = 'Subnet1'
param subnetPrefix string = '10.10.10.0/25'
param subnetName2 string = 'myAGSubnet'
param subnetPrefix2 string = '10.10.10.128/26'
param vNetName2 string = 'MNGvnet'
param VnetAddressPrefixes2 string = '10.20.20.0/24'
param SubNetworkName2 string = 'Subnet2'
param SubAddressPrefixes2 string = '10.20.20.0/25'
var nicName2_var = 'myVMNic2'
param dnsNameForPublicIP2 string = 'dnsehabmng'
@description('Name of the blob as it is stored in the blob container')
param filename string = 'installapache.sh'
@description('Name of the blob container')
param containerName string = 'data'
@description('Desired name of the storage account')
param storageAccountName string = 'ehabtechgrounds'
@description('Location for all resources.')
param AppGWSubnet string = 'myAGSubnet'
var applicationGateWayName = 'myAppGateway'
param dnsNameForPublicIP string = 'dnsehab'
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
@description('Fault Domain count for each placement group.')
param platformFaultDomainCount int = 1
var vmScaleSetName = toLower(substring('vmssName${uniqueString(resourceGroup().id)}', 0, 9))
@description('User name for the Virtual Machine.')
param adminUsername2 string
@description('The Ubuntu version for the VM. This will pick a fully patched image of this given Ubuntu version. Allowed values: 18.04-LTS, 16.04.0-LTS, 14.04.5-LTS.')
param WinOSVersion string = '2019-datacenter'
param vmSize string = 'Standard_B1s'
@description('password for the Virtual Machine.')
@secure()
param adminPassword2 string
param MNGVM string = 'MyWinVM'
param tenantid string = 'de60b253-74bd-4365-b598-b9e55a2b208d'
param objectId string = '6f655a0d-e4e3-44d9-8be3-17c571644ab3'
param KeyvualtName string = 'ehabkeyvault'
param vmName string = 'MyWinVM'
param keyVaultResourceGroup string = resourceGroup().name
var extensionName = 'AzureDiskEncryption'
var keyVaultResourceID = resourceId(keyVaultResourceGroup, 'Microsoft.KeyVault/vaults/', KeyvualtName)
param PrivatePublicIP string
