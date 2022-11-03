# Source code for the Resource Group Creation
resource "azurerm_resource_group" "resource_group" {
  name = "${var.resource_group_name}"
  location = "${var.location}"
  tags = {
    environment = "${var.environment1}"
  }
}
