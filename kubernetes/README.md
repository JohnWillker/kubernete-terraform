# Kubernetes

Faz o deploy de uma app node em um Kubernetes local(minkube) usando Helm

## Uso

Prerequisitos locais:

- HELM (2.10)[Info](https://github.com/helm/helm/releases/tag/v2.10.0)
- Minikube
- Kubectl
- Docker

Existem duas opções com 1 comando ou passo a passo

Com 1 comando:

    $ make deploy

Ou passo a passo:

Inicializa Minikube:

    $ make minikube/init
    
Docker build:

    $ make docker/build
    
Inicializa Helm e instala tiller:

    $ make helm/init

Faz o deploy usando helm:

    $ make helm/deploy

Testa:

    $ make test

Delete deploy:

    $ make helm/delete
