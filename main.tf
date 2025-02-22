locals {
  linux_servers = {
    os_simple  = "UbuntuServer"
    public_ip  = ["linsimplevmips"] // DNS public unique par région
  }

  windows_servers = {
    hostname   = "benito-vm"
    os_simple  = "WindowsServer"
    public_ip  = ["winsimplevmips"]
  }
}

module "vnet" {
  source              = "Azure/vnet/azurerm"
  version             = "~> 1.0.0"
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "linuxservers" {
  source         = "Azure/vm/azurerm"
  location       = var.location
  vm_os_simple   = local.linux_servers.os_simple
  public_ip_dns  = local.linux_servers.public_ip
  vnet_subnet_id = module.vnet.vnet_subnets[0]
}

module "windowsservers" {
  source         = "Azure/vm/azurerm"
  location       = var.location
  vm_hostname    = local.windows_servers.hostname
  admin_password = var.admin_password  # Utilisation de la variable sensible ici
  vm_os_simple   = local.windows_servers.os_simple
  public_ip_dns  = local.windows_servers.public_ip
  vnet_subnet_id = module.vnet.vnet_subnets[0]
}
