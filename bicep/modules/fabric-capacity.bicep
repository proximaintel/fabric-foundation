@description('Name prefix for resources')
param namePrefix string

@description('Azure region')
param location string

@description('Fabric capacity SKU')
param sku string

@description('Admin email for Fabric capacity')
param adminEmail string

@description('Tags')
param tags object

resource fabricCapacity 'Microsoft.Fabric/capacities@2023-11-01' = {
  name: '${namePrefix}-fabric'
  location: location
  sku: {
    name: sku
    tier: 'Fabric'
  }
  properties: {
    administration: {
      members: [adminEmail]
    }
  }
  tags: tags
}

output capacityId string = fabricCapacity.id
output capacityName string = fabricCapacity.name
