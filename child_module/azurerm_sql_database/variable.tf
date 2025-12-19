data "azurerm_mssql_server" "data_server" {
  name                = var.sql_server_name
  resource_group_name = var.resource_group_name
}

variable "sql_server_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}