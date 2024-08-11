# Automatizando a Implantação de WordPress na Azure com Terraform

Este guia descreve como automatizar a implantação de um site WordPress na Azure utilizando o Terraform. O processo envolve a configuração de uma máquina virtual (VM), instalação do Docker, e execução de containers para o WordPress e MySQL, garantindo que o banco de dados seja preservado em atualizações.

## Instruções de Implantação

### 1. Preparação do Ambiente
**Primeiro**, faça o clone deste repositório para sua máquina local utilizando o Git:

**bash**
git clone https://github.com/seu-usuario/seu-repositorio.git

**Segundo**, crie uma conta no Portal Azure e faça a instalação do Azure Cli.

**Terceiro**, baixe e descompacte no local de escolha o Terraform (https://developer.hashicorp.com/terraform/install?ajs_aid=aa368c2f-6f9f-45f0-8f76-ae6e3cbd929e&product_intent=terraform).

### 2. Inicializando o Terraform
Dentro do diretório do projeto, abra seu terminal ou prompt de comando e execute os seguintes passos:

**terraform init:** Configura o ambiente de trabalho do Terraform e baixa os provedores necessários.

**terraform plan:** Gera um plano de execução, exibindo o que será criado ou alterado na infraestrutura.

**terraform apply:** Aplica o plano de execução e provisiona os recursos na Azure.

### 3. Acessando o WordPress
Após a conclusão da execução do terraform apply, será exibido o endereço IP da VM onde o WordPress está hospedado. Abra esse endereço em um navegador para acessar seu site WordPress.

**Aviso:** Aguarde cerca de 30 segundos após a implantação para garantir que os containers do Docker estejam completamente inicializados antes de acessar o site.

### 4. Limpeza dos Recursos
Se você não precisar mais dos recursos provisionados, poderá removê-los facilmente executando o seguinte comando:

**terraform destroy**

Este comando desprovisionará todos os recursos criados pelo Terraform, revertendo a infraestrutura para o estado original.

### Configurações Importantes
**Grupo de Recursos:** Defina o nome do grupo de recursos a ser criado na Azure.

**Localização:** Especifique a região da Azure onde os recursos serão implantados.

**Usuário Administrador:** Informe o nome de usuário para acessar a VM.

**Senha do Administrador:** Defina uma senha forte para o acesso seguro à VM.

### Considerações Finais
Certifique-se de configurar corretamente suas credenciais de acesso à Azure no arquivo provider.tf antes de iniciar o processo de implantação.
Ao finalizar o processo, sua máquina virtual estará disponivel no Portal Azure - Máquinas virtuais (https://portal.azure.com/?quickstart=true#home).

![image](https://github.com/user-attachments/assets/67f2aa7e-2b73-4611-830f-d49bf7c1f1a4)

 
