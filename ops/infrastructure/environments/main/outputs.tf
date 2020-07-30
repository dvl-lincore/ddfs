output "ip_address" {
  value = "${azurerm_container_group.accord-data-pipeline-cg.ip_address}"
}

output "fqdn" {
  value = "${azurerm_container_group.accord-data-pipeline-cg.fqdn}"
}
