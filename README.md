 # Infraestrutura na AWS com Kubernetes

Este repositório tem como objetivo fazer a implementação da infraestrutura na AWS com Terraform.

## Configuração do Repositório

A configuração da infraestrutura e a aplicação no Kubernetes são realizadas por meio de pipelines automatizadas. Não é necessário ter o Terraform ou configurações da AWS na máquina local.


## Atualização do Código `main.tf`

Para atualizar o código `main.tf` com as informações necessárias, siga estas etapas:

1. **Subnets:** 
   - Localize a seção relacionada à definição de subnets no arquivo `main.tf`.
   - Substitua os IDs das subnets existentes na sua VPC pelos IDs correspondentes.

Exemplo:
```hcl
subnet_ids = ["subnet-12345678", "subnet-87654321"]
```

2. **ARN da Conta:**
   - Localize a variável `role_arn` no arquivo `main.tf`.
   - Atualize o valor com o ARN do role da sua conta AWS.

Exemplo:
```hcl
role_arn = "arn:aws:iam::123456789012:role/your-role-name"
```

Certifique-se de salvar as alterações após atualizar o código `main.tf`.

## Configuração
Antes de executar a pipeline, certifique-se de configurar as seguintes variáveis de ambiente:

 - AWS_CREDENTIALS: Credenciais de acesso à AWS.
   
Certifique-se de que essas variáveis de ambiente estejam configuradas corretamente para garantir o funcionamento adequado da pipeline.


