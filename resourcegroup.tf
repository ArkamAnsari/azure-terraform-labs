resource "azurerm_resource_group" "rgname" {
  name     = "rg-${var.resourcegroup_name}"
  location = var.location
}
