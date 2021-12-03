resource "azurerm_resource_group" "rg1" {
  name     = "${local.name_prefix}-${var.rg_name}"
  location = var.rg_location
  tags     = local.common_tags
}

resource "azurerm_storage_account" "storage_account_vanilla" {
  name                     = "${local.name_prefix}vanillas101"
  resource_group_name      = azurerm_resource_group.rg1.name
  location                 = azurerm_resource_group.rg1.location
  account_tier             = "Standard"
  account_replication_type = lookup(var.sa_rep_type, var.environment, "LRS")
  tags                     = local.common_tags
}