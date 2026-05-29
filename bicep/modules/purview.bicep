@description('Name prefix for resources')
param namePrefix string

@description('Azure region')
param location string

@description('Tags')
param tags object

resource purviewAccount 'Microsoft.Purview/accounts@2021-12-01' = {
  name: '${namePrefix}-purview'
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    publicNetworkAccess: 'Disabled'
    managedResourceGroupName: '${namePrefix}-purview-managed-rg'
  }
  tags: tags
}

output purviewAccountId string = purviewAccount.id
output purviewAccountName string = purviewAccount.name
