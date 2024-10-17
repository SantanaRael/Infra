# Desenho de Arquitetura da Infraestrutura

Além do provisionamento da infraestrutura com Terraform, este repositório também contém o desenho da arquitetura da solução na AWS, focada em alta disponibilidade e escalabilidade.

## Visão Geral da Arquitetura

A arquitetura foi projetada com os seguintes componentes principais:

- **Amazon EC2**: Para executar os serviços que precisam de escalabilidade.
- **Amazon RDS**: Banco de dados relacional gerenciado com alta disponibilidade.
- **Amazon S3**: Para armazenamento de objetos estáticos e backups.
- **Elastic Load Balancer**: Distribuição de carga entre múltiplas instâncias.
- **Auto Scaling Groups**: Escalabilidade automática baseada em demanda.
- **Amazon EKS (Kubernetes)**: Gerenciamento e orquestração dos containers da aplicação.

Essa combinação garante uma solução robusta, com failover automático, resiliência e escalabilidade para atender picos de demanda.

## Diagrama da Arquitetura

![image](https://github.com/user-attachments/assets/746eb7a4-481e-4e9e-b485-42be45f38f4c)


## Documentação Completa

Você pode acessar a documentação completa sobre o desenho de arquitetura e as decisões de design técnico no seguinte link:

[Link para a documentação](https://www.figma.com/board/Z4Ec3dp9ml3Y2KUr2Hq7dz/Hackathon-Arquitetura?node-id=0-1&node-type=canvas&t=8Y0oqOkgurlCqo9i-0)



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


