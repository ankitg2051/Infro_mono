resource "azurerm_key_vault" "example" {
  name                        = var.kv_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name = "standard"
}

resource "azurerm_role_assignment" "kv_officer" {
  scope                = azurerm_key_vault.example.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.object_id
}

# resource "azurerm_key_vault_secret" "usernamevm1" {
#   name         = "usernamevm1"
#   value        = "frontendvm"
#   key_vault_id = azurerm_key_vault.example.id
#   depends_on = [ azurerm_role_assignment.kv_officer ]
# }

# resource "azurerm_key_vault_secret" "usernamevm2" {
#   name         = "usernamevm2"
#   value        = "backendvm"
#   key_vault_id = azurerm_key_vault.example.id
#   depends_on = [ azurerm_role_assignment.kv_officer ]
# }

# resource "azurerm_key_vault_secret" "passwordvm1" {
#   name         = "passwordvm1"
#   value        = "Devopsinsider1"
#   key_vault_id = azurerm_key_vault.example.id
#   depends_on = [ azurerm_role_assignment.kv_officer ]
# }

# resource "azurerm_key_vault_secret" "passwordvm2" {
#   name         = "passwordvm2"
#   value        = "Devopsinsider1"
#   key_vault_id = azurerm_key_vault.example.id
#   depends_on = [ azurerm_role_assignment.kv_officer ]
# }

#we are using one click solution for key_vault, permission and secrets using this code.
#we were facing issue with 403 while creating secrets because here we have provided the user with key_vault_administration role
# but on azure key_vault, Access method is selected instead of RBAC, so we manually change it to RBAC and hit apply again.
#It works :-)
#Also we created a data block of secrets in variable form and call it in VM using data block
#In parent module, we passed the value name (Key) and it picked up the values from there.