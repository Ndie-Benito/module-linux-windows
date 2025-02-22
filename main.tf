module "vnet" {
  source              = "Azure/network/azurerm"
  version             = "~> 3.0.0"
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "linuxservers" {
  source         = "Azure/compute/azurerm"
  resource_group_name = var.resource_group_name
  version        = "~> 3.0.0"
  location       = var.location
  vm_os_simple   = "UbuntuServer"
  public_ip_dns  = ["linsimplevmips"]
  vnet_subnet_id = module.vnet.vnet_subnets[0]
}


module "windowsservers" {
  source         = "Azure/compute/azurerm"
  version        = "~> 3.0.0"
  location       = var.location
  vm_hostname    = "mywinvm"
  admin_password = var.admin_password
  vm_os_simple   = "WindowsServer"
  public_ip_dns  = ["winsimplevmips"]
  vnet_subnet_id = module.vnet.vnet_subnets[0]
}
