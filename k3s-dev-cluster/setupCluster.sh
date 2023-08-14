#!/bin/bash
sh installPrerequisites.sh

if ! [ -x "$(command -v docker compose)" ]; then
	docker compose up -d
else
	docker-compose up -d
fi

sleep 10

NEW_CONFIG="$(pwd)/kubeconfig/kubeconfig.yaml"
export KUBECONFIG=$NEW_CONFIG
echo "Cluster installed with helmfile. Set kubeconfig:"
echo "export KUBECONFIG=$NEW_CONFIG"

echo "Install traefik and cert-manager configuration"

read -p "Press enter to continue"

kubectl apply -f https://raw.githubusercontent.com/traefik/traefik/v2.10/docs/content/reference/dynamic-configuration/kubernetes-crd-definition-v1.yml
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.12.3/cert-manager.crds.yaml