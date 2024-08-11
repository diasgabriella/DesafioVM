# Variável para definir a localização dos recursos na Azure
variable "admin_username" {
  description = "O nome de usuário do administrador para a VM"
  type        = string
  default     = "gabriella"
}

# Variável para a senha do administrador
variable "admin_password" {
  description = "A senha do administrador para a VM"
  type        = string
  sensitive   = true
  default     = "Gabriell@16"
}
# Variavel para definir a localzação
variable "location" {
  description = "Localização onde os recursos serão criados." 
  type        = string                                        
  default     = "brazilsouth"                                 
}

# Variável para definir o nome do grupo de recursos
variable "resource_group_name" {
  description = "Nome do grupo de recursos onde os recursos serão criados." 
  type        = string                                                      
  default     = "rg-terraform"                                              
}

# Variável para definir o espaço de endereço da VNet
variable "address_space" {

  description = "Espaço de endereço da rede virtual (VNet)." 
  type        = list(string)                                 
  default     = ["10.0.0.0/16"]                              
}

# Variável para definir o prefixo de endereço da sub-rede
variable "subnet_prefix" {
  description = "Prefixo de endereço da sub-rede." 
  type        = list(string)                       
  default     = ["10.0.1.0/24"]                   
}