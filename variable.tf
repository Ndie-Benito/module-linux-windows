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



