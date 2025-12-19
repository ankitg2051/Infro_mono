resource "azurerm_resource_group" "name" {
  name = var.name
  location = var.location
}

# output "rg_name" {
#   value = azurerm_resource_group.name.name
# }

# output "rg_location" {
#   value = azurerm_resource_group.name.location
# }