terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.114.0"
    }
  }
}

# Configuração do provedor da Azure
provider "azurerm" {
  features {}
}

# Criação do grupo de recursos
resource "azurerm_resource_group" "rg" {
  name     =  var.resource_group_name       
  location = var.location                   
}

# Criação de rede e sub-rede
module "network" {
  source              = "./network"                      
  resource_group_name = azurerm_resource_group.rg.name   
  location            = azurerm_resource_group.rg.location 
  address_space       = var.address_space
  subnet_prefix       = var.subnet_prefix
}


# Criação da máquina virtual
module "vm" {
  source              = "./vm"                           
  resource_group_name = azurerm_resource_group.rg.name   
  location            = azurerm_resource_group.rg.location 
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_id = module.network.network_interface_id
}

# Saída do IP público da máquina virtual
