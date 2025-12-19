data "azurerm_public_ip" "pip_data" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "subbb" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group_name
}

data "azurerm_key_vault" "example" {
  name                = var.kv_name
  resource_group_name = var.resource_group_name
}
data "azurerm_key_vault_secret" "username" {
  name = var.kv_username
  key_vault_id = data.azurerm_key_vault.example.id
}

data "azurerm_key_vault_secret" "password" {
  name = var.kv_password
  key_vault_id = data.azurerm_key_vault.example.id
}

# data "azurerm_key_vault_secret" "example1" {
#   name         = "usernamevm1"
#   key_vault_id = data.azurerm_key_vault.example.id
# }

# data "azurerm_key_vault_secret" "example2" {
#   name         = "usernamevm2"
#   key_vault_id = data.azurerm_key_vault.example.id
# }

# data "azurerm_key_vault_secret" "example3" {
#   name         = "passwordvm1"
#   key_vault_id = data.azurerm_key_vault.example.id
# }

# data "azurerm_key_vault_secret" "example4" {
#   name         = "passwordvm2"
#   key_vault_id = data.azurerm_key_vault.example.id
# }
