resource "azurerm_public_ip" "jbox_pip" {
  name                = "${var.public_ip_name3}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  allocation_method   = "${var.public_ip_allocation_method2}"
}

resource "azurerm_bastion_host" "jbox" {
  name                = "${var.jbox_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

  ip_configuration {
    name                 = "${var.jbox_ip_config_name}"
    subnet_id            = azurerm_subnet.subnet5.id
    public_ip_address_id = azurerm_public_ip.jbox_pip.id
  }
  depends_on = [
    azurerm_resource_group.resource_group
  ]
}