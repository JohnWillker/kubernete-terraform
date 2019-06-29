# Terraform

Faz o deploy de uma instância amazon Linux com container httpd rondando na porta 80

## Uso

Deploy com 1 comando:

    $ make deploy

Ou passo a passo:

    $ terraform init
    $ terraform apply -auto-approve

Destroy:
 
    $ terraform destroy -auto-approve
OU

    $ make destroy


Testar:

    $ curl $(terraform output public_ip)
