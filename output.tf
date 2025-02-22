output "vnet_id" {
  value = module.vnet.vnet_id
}

output "linux_vm_ip" {
  value = module.linuxservers.public_ip_dns
}

output "windows_vm_ip" {
  value     = module.windowsservers.public_ip_dns
  sensitive = true
}
