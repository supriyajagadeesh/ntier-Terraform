resource "azurerm_virtual_machine_scale_set" "vmss2" {
  name                = "${var.vmss2}"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"
  zones = [ "1", "2" ]
  automatic_os_upgrade = "${local.automatic_os_upgrade}"
  upgrade_policy_mode  = "${local.upgrade_policy_mode}"
  
  
  sku {
    name     = "Standard_F2"
    tier     = "Standard"
    capacity = 2
  }

  storage_profile_image_reference {
    publisher = "${var.publisher}"
    offer     = "${var.offer}"
    sku       = "${var.sku}"
    version   = "Latest"
  }

  rolling_upgrade_policy {
    max_batch_instance_percent              = "${local.batch-instance_percent}"
    max_unhealthy_instance_percent          = "${local.unhealthy_instance_percent}"
    max_unhealthy_upgraded_instance_percent = "${local.unhealthy_upgraded}"
    pause_time_between_batches              = "${local.pause_time}"
  }
  storage_profile_os_disk {
    name              = "${var.storage_account_name}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }  

  os_profile {
    computer_name_prefix = "testvm"
    admin_username       = "${var.admin_username}"
    admin_password =  "${var.admin_password}"
  }
  network_profile {
    name    = "${var.nic_name2}"
    primary = true

    ip_configuration {
      name      = "${var.frontend_ip_config_name}"
      primary   = true
      subnet_id = azurerm_subnet.subnet2.id
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.beapool.id]
    }
  }
  tags = {
    environment = "${var.environment2}"
  }
  
 }