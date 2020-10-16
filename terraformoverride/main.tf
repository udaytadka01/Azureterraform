resource "azurerm_resource_group" "strg" {
    name        = "${var.rgname}${random_string.rand.result}"
    location    = "${var.rgloc}"
}

resource "random_string" "rand" {
  length    = 4
  special   = false
  upper     = false
  number    = false
}

resource "azurerm_storage_account" "tfstrg" {
    name       = "${var.stacname}${random_string.rand.result}"
    count      = "${var.env == "dev" ? 1 : 0}"
    #name       = "${var.stacname}"
    #resource_group_name = azurerm_resource_group.strg.name
    resource_group_name = "${var.rgname}"
    location   = azurerm_resource_group.strg.location
    account_tier = "${var.sku}"
    account_replication_type = "LRS"
    #count = 2
}