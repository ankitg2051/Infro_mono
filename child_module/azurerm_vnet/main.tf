resource "azurerm_virtual_network" "name" {
  name = var.vnet_name
  location = var.location
  resource_group_name = var.name
  address_space       = ["10.0.0.0/16"]
}

# output "vnet_name" {
#   value = azurerm_virtual_network.name.name
# }