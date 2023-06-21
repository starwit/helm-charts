#!/bin/bash
export HOSTNAME=${HOSTNAME,,}
echo "hostname is: $HOSTNAME"
helmfile apply