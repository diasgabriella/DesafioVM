<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Implantação de WordPress na Azure com Terraform</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background-color: #f4f4f4;
            padding: 20px;
        }
        h1, h2 {
            color: #333;
        }
        code {
            background-color: #e8e8e8;
            padding: 2px 4px;
            border-radius: 4px;
        }
        .important {
            background-color: #f9f9f9;
            border-left: 5px solid #ffcc00;
            padding: 10px;
            margin: 20px 0;
        }
    </style>
</head>
<body>

    <h1>Implantação de WordPress na Azure com Terraform</h1>

    <p>Este guia descreve como configurar um site WordPress completo na Azure utilizando Terraform. O processo automatizado inclui o provisionamento de uma máquina virtual, instalação do Docker e configuração de containers separados para o WordPress e MySQL, garantindo persistência dos dados durante atualizações.</p>

    <h2>Passos</h2>

    <ol>
        <li><strong>Clone o Repositório:</strong> Faça o download deste repositório GitHub para o seu computador.</li>
        
        <li><strong>Inicialize o Terraform:</strong> No diretório principal do projeto, abra um terminal e execute os seguintes comandos:</li>
        <ul>
            <li><code>terraform init</code>: Inicializa o Terraform e faz o download dos provedores necessários.</li>
            <li><code>terraform plan</code>: Gera um plano de execução que mostra as modificações que serão realizadas.</li>
            <li><code>terraform apply</code>: Aplica as modificações e provisiona os recursos na Azure.</li>
        </ul>

        <li><strong>Acesse o WordPress:</strong> Após a execução do Terraform, o endereço IP da VM será exibido na saída do comando <code>terraform apply</code>. Acesse esse IP em seu navegador para visualizar o site WordPress.</li>
        
        <li><strong>Aguardar 30 segundos:</strong> Aguarde 30 segundos para garantir que os containers estão totalmente inicializados.</li>
        
        <li><strong>Remova a Infraestrutura:</strong> Se você não precisar mais dos recursos provisionados, remova-os com o comando <code>terraform destroy</code>. Este comando apaga todos os recursos criados pelo Terraform.</li>
    </ol>

    <h2>Informações</h2>
    <ul>
        <li><strong>resource_group_name:</strong> Nome do grupo de recursos na Azure.</li>
        <li><strong>location:</strong> Região onde a VM será implantada na Azure.</li>
        <li><strong>admin_username:</strong> Nome do usuário administrador da VM.</li>
        <li><strong>admin_password:</strong> Senha do administrador da VM.</li>
    </ul>

    <div class="important">
        <h3>Notas:</h3>
        <p>Certifique-se de configurar as credenciais para conexão com a CLI no arquivo <strong>provider.tf</strong> antes de executar os comandos do Terraform.</p>
    </div>

</body>
</html>
