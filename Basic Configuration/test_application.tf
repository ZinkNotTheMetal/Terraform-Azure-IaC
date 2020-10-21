########################################################################
#  VARIABLES
########################################################################
#variable "application_name" {}
variable "resource_group" {
    default = "Government_Business"
}
variable "region" {
    default = "East US"
}


########################################################################
#  Azure Configuration
########################################################################
provider "azurerm" {
    # Latest as of 10/20/20
    # https://github.com/terraform-providers/terraform-provider-azurerm/blob/master/CHANGELOG.md
    version = "=2.32.0"
    features {}
}


########################################################################
#  Resource Group
########################################################################
resource "azurerm_resource_group" "setup_resource_group" {
    name     = var.resource_group
    location = var.region

    tags = {
        AuthoredBy = "William Zink",
        Team = "DevOps"
        ServiceManagerTeam = "DevOps Solutions"
    }
}

########################################################################
#  Virtual Network
########################################################################



########################################################################
#  Data
########################################################################




########################################################################
#  Virtual Machines
########################################################################
