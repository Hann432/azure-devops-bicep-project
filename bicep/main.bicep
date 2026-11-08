@description('Azure Storage account name')
@minLength(3)
@maxLength(24)
param storageAccountName string

@description('Azure region')
param location string = resourceGroup().location

@description('Storage account SKU')
@allowed([
  'Standard_LRS'
  'Standard_GRS'
])
param storageSku string = 'Standard_LRS'

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: storageSku
  }
  kind: 'StorageV2'
  properties: {
    supportsHttpsTrafficOnly: true
    minimumTlsVersion: 'TLS1_2'
  }
}
