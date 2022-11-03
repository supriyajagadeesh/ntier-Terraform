/*resource "azuread_group" "dc_admins" {
  display_name     = "${var.group_name}"
  security_enabled = true
}

resource "azuread_user" "admin" {
  user_principal_name = "${var.user_principal_name}"
  display_name        = "${var.admin_name}"
  password            = "${var.user_password}"
}

resource "azuread_group_member" "admin" {
  group_object_id  = azuread_group.dc_admins.object_id
  member_object_id = azuread_user.admin.object_id
}

resource "azuread_service_principal" "example" {
  application_id = "2565bd9d-da50-47d4-8b85-4c97f669dc36" // published app for domain services
}

resource "azurerm_active_directory_domain_service" "example" {
  name                = "example-aadds"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

  domain_name           = "${var.domain_name}"
  sku                   = "${var.sku_ADDS}"
  filtered_sync_enabled = false

  initial_replica_set {
    subnet_id = azurerm_subnet.subnet6.id
  }

  notifications {
    additional_recipients = ["notifyA@example.net", "notifyB@example.org"]
    notify_dc_admins      = true
    notify_global_admins  = true
  }

  security {
    sync_kerberos_passwords = true
    sync_ntlm_passwords     = true
    sync_on_prem_passwords  = true
  }

  tags = {
    Environment = "${var.environment3}"
  }

  depends_on = [
    azuread_service_principal.example,
    azurerm_subnet_network_security_group_association.ADnsg,
  ]
}*/