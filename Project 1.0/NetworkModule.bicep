param location string = resourceGroup().location
param virtualNetworkName1 string = 'WSvnet'
param VnetAddressPrefixes1 string = '10.10.10.0/24'
param SubNetworkName1 string = 'Subnet1'
param SubAddressPrefixes1 string = '10.10.10.0/25'
param virtualNetworkName2 string = 'MNGvnet'
param VnetAddressPrefixes2 string = '10.20.20.0/24'
param SubNetworkName2 string = 'Subnet2'
param SubAddressPrefixes2 string = '10.20.20.0/25'


module Network1 'Network1.bicep' = {
  name: 'Vnetwork1'
  params: {
    SubAddressPrefixes1: SubAddressPrefixes1
    SubNetworkName1: SubNetworkName1
    virtualNetworkName1: virtualNetworkName1
    VnetAddressPrefixes1: VnetAddressPrefixes1
    location: location
  }
}

module Network2 'Network2.bicep' = {
  name: 'Vnetwork2'
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
  params: {
    existingRemoteVirtualNetworkResourceGroupName: resourceGroup().name
    VnetA: Network1.name
    VnetB: Network2.name
  }
}
