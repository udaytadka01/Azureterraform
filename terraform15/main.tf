 resource "azurerm_resource_group" "strg" {
    name        = "${var.rgname}"
    location    = "${var.rgloc}"
}


resource "azurerm_storage_account" "tfstrg" {
    name       = "${var.stacname}"
    #resource_group_name = azurerm_resource_group.strg.name
    resource_group_name = "${var.rgname}"
    location   = azurerm_resource_group.strg.location
    account_tier = "Standard"
    account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstrg" {
    name    = "firstcntr"
    #storage_account_name = "${var.stacname}"
    storage_account_name = azurerm_storage_account.tfstrg.name
}

resource "azurerm_storage_blob" "tfstrg" {
    name                       = "file"
    storage_account_name       = azurerm_storage_account.tfstrg.name
    storage_container_name     = azurerm_storage_container.tfstrg.name
    type                       = "block"
    source                     = "C:/Users/Uday_Tadka/Terraform14.10/test.txt"
}