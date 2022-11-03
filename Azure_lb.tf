resource "azurerm_public_ip" "piplb" {
  name                = "${var.public_ip_name2}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  allocation_method   = "${var.public_ip_allocation_method}"
}

resource "azurerm_lb" "mylb" {
  name                = "${var.lb_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

  frontend_ip_configuration {
    name                 = "${var.frontend_ip_config_name}"
    public_ip_address_id = azurerm_public_ip.piplb.id
  }
}

resource "azurerm_lb_backend_address_pool" "beapool" {
  loadbalancer_id     = azurerm_lb.mylb.id
  name                = "${var.beapool_name}"
}

resource "azurerm_lb_nat_pool" "lbnatpool" {
  resource_group_name            = "${var.resource_group_name}"
  name                           = "ssh"
  loadbalancer_id                = azurerm_lb.mylb.id
  protocol                       = "Tcp"
  frontend_port_start            = 50000
  frontend_port_end              = 50119
  backend_port                   = 22
  frontend_ip_configuration_name = "${var.frontend_ip_config_name}"
}

resource "azurerm_lb_probe" "example" {
  loadbalancer_id     = azurerm_lb.mylb.id
  name                = "http-probe"
  protocol            = "Http"
  request_path        = "/health"
  port                = 8080
}
