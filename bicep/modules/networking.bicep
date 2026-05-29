@description('Name prefix for resources')
param namePrefix string

@description('Azure region')
param location string

@description('Tags')
param tags object

resource vnet 'Microsoft.Network/virtualNetworks@2023-05-01' = {
  name: '${namePrefix}-vnet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: ['10.0.0.0/16']
    }
    subnets: [
      {
        name: 'snet-private-endpoints'
        properties: {
          addressPrefix: '10.0.1.0/24'
          privateEndpointNetworkPolicies: 'Disabled'
        }
      }
      {
        name: 'snet-fabric'
        properties: {
          addressPrefix: '10.0.2.0/24'
          delegations: [
            {
              name: 'Microsoft.PowerPlatform/vnetaccesslinks'
              properties: {
                serviceName: 'Microsoft.PowerPlatform/vnetaccesslinks'
              }
            }
          ]
        }
      }
    ]
  }
  tags: tags
}

output vnetId string = vnet.id
output privateEndpointSubnetId string = vnet.properties.subnets[0].id
