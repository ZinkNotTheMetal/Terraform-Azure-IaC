########################################################################
#  VARIABLES
########################################################################
variable "application_name" {}
variable "resource_group" {
    default = "Government_Business"
}
variable "server_prefix" {
    default = "HSAzure-MRDE"
}
variable "region" {
    default = "Central US"
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
resource "azurerm_virtual_network" "setup_virtual_network" {
  name                = "${var.server_prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.setup_resource_group.location
  resource_group_name = azurerm_resource_group.setup_resource_group.name
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.setup_resource_group.name
  virtual_network_name = azurerm_virtual_network.setup_virtual_network.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "setup_nic" {
  name                = "${var.server_prefix}-nic"
  location            = azurerm_resource_group.setup_resource_group.location
  resource_group_name = azurerm_resource_group.setup_resource_group.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}

########################################################################
#  Data
########################################################################




########################################################################
#  Virtual Machines
########################################################################
resource "azurerm_linux_virtual_machine" "web-server" {
    name                  = "${var.server_prefix}-vm-01"
    location              = azurerm_resource_group.setup_resource_group.location
    resource_group_name   = azurerm_resource_group.setup_resource_group.name
    network_interface_ids = [azurerm_network_interface.setup_nic.id]
    size                  = "Standard_B1ms"
    disable_password_authentication = false
    admin_username        = "wz-tfsazuretest"
    admin_password        = "thisisadmin123!"

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    # Operating System for VM
    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04-LTS"
        version   = "latest"
    }

    tags = {
        Purpose = "Web Server"
        Application = var.application_name
    }
}