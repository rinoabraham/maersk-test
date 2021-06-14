resource "azurerm_network_interface" "nic" {
    name                = "${var.vmname}-nic-01"
    location            = var.location
    resource_group_name = var.resource_grp_name
    ip_configuration {
        name                          = "ip1"
        subnet_id                     = var.subnet_id
        private_ip_address_allocation = "Dynamic"
    }
}
