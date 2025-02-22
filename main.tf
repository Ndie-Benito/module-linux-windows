

#  Module VNet : Création du réseau virtuel
module "vnet" {
  source              = "Azure/vnet/azurerm"
  version             = "~> 1.0.0"
  location            = var.location
  resource_group_name = var.resource_group_name
}


module "linuxservers" {
  source         = "Azure/vm/azurerm"
  location       = var.location
  vm_os_simple   = "UbuntuServer"
  public_ip_dns  = ["linuxvm-${random_string.suffix.result}"]
  vnet_subnet_id = module.vnet.vnet_subnets[0]
}


module "windowsservers" {
  source          = "Azure/vm/azurerm"
  location        = var.location
  vm_hostname     = "benito-vm"
  admin_password  = var.admin_password
  vm_os_simple    = "WindowsServer"
  public_ip_dns   = ["windowsvm-${random_string.suffix.result}"]
  vnet_subnet_id  = module.vnet.vnet_subnets[0]
}


resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}
