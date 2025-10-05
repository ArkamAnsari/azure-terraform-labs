resource "azurerm_public_ip" "pipdetails" {
  name                = var.pip_name
  resource_group_name = var.resourcegroup_name
  location            = var.location
  allocation_method   = "Static"
  depends_on = [ var.resourcegroup_name ]
}
