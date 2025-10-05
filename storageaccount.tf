resource "random_string" "random" {
    length = 6
    special = false
    upper = false
}

resource "azurerm_storage_account" "st" {
  name                     = "${var.storageaccount_name}${random_string.random.result}"
  resource_group_name      = var.resourcegroup_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

depends_on = [ var.resourcegroup_name ]
}

output "storage-id" {
  value = azurerm_storage_account.st.id
  
}
