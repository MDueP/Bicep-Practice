@minLength(3)
@maxLength(24)
@description('provide a name for the Storage Account. Only lower case and inbetween 3-24 characters')
param storageName string = 'store${uniqueString(resourceGroup().id)}'
param location string = resourceGroup().location



resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: 'testvnet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'Subnet-1'
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
      {
        name: 'Subnet-2'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}
resource exampleStorage 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storageName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
