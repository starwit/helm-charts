# Helmfile installations

This helmfiles are deploying different setups used for different environments.

## Prerequisites

* install docker and helm
* Install 
    * kubernetes cluster with traefik (k3s)
    * command line tools helmfile, helm diff, helm secrets
    * This deployment is partly tailored for Traefik Ingress. Please ensure, that the Traefik CRDs are installed
      correctly
        * `kubectl apply -f https://raw.githubusercontent.com/traefik/traefik/v2.10/docs/content/reference/dynamic-configuration/kubernetes-crd-definition-v1.yml`

A setup for dev-environments is also described in https://github.com/starwit/flux/tree/feature/main#helmfile-deployment.

* create file values.secrets.yaml by copying values.secrets.template.yaml and fill in secrets

## How to test helm charts

If you are changing charts, you can test them with `helmfile template > output.yaml`

## Execute Helmfile

Go to project subdirectories which are containing helmfile.yaml and execute `helmfile apply`.
