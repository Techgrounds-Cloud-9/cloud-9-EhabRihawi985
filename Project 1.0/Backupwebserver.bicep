
@description('Specifies the location for all resources.')
param location string = resourceGroup().location

var vmName_var = 'MyUbuntuVM'
var vaultName = '${vmName_var}-vault'
var backupFabric = 'Azure'
var backupPolicyName = 'DefaultPolicy'
var protectionContainer = 'iaasvmcontainer;iaasvmcontainerv2;${resourceGroup().name};${vmName_var}'
var protectedItem = 'vm;iaasvmcontainerv2;${resourceGroup().name};${vmName_var}'
@description('Name of the Backup Policy')
param policyName string = 'backupPolicy'

resource vmName 'Microsoft.Compute/virtualMachines@2020-06-01' existing = {
  name: vmName_var
}

resource recoveryServicesVault 'Microsoft.RecoveryServices/vaults@2022-10-01' = {
  name: vaultName
  location: location
  sku: {
    name: 'RS0'
    tier: 'Standard'
  }
  properties: {
    publicNetworkAccess: 'Enabled'
  }
}

resource vaultName_backupFabric_protectionContainer_protectedItem 'Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/protectedItems@2022-09-01-preview' = {
  name: '${vaultName}/${backupFabric}/${protectionContainer}/${protectedItem}'
  properties: {
    protectedItemType: 'Microsoft.Compute/virtualMachines'
    policyId: '${recoveryServicesVault.id}/backupPolicies/${backupPolicyName}'
    sourceResourceId:  vmName.id
  }
}

resource MyUbuntuBUPolicy 'Microsoft.RecoveryServices/vaults/backupPolicies@2022-09-01-preview' = {
  name: policyName
  location: location
  parent: recoveryServicesVault
  properties: {
    backupManagementType: 'AzureIaasVM'
    instantRpRetentionRangeInDays: 2
    schedulePolicy: {
      scheduleRunFrequency: 'Daily'
      scheduleRunTimes: [
        '21:00'
      ]
      schedulePolicyType: 'SimpleSchedulePolicy'
    }
    retentionPolicy: {
      dailySchedule: {
        retentionTimes: [
          '21:00'
        ]
        retentionDuration: {
          count: 7
          durationType: 'Days'
        }
      }
      retentionPolicyType: 'LongTermRetentionPolicy'
    }
    timeZone: 'W. Europe Standard Time'
  }
}

