output "nsg_id" {
    description = "id of the fileshare"
    value = azurerm_network_security_group.nsg1.id
}
