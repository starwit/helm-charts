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
