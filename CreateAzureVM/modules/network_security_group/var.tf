variable "nsgname" {
    type = string
    description = "The name of the virtual machine"
}
variable "resource_grp_name" {
    type = string
    description = "The name of resource group"
}
variable "location" {
    type = string
    description = "Azure location "
}
variable "destinationportranges" {
    type = list(string)
    description = "NSG multiple ports that need to be opened"
}
variable "rulename" {
    type = string
    description = "NSG Rule name"
}
variable "priority" {
    type = string
    description = "NSG rule priority"
}
variable "direction" {
    type = string
    description = "NSG direction"
}
variable "access" {
    type = string
    description = "NSG access"
}
variable "protocol" {
    type = string
    description = "NSG protocol to be used"
}
variable "portrange" {
    type = string
    description = "NSG portrange"
}
variable "sourceaddressprefix" {
    type = string
    description = "NSG sourceaddressprefix"
}
variable "destinationaddressprefix" {
    type = string
    description = "NSG destinationaddressprefix"
}
