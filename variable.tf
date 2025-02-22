variable "subscription_id"{
  type=string
}

variable "client_id"{
  type=string
}
variable "client_secret"{
  type=string
}
variable "tenant_id"{
  type=string
}



variable "admin_password" {
  type        = string
  description = "Mot de passe administrateur de la VM"
  sensitive   = true
}

variable "admin_password" {
  type        = string
  description = "Mot de passe administrateur de la VM Windows"
  sensitive   = true
}

variable "location" {
  type        = string
  default     = "West US 2"
  description = "Région Azure où les ressources seront déployées"
}

variable "resource_group_name" {
  type        = string
  default     = "terraform-vm"
  description = "Nom du groupe de ressources Azure"
}



