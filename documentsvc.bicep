param service string 
//Resgroup 

//param subId string = 'b13d11b3-9583-4815-be4c-a7fddee16992'
/// APP SERVICE PLAN ///
param asp_name string = '${service}-ASP'  

/// APP INSIGHTS ///
param appInsights_name string = '${service}-AppInsights' 

/// APP SERVICE ///
param appservice_name string = '${service}-AS' 
param appserviceslot_name string = '${appservice_name}/staging'

//// APP-CONFIGURATION ////
param appconfig_name string = '${service}-AC'

// KEYVAULT NAME -KV ////
param servkv  string  ='prodplat80-Test'
param keyVault_name string = '${servkv}-KV' // KEYVAULT 

param vaulturl string = 'https://${keyVault_name}.vault.azure.net/'


// COSMOS DB ///
//param documentcosmosdb_name string = 'documentcosmosdata_namedb'  // Cosmos-DB Name


// STORAGE ACCOUNT //
//param storageacct_name string = 'ntprodplatformdocumentstoragu1' 


/// VNET ///
param virtualnetworks_nt_prod_platform_net_vnet_externalid string = '/subscriptions/b13d11b3-9583-4815-be4c-a7fddee16992/resourceGroups/nt-prod-platform-net-rg/providers/microsoft.network/virtualnetworks/NT-Prod-Platform-NET-VNet'
/// SUBNET ///
var subnet_SN = 'NT-Prod-Platform-NET-Partner-SN'



/// TAGS ///
param Product string = 'Partner Service'
var Environment  = 'Production'
var Project = 'Platform'
var appsvctype = 'prod'

param workspaces_defaultworkspace_b13d11b3_9583_4815_be4c_a7fddee16992_eus_externalid string = '/subscriptions/b13d11b3-9583-4815-be4c-a7fddee16992/resourceGroups/defaultresourcegroup-eus/providers/microsoft.operationalinsights/workspaces/defaultworkspace-b13d11b3-9583-4815-be4c-a7fddee16992-eus'

//Location
 param Location string = resourceGroup().location



/// APP CONFIGURATION ///
resource appconfiguration 'Microsoft.AppConfiguration/configurationStores@2021-10-01-preview' = {
  name: appconfig_name
  location: Location

  tags: {
    owner: 'Andrew Yirak'
    Department: 'NAF Tech'
    Environment: 'Production'
    Product: Product
    Project: Project
  }
  sku: {
    name: 'standard'
    
  }
 
  properties: {

    disableLocalAuth: false
    enablePurgeProtection: false
    encryption: { 
  
  
    }
    softDeleteRetentionInDays: 7
    
  }
}



/// KEY VAULT ///

resource kv_resource 'Microsoft.KeyVault/vaults@2019-09-01' = {
  name: keyVault_name
  location: Location
  tags: {
    owner: 'Andrew Yirak'
    Department: 'NAF Tech'
    Environment: 'Production'
    Product: Product
    Project: Project 

  }

   properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: '04986fa2-6d28-46f7-966a-b1ac32f74fa8'
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Allow'
      ipRules: []
      virtualNetworkRules: [
        {
          id: '${virtualnetworks_nt_prod_platform_net_vnet_externalid}/subnets/${subnet_SN}'
          ignoreMissingVnetServiceEndpoint: false
        }
      ]
    }
    accessPolicies: [
      {
        tenantId: '04986fa2-6d28-46f7-966a-b1ac32f74fa8'
        objectId: appService.identity.principalId  
        permissions: {
          keys: []
          secrets: [
            'Get'
            'List'
          ]
          certificates: []
        }
      }
      {
        tenantId: '04986fa2-6d28-46f7-966a-b1ac32f74fa8'
        objectId: webAppStagingSlot.identity.principalId 
        permissions: {
          keys: []
          secrets: [
            'Get'
            'List'
          ]
          certificates: []
        }
      }
      {
        tenantId: '04986fa2-6d28-46f7-966a-b1ac32f74fa8'
        objectId: 'f24a6d96-3339-4851-86f4-9ea219816562'
        permissions: {
          keys: [
            'Get'
            'List'
            'Update'
            'Create'
            'Import'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
            'GetRotationPolicy'
            'SetRotationPolicy'
            'Rotate'
          ]
          secrets: [
            'Get'
            'List'
            'Set'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
          ]
          certificates: [
            'Get'
            'List'
            'Update'
            'Create'
            'Import'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
            'ManageContacts'
            'ManageIssuers'
            'GetIssuers'
            'ListIssuers'
            'SetIssuers'
            'DeleteIssuers'
          ]
        }
      }
      {
        tenantId: '04986fa2-6d28-46f7-966a-b1ac32f74fa8'
        objectId: '751110db-be6f-4e07-920b-acae7246d031'
        permissions: {
          keys: [
            'Get'
            'List'
            'Update'
            'Create'
            'Import'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
            'GetRotationPolicy'
            'SetRotationPolicy'
            'Rotate'
          ]
          secrets: [
            'Get'
            'List'
            'Set'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
          ]
          certificates: [
            'Get'
            'List'
            'Update'
            'Create'
            'Import'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
            'ManageContacts'
            'ManageIssuers'
            'GetIssuers'
            'ListIssuers'
            'SetIssuers'
            'DeleteIssuers'
          ]
        }
      }
      {
        tenantId: '04986fa2-6d28-46f7-966a-b1ac32f74fa8'
        objectId: '933d01c2-e2b3-419d-977c-2cb05c53dd89'
        permissions: {
          keys: [
            'Get'
            'List'
            'Update'
            'Create'
            'Import'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
            'GetRotationPolicy'
            'SetRotationPolicy'
            'Rotate'
          ]
          secrets: [
            'Get'
            'List'
            'Set'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
          ]
          certificates: [
            'Get'
            'List'
            'Update'
            'Create'
            'Import'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
            'ManageContacts'
            'ManageIssuers'
            'GetIssuers'
            'ListIssuers'
            'SetIssuers'
            'DeleteIssuers'
          ]
        }
      }
    ]
    enabledForDeployment: false
    enabledForDiskEncryption: false
    enabledForTemplateDeployment: false
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
    enableRbacAuthorization: false
    vaultUri: vaulturl
    provisioningState: 'Succeeded'
     enablePurgeProtection: true
      createMode: 'default'
  }
}



/// APP SERVICE PLAN  ///

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: asp_name
  location: Location

  tags: {
    owner: 'Andrew Yirak'
    Department: 'NAF Tech'
    Environment: Environment
    Product: Product 
    Project: Project
    
  }

  sku: {
    name: 'P1v2'
    tier: 'PremiumV2'
    size: 'P1v2'
    family: 'Pv2'
    capacity: 3
    
     
    
  }
 
  kind: 'app'
    
  properties: {
     
    perSiteScaling: false
    maximumElasticWorkerCount: 1
    isSpot: false
    reserved: false
    isXenon: false
    hyperV: false
    targetWorkerCount: 0
    targetWorkerSizeId: 0
     
     
}
  

}






/// APP SERVICE ///
resource appService 'Microsoft.Web/sites@2018-11-01' = {

  name: appservice_name
  location: Location


  tags: {
    owner: 'Andrew Yirak'
    Department: 'NAF Tech'
    Environment: Environment
    Product: Product 
    Project: Project
    appsvctype : appsvctype

  }
  kind:'app'
  identity: {
    type: 'SystemAssigned'
  }
   
  properties: {
    
    serverFarmId: appServicePlan.id
     enabled: true
      
      
    
    
  
  }

}


resource webappVnet 'Microsoft.Web/sites/networkConfig@2020-06-01' = {
 parent: appService
  name: 'virtualNetwork'
  properties: {
    subnetResourceId: '${virtualnetworks_nt_prod_platform_net_vnet_externalid}/subnets/${subnet_SN}'
    swiftSupported: true
  }
}





/// APP SERVICE SETTINGS ///
resource appservicesetting 'Microsoft.Web/sites/config@2021-03-01' = {
      name: 'web'
      parent: appService
       

         properties: {
            appSettings: [
             {
               name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
               value : appInsightsComponentS.properties.InstrumentationKey
             }
             {
              name: 'ASPNETCORE_ENVIRONMENT'

              // if true, use Production, else use Staging

              value : appService.tags[ appsvctype ]   ? 'Production' : 'Staging'
        
            }
                 
            
 

          ]
        
        alwaysOn:true
        virtualApplications:  [
          {
            virtualPath: '/'
            physicalPath: 'site\\wwwroot'
            preloadEnabled: true
          }
        ]
        autoHealEnabled: false
        vnetName: 'virtualnetworks/nt-prod-platform-net-vnet'
        vnetRouteAllEnabled: true
        vnetPrivatePortsCount: 0
        localMySqlEnabled: false
        managedServiceIdentityId: 1558
        
        ipSecurityRestrictions: [
          {
            vnetSubnetResourceId: '${virtualnetworks_nt_prod_platform_net_vnet_externalid}/subnets/NT-Prod-Platform-NET-APIM-SN'
            action: 'Allow'
            tag: 'Default'
            priority: 150
            name: 'Allow APIM'
          }
          {
            vnetSubnetResourceId: '${virtualnetworks_nt_prod_platform_net_vnet_externalid}/subnets/${subnet_SN}'
            action: 'Allow'
            tag: 'Default'
            priority: 200
            name: 'Allow Campaign SN'
          }
          {
            ipAddress: 'Any'
            action: 'Deny'
            priority: 2147483647
            name: 'Deny all'
            description: 'Deny all access'
          }
        ]
        scmIpSecurityRestrictions: [
          {
            ipAddress: 'AzureCloud'
            action: 'Allow'
            tag: 'ServiceTag'
            priority: 150
            name: 'Allow ADO SN'
          }
          {
            ipAddress: 'Any'
            action: 'Deny'
            priority: 2147483647
            name: 'Deny all'
            description: 'Deny all access'
          }
        ]
        scmIpSecurityRestrictionsUseMain: false
        http20Enabled: true
        netFrameworkVersion:'v6.0'
        minTlsVersion: '1.2'
        scmMinTlsVersion: '1.2'
        ftpsState: 'Disabled'
        preWarmedInstanceCount: 0
        functionAppScaleLimit: 0
        functionsRuntimeScaleMonitoringEnabled: false
        minimumElasticInstanceCount: 0
        azureStorageAccounts: {
         
        }
      }

 }



// Web App Staging Slot
resource webAppStagingSlot 'Microsoft.Web/sites/slots@2021-02-01' = {
  name: appserviceslot_name
  location: Location
  tags: {
    owner: 'Andrew Yirak'
    Department: 'NAF Tech'
    Environment: Environment
    Product: Product 
    Project: Project
    appsvctype : 'staging'

  }

  kind: 'app'
    identity: {
       type: 'SystemAssigned'
    }
  properties: {
    
    serverFarmId: appServicePlan.id
     enabled: true
     
    
    
  }
}







/// APP INSIGHTS ///

resource appInsightsComponentS 'Microsoft.Insights/components@2020-02-02' = {
  name: appInsights_name
  location: Location
   
  tags: {
    owner: 'Andrew Yirak'
    Department: 'NAF Tech' 
    Environment: Environment
    Product: Product 
    Project: Project 

  }

   
  kind: 'web'
  properties: {      
    Application_Type: 'web'
    publicNetworkAccessForQuery: 'Enabled'
    RetentionInDays: 90  
    publicNetworkAccessForIngestion: 'Enabled'
    WorkspaceResourceId: workspaces_defaultworkspace_b13d11b3_9583_4815_be4c_a7fddee16992_eus_externalid  
    
  }

  dependsOn: [
    appServicePlan
  ]

}


//resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
//  name: storageacct_name
// location: Location

 // kind: 'StorageV2'
  //sku: {
   // name: 'Standard_ZRS'
 // }
//}
