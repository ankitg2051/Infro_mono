module "rgs" {
    source = "../child_module/azurerm_resource_group"
    name = "goyal-rg"
    location = "West US"
}

# module "vnet" {
#   source = "../child_module/azurerm_vnet"
#   depends_on = [ module.rgs ]
#   vnet_name = "goyal-vnet"
#   name = "goyal-rg"
#   location = "West US"
# }

# module "subnet1" {
#   source = "../child_module/azurerm_subnet"
#   depends_on = [ module.vnet ]
#   name = "frontend-subnet"
#   rg_name = "goyal-rg"
#   vnet_name = "goyal-vnet"
#   address_prefixes = ["10.0.1.0/24"]
# }

# module "subnet2" {
#   source = "../child_module/azurerm_subnet"
#   depends_on = [ module.vnet ]
#   name = "backend-subnet"
#   rg_name = "goyal-rg"
#   vnet_name = "goyal-vnet"
#   address_prefixes = ["10.0.2.0/24"]
# }

# module "pip1" {
#   source = "../child_module/azurerm_PIP"
#   depends_on = [ module.rgs ]
#   pip_name = "frontend-pip"
#   resource_group_name = "goyal-rg"
#   location = "West US"
# }

# module "pip2" {
#   source = "../child_module/azurerm_PIP"
#   depends_on = [ module.rgs ]
#   pip_name = "backend-pip"
#   resource_group_name = "goyal-rg"
#   location = "West US"
# }

# module "vm1" {
#   source = "../child_module/azurerm_virtual_machine+NIC"
#   depends_on = [ module.subnet1 ]
#   vm_name = "frontendvm"
#   resource_group_name = "goyal-rg"
#   location = "West US"
#   size = "Standard_B1s"
#  kv_name     = "goyal-kv"
#   kv_username = "usernamevm1"
#   kv_password = "passwordvm1"
#   publisher = "Canonical"
#   offer     = "0001-com-ubuntu-server-jammy"
#   sku       = "22_04-lts"
#   subnet_name = "frontend-subnet"
#   vnet_name = "goyal-vnet"
#   public_ip_name = "frontend-pip"
#   nic_name = "frontend-nic"
# }
 
# module "vm2" {
#   source = "../child_module/azurerm_virtual_machine+NIC"
#   depends_on = [ module.subnet1 ]
#   vm_name = "backendvm"
#   resource_group_name = "goyal-rg"
#   location = "West US"
#   size = "Standard_B1s"
#   kv_name     = "goyal-kv"
#   kv_username = "usernamevm2"
#   kv_password = "passwordvm2"
#   publisher = "Canonical"
#   offer     = "0001-com-ubuntu-server-jammy"
#   sku       = "22_04-lts"
#   subnet_name = "backend-subnet"
#   vnet_name = "goyal-vnet"
#   public_ip_name = "backend-pip"
#   nic_name = "backend-nic"
# }

# module "sql_server" {
#   source = "../child_module/azurerm_SQL_Server"
#   depends_on = [ module.rgs ]
#   sql_server_name = "goyal-server"
#   resource_group_name = "goyal-rg"
#   location = "West US"
#   administrator_login = "server112"
#   administrator_login_password = "server@pass1"
# }

# module "sql_database" {
#   source = "../child_module/azurerm_sql_database"  
#   depends_on = [ module.sql_server ]
#   db_name = "sql_db_goyal"
#   resource_group_name = "goyal-rg"
#   sql_server_name = "goyal-server"
# }

module "key_vault" {
  depends_on = [ module.rgs ]
  source = "../child_module/azurerm_key_vault"
  kv_name = "goyal-kv"
  location = "West US"
  resource_group_name = "goyal-rg"
}

