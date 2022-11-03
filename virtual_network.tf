# Source code for Creating virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnet_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  address_space       = "${var.vnet_address_space}"
  ddos_protection_plan {
    id = azurerm_network_ddos_protection_plan.ddos.id
    enable = true
  }
  depends_on = [
    azurerm_resource_group.resource_group,
    azurerm_network_ddos_protection_plan.ddos
  ]
}

# Source code for Creating first subnet
resource "azurerm_subnet" "subnet1" {
  name                  = "${var.subnet_name1}"
  virtual_network_name  = "${var.vnet_name}"
  resource_group_name   = "${var.resource_group_name}"
  address_prefixes    = ["${var.subnet_address_space1}"]
  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

# Source code for Creating second subnet
resource "azurerm_subnet" "subnet2" {
  name                  = "${var.subnet_name2}"
  virtual_network_name  = "${var.vnet_name}"
  resource_group_name   = "${var.resource_group_name}"
  address_prefixes    = ["${var.subnet_address_space2}"]
  depends_on = [
    azurerm_virtual_network.vnet,azurerm_subnet.subnet1
  ]
}

# Source code for Creating third subnet
resource "azurerm_subnet" "subnet3" {
  name                  = "${var.subnet_name3}"
  virtual_network_name  = "${var.vnet_name}"
  resource_group_name   = "${var.resource_group_name}"
  address_prefixes     = ["${var.subnet_address_space3}"]
  depends_on = [
    azurerm_virtual_network.vnet,azurerm_subnet.subnet2
  ]
}

# Source code for Creating fourth subnet
resource "azurerm_subnet" "subnet4" {
  name                  = "${var.subnet_name4}"
  virtual_network_name  = "${var.vnet_name}"
  resource_group_name   = "${var.resource_group_name}"
  address_prefixes     = ["${var.subnet_address_space4}"]
  depends_on = [
    azurerm_virtual_network.vnet,azurerm_subnet.subnet3
  ]
}

# Source code for Creating fifth subnet
resource "azurerm_subnet" "subnet5" {
  name                  = "${var.subnet_name5}"
  virtual_network_name  = "${var.vnet_name}"
  resource_group_name   = "${var.resource_group_name}"
  address_prefixes     = ["${var.subnet_address_space5}"]
  depends_on = [
    azurerm_virtual_network.vnet,azurerm_subnet.subnet4
  ]
}

# Source code for Creating sixth subnet
resource "azurerm_subnet" "subnet6" {
  name                  = "${var.subnet_name6}"
  virtual_network_name  = "${var.vnet_name}"
  resource_group_name   = "${var.resource_group_name}"
  address_prefixes     = ["${var.subnet_address_space6}"]
  depends_on = [
    azurerm_virtual_network.vnet,azurerm_subnet.subnet5
  ]
}

# Creating ASG
resource "azurerm_application_security_group" "webasg" {
  name                = "webasg"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  depends_on = [
    azurerm_resource_group.resource_group
  ]
}

resource "azurerm_application_security_group" "businessasg" {
  name                = "businessasg"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  depends_on = [
    azurerm_resource_group.resource_group
  ]
}

resource "azurerm_application_security_group" "dataasg" {
  name                = "dataasg"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  depends_on = [
    azurerm_resource_group.resource_group
  ]
}

resource "azurerm_application_security_group" "jboxasg" {
  name                = "jboxasg"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  depends_on = [
    azurerm_resource_group.resource_group
  ]
}

resource "azurerm_network_ddos_protection_plan" "ddos" {
  name                = "${var.ddos_protection}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  depends_on = [
    azurerm_resource_group.resource_group
  ]
}