# Terraform

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
