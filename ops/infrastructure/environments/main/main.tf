provider "azurerm" {
  version = "=2.19.0"
  features {}
}

resource "azurerm_container_group" "accord_data_pipeline_cg" {
  name                = "${var.environment}-accord-data-pipeline"
  location            = "${var.location}"
  resource_group_name = "${var.resource-group}"
  ip_address_type     = "public"
  dns_name_label      = "${var.environment}-accord-data-pipeline"
  os_type             = "linux"

  container {
    name   = "accord-data-pipeline"
    image  = "alpine:latest"
    cpu    = "0.5"
    memory = "1.5"
    port   = "80"
  }

  tags = {
    environment = "${var.environment}"
  }
}

resource "azurerm_storage_account" "accord_storage_account" {
  name                     = "${var.environment}accordsa"
  resource_group_name      = var.resource-group
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
  }

  tags = {
    environment = "${var.environment}"
  }
}

resource "azurerm_storage_container" "accord_storage_container" {
  name                  = "${var.environment}-accord-fe-content"
  storage_account_name  = azurerm_storage_account.accord_storage_account.name
  container_access_type = "public"

  tags = {
    environment = "${var.environment}"
  }
}

resource "azurerm_storage_blob" "accord_storage_blob" {
  name                   = "${var.environment}-accord-fe"
  storage_account_name   = azurerm_storage_account.accord_storage_account.name
  storage_container_name = azurerm_storage_container.accord_storage_container.name
  type                   = "Block"

  tags = {
    environment = "${var.environment}"
  }
}
