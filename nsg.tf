resource "azurerm_network_security_group" "nsgdetails" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resourcegroup_name

  security_rule {
    name                       = "allow-rdp"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
depends_on = [ var.resourcegroup_name ]
}
resource "azurerm_subnet_network_security_group_association" "nsglink" {
  subnet_id                 = var.app_subnetid
  network_security_group_id = azurerm_network_security_group.nsgdetails.id
depends_on = [var.app_subnetid]
}
