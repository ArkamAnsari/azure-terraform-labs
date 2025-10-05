module "resourcegroup" {
  source = "./resourcegroup"
resourcegroup_name = "arkam"
location = "central india"
}

module "storageaccount" {
source = "./storageaccount"
resourcegroup_name = module.resourcegroup.rg_name_output
  location = module.resourcegroup.location_output
  storageaccount_name = "stacc"
}

resource "azurerm_management_lock" "storage-lock" {
  name       = "storage-lock"
  scope      = module.storageaccount.storage-id
  lock_level = "CanNotDelete"
  notes      = "Locked because it's needed by a third-party"
}


module "virtualnetwork" {
  source = "./network"
  resourcegroup_name = module.resourcegroup.rg_name_output
  location = module.resourcegroup.location_output
  vnet_name = "demo-vnet"
  app_subnetid = "app-subnet"
  db_subnet = "db-subnet"
}

module "networkcard" {
  source = "./interfacecard"
  resourcegroup_name = module.resourcegroup.rg_name_output
  location = module.resourcegroup.location_output
  nic_name = "demo-nic01"
  app_subnetid = module.virtualnetwork.app_subnetid_output
  pip_id = module.publicip.pip_id_output
}

module "publicip" {
  source = "./public ip"
  resourcegroup_name = module.resourcegroup.rg_name_output
  location = module.resourcegroup.location_output
  pip_name = "demo-pip001"

}

resource "azurerm_management_lock" "pip-lock" {
  name       = "pip-lock"
  scope      = module.publicip.pip_id_output
  lock_level = "CanNotDelete"
  notes      = "Locked because it's needed by a third-party"
}

module "nsg" {
  source = "./securtiygroup"
  resourcegroup_name = module.resourcegroup.rg_name_output
  location = module.resourcegroup.location_output
  app_subnetid = module.virtualnetwork.app_subnetid_output
  nsg_name = "demo-nsg001"
}
