# Projeto Terraform - Infraestrutura na AWS

Este projeto configura uma infraestrutura completa na AWS usando Terraform. Ele inclui recursos como VPC, sub-redes, balanceador de carga, grupos de segurança, instâncias EC2, CloudFront, RDS, NAT Gateways e armazenamento no S3. O código está estruturado para fornecer uma infraestrutura escalável, segura e configurável, adequada para aplicações em um ambiente de produção.

## Estrutura do Projeto

Abaixo está uma descrição dos principais arquivos e módulos usados no projeto:

- **`main.tf`**: Define a configuração principal do Terraform, incluindo o backend (S3) para o armazenamento do estado e o provider AWS.
- **`variables.tf`**: Contém todas as variáveis que tornam a configuração parametrizável.
- **`locals.tf`**: Define variáveis locais que ajudam na configuração de políticas e outros recursos.
- **`vpc.tf`**: Configura a VPC e os sub-redes, incluindo sub-redes públicas e privadas, NAT Gateways e tabelas de rotas.
- **`alb.tf`**: Configura o Application Load Balancer (ALB), incluindo grupos de destino e listeners.
- **`ec2.tf`**: Configura as instâncias EC2 para o aplicativo.
- **`rds.tf`**: Configura o banco de dados RDS.
- **`cloudfront.tf`**: Configura a distribuição do CloudFront para cache e distribuição de conteúdo.
- **`secrets_manager.tf`**: Armazena senhas e segredos no AWS Secrets Manager.
- **`s3.tf`**: Configura o bucket S3 para armazenamento de arquivos e para logs.
- **`security_group.tf`**: Define os grupos de segurança para controlar o tráfego de rede.
- **`random_password.tf`**: Gera senhas aleatórias para recursos sensíveis.

## Pré-requisitos

- **Terraform**: Certifique-se de que o Terraform está instalado em sua máquina. Este projeto requer a versão `>=1.9.0`.
- **AWS CLI**: Configure suas credenciais AWS com o AWS CLI.
- **Credenciais AWS**: Configure o arquivo `~/.aws/credentials` ou use variáveis de ambiente para fornecer as credenciais necessárias para o Terraform.

