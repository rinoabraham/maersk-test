resource "azurerm_network_security_group" "nsg1" {
    name                = var.nsgname
    location            = var.location
    resource_group_name = var.resource_grp_name

    security_rule {
        name                       = var.rulename
        priority                   = var.priority
        direction                  = var.direction
        access                     = var.access
        protocol                   = var.protocol
        source_port_range          = var.portrange
        destination_port_ranges    = var.destinationportranges
        source_address_prefix      = var.sourceaddressprefix
        destination_address_prefix = var.destinationaddressprefix
    }
}
