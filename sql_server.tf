resource "azurerm_sql_server" "sqlserver" {
  name                         = "${var.sql_server_name}"
  resource_group_name          = "${var.resource_group_name}"
  location                     = "${var.location}"
  version                      = "12.0"
  administrator_login          = "${var.administartor}"
  administrator_login_password = "${var.login_password}"

  tags = {
    environment = "${var.environment3}"
  }
  depends_on = [
    azurerm_resource_group.resource_group
  ]
}

resource "azurerm_sql_virtual_network_rule" "sqlvnetrule" {
  name                = "${var.sql_vnet_rule_name}"
  resource_group_name = "${var.resource_group_name}"
  server_name         = "${var.sql_server_name}"
  subnet_id           = azurerm_subnet.subnet3.id
  depends_on = [
    azurerm_resource_group.resource_group,
    azurerm_sql_server.sqlserver
  ]
}

resource "azurerm_sql_firewall_rule" "sql_firewall" {
  name                = "${var.sql_firewall_name}"
  resource_group_name = "${var.resource_group_name}"
  server_name         = "${var.sql_server_name}"
  start_ip_address    = "${var.start_ip}"
  end_ip_address      = "${var.end_ip}"
  depends_on = [
    azurerm_resource_group.resource_group,
    azurerm_sql_server.sqlserver
  ]
}