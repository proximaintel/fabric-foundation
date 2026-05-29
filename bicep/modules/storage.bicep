@description('Name prefix for resources')
param namePrefix string

@description('Azure region')
param location string

@description('Tags')
param tags object

var storageAccountName = replace('${namePrefix}fabric', '-', '')

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_GRS'
  }
  properties: {
    isHnsEnabled: true
    minimumTlsVersion: 'TLS1_2'
    supportsHttpsTrafficOnly: true
    networkAcls: {
      defaultAction: 'Deny'
      bypass: 'AzureServices'
    }
  }
  tags: tags
}

output storageAccountId string = storageAccount.id
output storageAccountName string = storageAccount.name
