#!/bin/bash
if ! [ -x "$(command -v helmfile)" ]; then
    mkdir tmp
    cd tmp
    wget https://github.com/helmfile/helmfile/releases/download/v0.153.1/helmfile_0.153.1_linux_amd64.tar.gz
    tar -xzvf helmfile_0.153.1_linux_amd64.tar.gz
    chmod a+x helmfile
    sudo cp helmfile /usr/local/bin
    cd ..
    rm -rf tmp
fi

if ! [ -x "$(command -v helm diff)" ]; then
    helm plugin install https://github.com/databus23/helm-diff
fi

if ! [ -x "$(command -v helm secrets)" ]; then
    helm plugin install https://github.com/jkroepke/helm-secrets
fi

read -p "cleanup helm repositories? (Yy/Nn) " c
cleanup=false;

case $c in
    [Yy]* ) cleanup=true; echo "maven build execute"; break;;
esac

if $cleanup
then 
# removes all helm repositories, this is needed if you want to start from a plain system
helm repo ls -o yaml | grep 'name:' | awk '{ print $3}' | xargs -L1 helm repo remove
fi

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
