variable "name" {
  type = string
  description = "subnet_name"
}

variable "rg_name" {
  type = string
  description = "rg_name"
}

variable "vnet_name" {
  type = string
  description = "vnet_name"
}

variable "address_prefixes" {
  type = list(string)
}