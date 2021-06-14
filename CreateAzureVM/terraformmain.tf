terraform {
  required_provider{
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

provider "azurerm" {
  feature {}
}

resource "azurerm_resource_group" "rg" {
    name     = var.resource_grp_name
    location = var.location
}

module "virtual-network" {
    source = "./modules/virtual-network"
    virtual_network_name            = var.virtual_netk_name
    resource_group_name             = var.resource_grp_name
    location                        = var.location
    virtual_network_address_space   = var.virtual_network_address_space
    subnet_name                     = var.subnet_name
    subnet_address_prefix           = var.subnet_address_prefix
}

module "netwrk-interface" {
    source = "./modules/netwrk-interface"
    vmname              = var.vmname
    location            = var.location
    resource_group_name = var.resource_grp_name
    subnet_id           = module.virtual-network.subnet_id
    network_security_group_id = module.network_security_group.nsg_id
}

module "vm" {
    source = "./modules/vm"
    vmname                  = var.vmname
    location                = var.location
    resource_group_name     = var.resource_grp_name
    network_interface_ids   = [module.network-interface.nic_id]
    vm_size                 = var.vm_size
    os_disk_type            = var.os_disk_type
    admin_usename           = var.usename
    admin_password          = var.password
    image_publisher         = var.image_publisher
    image_offer             = var.image_offer
    image_sku               = var.image_sku
}

module "network_security_group" {
    source = "./modules/network_security_group"
    name                    = var.nsgname
    location                = var.location
    resource_group_name     = var.resource_grp_name
    priority                = var.priority
    direction               = var.direction
    access                  = var.access
    protocol                = var.protocol
    destination_port_ranges = var.destinationportranges
    source_address_prefix   = var.sourceaddressprefix
    destination_address_prefix = var.destinationaddressprefix

}
