# CityOS installation

This helm template installs the minimal setup - mainly for test purpose in (local) development clusters

## Prerequisites

* install docker and helm
* Install 
    * kubernetes cluster with traefik (k3s) 
    * command line tools helmfile, helm diff, helm secrets

A setup for dev-environments is also described in https://github.com/starwit/flux/tree/feature/main#helmfile-deployment.

* create file values.secrets.yaml by copying values.secrets.template.yaml and fill in secrets

## How to test helm charts

If you are changing charts, you can test them with `helmfile -e dev-local template > output.yaml`

## Execute Helmfile

`helmfile -e dev-local apply`

# Test Installation

* go to http://localhost/cityos-auth and login with admin/yourpassword
* create new user in the citydashboard realm
* go to http://localhost/cityos/ and login with created user