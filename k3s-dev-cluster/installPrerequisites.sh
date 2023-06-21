#!/bin/bash
if ! [ -x "$(command -v helmfile)" ]; then
    echo "installing plugin helmfile ..."
    mkdir tmp
    cd tmp
    wget https://github.com/helmfile/helmfile/releases/download/v0.154.0/helmfile_0.154.0_linux_amd64.tar.gz
    tar -xzvf helmfile_0.154.0_linux_amd64.tar.gz
    chmod a+x helmfile
    sudo cp helmfile /usr/local/bin
    cd ..
    rm -rf tmp
fi

echo "installing plugin helm diff ..."
helm plugin install https://github.com/databus23/helm-diff

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