resource "azurerm_virtual_network" "vnet" {
    name                        = var.vnetk_name
    resource_group_name         = var.resource_group_name
    location                    = var.location
    address_space               = var.vnetk_address_space
}
resource "azurerm_subnet" "subnet" {
    name                    = var.subnet_name
    resource_group_name     = var.resource_grp_name
    virtual_network_name    = azurerm_virtual_network.vnet.name
    address_prefix          = var.subnet_address_prefix
}
