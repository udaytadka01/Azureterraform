provider "azurerm"{
    version ="=1.44.0"
 
    subscription_id  =  ""
    client_id        =  ""
    client_secret    =  ""
    tenant_id        =  ""

}

resource "azurerm_resource_group" "strg" {
    name        = "Strg_RG"
    location    = "WEST US"
}


resource "azurerm_storage_account" "tfstrg" {
    name       = "azstrgqwer"
    resource_group_name = azurerm_resource_group.strg.name
    location   = azurerm_resource_group.strg.location
    account_tier = "Standard"
    account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstrg" {
    name    = "firstcntr"
    storage_account_name = azurerm_storage_account.tfstrg.name
}

resource "azurerm_storage_blob" "tfstrg" {
    name                       = "file"
    storage_account_name       = azurerm_storage_account.tfstrg.name
    storage_container_name     = azurerm_storage_container.tfstrg.name
    type                       = "block"
    source                     = "C:/Users/Uday_Tadka/Terraform14.10/test.txt"
}