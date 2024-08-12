# Definição da rede virtual (VNet)
resource "azurerm_virtual_network" "vnet" {
  name                = "wordpress-vnet"                
  address_space       = var.address_space               
  location            = var.location                    
  resource_group_name = var.resource_group_name         
}

# Definição da sub-rede dentro da VNet
resource "azurerm_subnet" "subnet" {
  name                 = "wordpress-subnet"             
  resource_group_name  = var.resource_group_name        
  virtual_network_name = azurerm_virtual_network.vnet.name 
  address_prefixes     = var.subnet_prefix              
}


resource "azurerm_public_ip" "public_ip" {
  name                = "wordpress-ip_public"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"

  tags = {
    environment = "Dev"
  }
}

# Criação da interface de rede (NIC)
resource "azurerm_network_interface" "nic" {
  name                = "wordpress-nic"
  location            = var.location
  resource_group_name = var.resource_group_name 

  # Configuração de IP para a NIC
  ip_configuration {
    name                          = "wordpress-ip-config"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

# Grupo de segurança de rede (NSG) e permita SSH
resource "azurerm_network_security_group" "sc" {
  name                = "wordpress-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Associe a NSG à interface de rede
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.sc.id
}

