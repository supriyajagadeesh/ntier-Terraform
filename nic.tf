# Source code for Creating public ip
resource "azurerm_public_ip" "pip" {
  name                = "${var.public_ip_name}"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"
  allocation_method   = "${var.public_ip_allocation_method}"
  depends_on = [
    azurerm_resource_group.resource_group
  ]
}

# Source code for Creating NIC
resource "azurerm_network_interface" "nicweb" {
  resource_group_name                     = "${var.resource_group_name}"
  location                                = "${var.location}"
  name                                    = "${var.nic_name1}"
  ip_configuration {
    name                          = "${var.nic_ip_config_name}"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "${var.nic_ip_allocation_method}"
  }
  depends_on = [
    azurerm_resource_group.resource_group
  ]
}

# Source code for Creating NIC
resource "azurerm_network_interface" "nicbusiness" {
  resource_group_name                     = "${var.resource_group_name}"
  location                                = "${var.location}"
  name                                    = "${var.nic_name2}"
  ip_configuration {
    name                          = "${var.nic_ip_config_name}"
    subnet_id                     = azurerm_subnet.subnet2.id
    private_ip_address_allocation = "${var.nic_ip_allocation_method}"
  }
  depends_on = [
    azurerm_resource_group.resource_group, azurerm_network_interface.nicweb
  ]
}

# Source code for Creating NIC
resource "azurerm_network_interface" "nicdata" {
  resource_group_name                     = "${var.resource_group_name}"
  location                                = "${var.location}"
  name                                    = "${var.nic_name3}"
  ip_configuration {
    name                          = "${var.nic_ip_config_name}"
    subnet_id                     = azurerm_subnet.subnet3.id
    private_ip_address_allocation = "${var.nic_ip_allocation_method}"
  }
  depends_on = [
    azurerm_resource_group.resource_group, azurerm_network_interface.nicbusiness
  ]
}

# Create network interface
resource "azurerm_network_interface" "jboxnic" {
  name                      = "${var.jboxnic_name}"
  location                  = "${var.location}"
  resource_group_name       = "${var.resource_group_name}"
  #-network_security_group_id = azurerm_network_security_group.tfjboxnsg.id

  ip_configuration {
    name                 = "${var.jbox_ip_config_name}"
    subnet_id            = azurerm_subnet.subnet5.id
    private_ip_address_allocation = "${var.private_ip_address_allocation}"
    public_ip_address_id          = azurerm_public_ip.jbox_pip.id
  }
  depends_on = [
    azurerm_resource_group.resource_group,
    azurerm_public_ip.jbox_pip
  ]
}

resource "azurerm_network_interface_security_group_association" "jboxnic" {
  network_interface_id      = azurerm_network_interface.jboxnic.id
  network_security_group_id = azurerm_network_security_group.jboxnsg.id
}


