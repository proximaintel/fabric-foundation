targetScope = 'resourceGroup'

@description('Name prefix for all resources')
param namePrefix string

@description('Azure region for deployment')
param location string = resourceGroup().location

@description('Fabric capacity SKU (F2, F16, F64, F128)')
@allowed(['F2', 'F16', 'F64', 'F128'])
param fabricSku string = 'F2'

@description('Fabric capacity admin email')
param fabricAdminEmail string

@description('Tags applied to all resources')
param tags object = {
  managed_by: 'bicep'
  accelerator: 'fabric-foundation'
}

module fabricCapacity 'modules/fabric-capacity.bicep' = {
  name: 'fabric-capacity'
  params: {
    namePrefix: namePrefix
    location: location
    sku: fabricSku
    adminEmail: fabricAdminEmail
    tags: tags
  }
}

module storage 'modules/storage.bicep' = {
  name: 'storage'
  params: {
    namePrefix: namePrefix
    location: location
    tags: tags
  }
}

module networking 'modules/networking.bicep' = {
  name: 'networking'
  params: {
    namePrefix: namePrefix
    location: location
    tags: tags
  }
}

module purview 'modules/purview.bicep' = {
  name: 'purview'
  params: {
    namePrefix: namePrefix
    location: location
    tags: tags
  }
}

module monitoring 'modules/monitoring.bicep' = {
  name: 'monitoring'
  params: {
    namePrefix: namePrefix
    location: location
    tags: tags
  }
}
