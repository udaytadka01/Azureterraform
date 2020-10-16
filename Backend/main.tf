resource "azurerm_resource_group" "strg" {
    name        = "${var.rgname}"
    location    = "${var.rgloc}"
}
terraform {
  backend "azurerm" {
    resource_group_name  = "backendtfrg"
    storage_account_name = "shellstrg1234"
    container_name       = "tfstate"
    key                  = "project.terraform.tfstate"
  }
}

resource "random_string" "rand" {
  length    = 4
  special   = false
  upper     = false
  number    = false
}

resource "azurerm_storage_account" "tfstrg" {
    name       = "${var.stacname}${random_string.rand.result}"
    #name       = "${var.stacname}"
    #resource_group_name = azurerm_resource_group.strg.name
    resource_group_name = "${var.rgname}"
    location   = azurerm_resource_group.strg.location
    account_tier = "Standard"
    account_replication_type = "LRS"
    #count = 2
}
