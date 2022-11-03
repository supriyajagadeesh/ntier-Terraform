resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.storage_account_name}"
  resource_group_name      = "${var.resource_group_name}"
  location                 = "${var.location}"
  account_tier             = "${var.storage_account_tier}"
  account_replication_type = "${var.storage_account_replication_tier}"
  depends_on = [
    azurerm_resource_group.resource_group
  ]
}

resource "azurerm_storage_container" "storage_container" {
  name                  = "${var.storage_container_name}"
  storage_account_name  = "${var.storage_account_name}"
  container_access_type = "${var.container_access_type}"
  depends_on = [
    azurerm_storage_account.storage_account
  ]
}

resource "azurerm_storage_blob" "blobstorage" {
  name                   = "${var.blob_name}"
  storage_account_name   = "${var.storage_account_name}"
  storage_container_name = "${var.storage_container_name}"
  type                   = "${var.blob_type}"
  access_tier = "${var.access_tier}"
  content_type ="${var.index_document}"
  source_content         = "${var.source_content}"
  depends_on = [
    azurerm_storage_account.storage_account,
    azurerm_storage_container.storage_container
  ]
}

resource "azurerm_storage_account" "storagesql" {
  name                     = "${var.sql_storage_account_name}"
  resource_group_name      = "${var.resource_group_name}"
  location                 = "${var.location}"
  account_tier             = "${var.storage_account_tier}"
  account_replication_type = "${var.storage_account_replication_tier}"
  depends_on = [
    azurerm_resource_group.resource_group
  ]
}
