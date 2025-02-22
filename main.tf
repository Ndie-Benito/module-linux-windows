

locals {
  location             = "West US 2"
  resource_group_name  = "terraform-vm"

  vnet_config = {
    name = "vnet-module"
  }

  linux_servers = {
    os_simple   = "UbuntuServer"
    public_ip   = ["linsimplevmips"] // Un DNS public unique par région
  }

  windows_servers = {
    hostname     = "mywinvm"
    admin_pass   = "ComplxP@ssw0rd!"
    os_simple    = "WindowsServer"
    public_ip    = ["winsimplevmips"]
  }
}

module "vnet" {
  source              = "Azure/vnet/azurerm"
  version             = "~> 1.0.0"
  location            = local.location
  resource_group_name = local.resource_group_name
}

module "linuxservers" {
  source         = "Azure/vm/azurerm"
  location       = local.location
  vm_os_simple   = local.linux_servers.os_simple
  public_ip_dns  = local.linux_servers.public_ip
  vnet_subnet_id = module.vnet.vnet_subnets[0]
}

module "windowsservers" {
  source         = "Azure/vm/azurerm"
  location       = local.location
  vm_hostname    = local.windows_servers.hostname
  admin_password = local.windows_servers.admin_pass
  vm_os_simple   = local.windows_servers.os_simple
  public_ip_dns  = local.windows_servers.public_ip
  vnet_subnet_id = module.vnet.vnet_subnets[0]
}
